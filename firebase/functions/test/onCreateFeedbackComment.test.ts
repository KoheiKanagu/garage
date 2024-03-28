import * as admin from 'firebase-admin';
import { Timestamp } from 'firebase-admin/firestore';
import { wrap } from 'firebase-functions-test/lib/main';
import { loadAdminSdk } from '../scripts/utils/load_admin_sdk';
import { UndefinedDocumentData } from '../src/errors/undefined_document_data';
import {
  FeedbackComment,
  FeedbackData,
  FeedbackType,
  Mail,
  MailTemplateNames,
} from '../src/models';
import { onCreateFeedbackComment } from '../src/onCreateFeedbackComment';
import { CollectionPaths } from '../src/utils/collection_paths';
import {
  kDevProjectId,
  kSupportEmail,
} from '../src/utils/constants';
import { getFirebaseFunctionsTest } from './utils/getFirebaseFunctionsTest';

const targetFunction = onCreateFeedbackComment;
const test = getFirebaseFunctionsTest();

beforeAll(async () => {
  await loadAdminSdk({
    connectToEmulator: true,
  });
});

afterEach(async () => {
  test.cleanup();
  await test.firestore.clearFirestoreData({
    projectId: kDevProjectId,
  });
});

it('dataがundefinedの場合、UndefinedDocumentDataエラーが発生すること', async () => {
  const snapshot = test.firestore.makeDocumentSnapshot(
    {},
    `${CollectionPaths.FEEDBACK_COMMENTS}/documentId`
  );

  const wrapped = wrap(targetFunction);
  await expect(
    wrapped({
      params: {
        documentId: 'documentId',
      },
      data: snapshot,
    })
  ).rejects.toThrow(UndefinedDocumentData);
});

it('feedbackDataがundefinedの場合、UndefinedDocumentDataエラーが発生すること', async () => {
  const feedbackComment: FeedbackComment = {
    createdAt: Timestamp.fromMillis(0),
    updatedAt: Timestamp.fromMillis(0),
    feedbackId: 'feedbackId',
    createdBy: 'user1',
    message: 'this is a test message',
    attachments: [
      {
        path: 'attachments',
      },
    ],
  };

  const snapshot = test.firestore.makeDocumentSnapshot(
    feedbackComment,
    `${CollectionPaths.FEEDBACK_COMMENTS}/documentId`
  );

  const wrapped = wrap(targetFunction);
  await expect(
    wrapped({
      params: {
        documentId: 'documentId',
      },
      data: snapshot,
    })
  ).rejects.toThrow(UndefinedDocumentData);
});

it('notifyByEmailがfalseの場合、supportにだけメール送信されること', async () => {
  const feedbackData: FeedbackData = {
    createdAt: Timestamp.fromMillis(0),
    updatedAt: Timestamp.fromMillis(0),
    createdBy: 'user1',
    email: 'email@example.com',
    from: 'configure',
    deviceInfo: {
      osVersion: '1.0',
      modelName: 'model1',
      locale: 'ja_JP',
      appVersion: '1.0',
      appPackageName: 'com.example.app',
      appName: 'app1',
    },
    type: FeedbackType.impression,
    typeLocalized: 'ご意見・ご感想について',
    status: 'open',
    notifyByEmail: false,
    notifyByPush: true,
  };
  const feedbackId = await admin
    .firestore()
    .collection(CollectionPaths.FEEDBACKS)
    .add(feedbackData)
    .then(ref => ref.id);

  const feedbackComment: FeedbackComment = {
    createdAt: Timestamp.fromMillis(0),
    updatedAt: Timestamp.fromMillis(0),
    feedbackId: feedbackId,
    createdBy: feedbackData.createdBy,
    message: 'this is a test message',
    attachments: [
      {
        path: 'attachments',
      },
    ],
  };
  const feedbackCommentDocumentId = feedbackId;

  const snapshot = test.firestore.makeDocumentSnapshot(
    feedbackComment,
    `${CollectionPaths.FEEDBACK_COMMENTS}/${feedbackCommentDocumentId}`
  );

  const wrapped = wrap(targetFunction);
  await wrapped({
    params: {
      documentId: feedbackCommentDocumentId,
    },
    data: snapshot,
  });

  const mailDoc = await admin
    .firestore()
    .doc(
      `${CollectionPaths.MAILS}/${feedbackCommentDocumentId}`
    )
    .get();
  expect(mailDoc.exists).toBe(true);

  const expected: Mail = {
    cc: kSupportEmail,
    message: {
      messageId: `${feedbackId}@kingu.dev`,
    },
    template: {
      name: MailTemplateNames.NewFeedbackJa,
      data: {
        attachmentPath0:
          feedbackComment.attachments[0]!.path,
        appName: feedbackData.deviceInfo.appName,
        feedbackId: feedbackId,
        message: feedbackComment.message,
        type: feedbackData.typeLocalized,
      },
    },
  };

  expect(mailDoc.data()).toEqual(expected);
});

it('emailがnullの場合、supportにだけメール送信されること', async () => {
  const feedbackData: FeedbackData = {
    createdAt: Timestamp.fromMillis(0),
    updatedAt: Timestamp.fromMillis(0),
    createdBy: 'user1',
    email: null,
    from: 'configure',
    deviceInfo: {
      osVersion: '1.0',
      modelName: 'model1',
      locale: 'ja_JP',
      appVersion: '1.0',
      appPackageName: 'com.example.app',
      appName: 'app1',
    },
    type: FeedbackType.impression,
    typeLocalized: 'ご意見・ご感想について',
    status: 'open',
    notifyByEmail: true,
    notifyByPush: true,
  };
  const feedbackId = await admin
    .firestore()
    .collection(CollectionPaths.FEEDBACKS)
    .add(feedbackData)
    .then(ref => ref.id);

  const feedbackComment: FeedbackComment = {
    createdAt: Timestamp.fromMillis(0),
    updatedAt: Timestamp.fromMillis(0),
    feedbackId: feedbackId,
    createdBy: feedbackData.createdBy,
    message: 'this is a test message',
    attachments: [
      {
        path: 'attachments',
      },
    ],
  };
  const feedbackCommentDocumentId = feedbackId;

  const snapshot = test.firestore.makeDocumentSnapshot(
    feedbackComment,
    `${CollectionPaths.FEEDBACK_COMMENTS}/${feedbackCommentDocumentId}`
  );

  const wrapped = wrap(targetFunction);
  await wrapped({
    params: {
      documentId: feedbackCommentDocumentId,
    },
    data: snapshot,
  });

  const mailDoc = await admin
    .firestore()
    .doc(
      `${CollectionPaths.MAILS}/${feedbackCommentDocumentId}`
    )
    .get();
  expect(mailDoc.exists).toBe(true);

  const expected: Mail = {
    cc: kSupportEmail,
    message: {
      messageId: `${feedbackId}@kingu.dev`,
    },
    template: {
      name: MailTemplateNames.NewFeedbackJa,
      data: {
        attachmentPath0:
          feedbackComment.attachments[0]!.path,
        appName: feedbackData.deviceInfo.appName,
        feedbackId: feedbackId,
        message: feedbackComment.message,
        type: feedbackData.typeLocalized,
      },
    },
  };

  expect(mailDoc.data()).toEqual(expected);
});

it('emailがemptyの場合、supportにだけメール送信されること', async () => {
  const feedbackData: FeedbackData = {
    createdAt: Timestamp.fromMillis(0),
    updatedAt: Timestamp.fromMillis(0),
    createdBy: 'user1',
    email: '',
    from: 'configure',
    deviceInfo: {
      osVersion: '1.0',
      modelName: 'model1',
      locale: 'ja_JP',
      appVersion: '1.0',
      appPackageName: 'com.example.app',
      appName: 'app1',
    },
    type: FeedbackType.impression,
    typeLocalized: 'ご意見・ご感想について',
    status: 'open',
    notifyByEmail: true,
    notifyByPush: true,
  };
  const feedbackId = await admin
    .firestore()
    .collection(CollectionPaths.FEEDBACKS)
    .add(feedbackData)
    .then(ref => ref.id);

  const feedbackComment: FeedbackComment = {
    createdAt: Timestamp.fromMillis(0),
    updatedAt: Timestamp.fromMillis(0),
    feedbackId: feedbackId,
    createdBy: feedbackData.createdBy,
    message: 'this is a test message',
    attachments: [
      {
        path: 'attachments',
      },
    ],
  };
  const feedbackCommentDocumentId = feedbackId;

  const snapshot = test.firestore.makeDocumentSnapshot(
    feedbackComment,
    `${CollectionPaths.FEEDBACK_COMMENTS}/${feedbackCommentDocumentId}`
  );

  const wrapped = wrap(targetFunction);
  await wrapped({
    params: {
      documentId: feedbackCommentDocumentId,
    },
    data: snapshot,
  });

  const mailDoc = await admin
    .firestore()
    .doc(
      `${CollectionPaths.MAILS}/${feedbackCommentDocumentId}`
    )
    .get();
  expect(mailDoc.exists).toBe(true);

  const expected: Mail = {
    cc: kSupportEmail,
    message: {
      messageId: `${feedbackId}@kingu.dev`,
    },
    template: {
      name: MailTemplateNames.NewFeedbackJa,
      data: {
        attachmentPath0:
          feedbackComment.attachments[0]!.path,
        appName: feedbackData.deviceInfo.appName,
        feedbackId: feedbackId,
        message: feedbackComment.message,
        type: feedbackData.typeLocalized,
      },
    },
  };

  expect(mailDoc.data()).toEqual(expected);
});

it("言語が'en'の場合、英語のテンプレートが使われること", async () => {
  // FeedbackDataを作成
  const feedbackData: FeedbackData = {
    createdAt: Timestamp.fromMillis(0),
    updatedAt: Timestamp.fromMillis(0),
    createdBy: 'user1',
    email: 'email@example.com',
    from: 'configure',
    deviceInfo: {
      osVersion: '1.0',
      modelName: 'model1',
      locale: 'en_US',
      appVersion: '1.0',
      appPackageName: 'com.example.app',
      appName: 'app1',
    },
    type: FeedbackType.impression,
    typeLocalized: 'ご意見・ご感想について',
    status: 'open',
    notifyByEmail: true,
    notifyByPush: true,
  };
  const feedbackId = await admin
    .firestore()
    .collection(CollectionPaths.FEEDBACKS)
    .add(feedbackData)
    .then(ref => ref.id);

  // コメントを作成
  const feedbackComment: FeedbackComment = {
    createdAt: Timestamp.fromMillis(0),
    updatedAt: Timestamp.fromMillis(0),
    feedbackId: feedbackId,
    createdBy: feedbackData.createdBy,
    message: 'this is a test message',
    attachments: [
      {
        path: 'attachments',
      },
    ],
  };

  const feedbackCommentDocumentId = feedbackId;

  // コメントのmock
  const snapshot = test.firestore.makeDocumentSnapshot(
    feedbackComment,
    `${CollectionPaths.FEEDBACK_COMMENTS}/${feedbackCommentDocumentId}`
  );

  // onDocumentCreated
  const wrapped = wrap(targetFunction);
  await wrapped({
    params: {
      documentId: feedbackCommentDocumentId,
    },
    data: snapshot,
  });

  // expect
  const mailDoc = await admin
    .firestore()
    .doc(
      `${CollectionPaths.MAILS}/${feedbackCommentDocumentId}`
    )
    .get();
  expect(mailDoc.exists).toBe(true);

  const expected: Mail = {
    to: feedbackData.email!,
    cc: kSupportEmail,
    message: {
      messageId: `${feedbackId}@kingu.dev`,
    },
    template: {
      name: MailTemplateNames.NewFeedbackEn,
      data: {
        attachmentPath0:
          feedbackComment.attachments[0]!.path,
        appName: feedbackData.deviceInfo.appName,
        feedbackId: feedbackId,
        message: feedbackComment.message,
        type: feedbackData.typeLocalized,
      },
    },
  };
  expect(mailDoc.data()).toEqual(expected);
});

it("言語が'en'の場合、英語のテンプレートが使われること。添付ファイル無し", async () => {
  // FeedbackDataを作成
  const feedbackData: FeedbackData = {
    createdAt: Timestamp.fromMillis(0),
    updatedAt: Timestamp.fromMillis(0),
    createdBy: 'user1',
    email: 'email@example.com',
    from: 'configure',
    deviceInfo: {
      osVersion: '1.0',
      modelName: 'model1',
      locale: 'en_US',
      appVersion: '1.0',
      appPackageName: 'com.example.app',
      appName: 'app1',
    },
    type: FeedbackType.impression,
    typeLocalized: 'ご意見・ご感想について',
    status: 'open',
    notifyByEmail: true,
    notifyByPush: true,
  };
  const feedbackId = await admin
    .firestore()
    .collection(CollectionPaths.FEEDBACKS)
    .add(feedbackData)
    .then(ref => ref.id);

  // コメントを作成
  const feedbackComment: FeedbackComment = {
    createdAt: Timestamp.fromMillis(0),
    updatedAt: Timestamp.fromMillis(0),
    feedbackId: feedbackId,
    createdBy: feedbackData.createdBy,
    message: 'this is a test message',
    // 添付ファイル無し
    attachments: [],
  };

  const feedbackCommentDocumentId = feedbackId;

  // コメントのmock
  const snapshot = test.firestore.makeDocumentSnapshot(
    feedbackComment,
    `${CollectionPaths.FEEDBACK_COMMENTS}/${feedbackCommentDocumentId}`
  );

  // onDocumentCreated
  const wrapped = wrap(targetFunction);
  await wrapped({
    params: {
      documentId: feedbackCommentDocumentId,
    },
    data: snapshot,
  });

  // expect
  const mailDoc = await admin
    .firestore()
    .doc(
      `${CollectionPaths.MAILS}/${feedbackCommentDocumentId}`
    )
    .get();
  expect(mailDoc.exists).toBe(true);

  const expected: Mail = {
    to: feedbackData.email!,
    cc: kSupportEmail,
    message: {
      messageId: `${feedbackId}@kingu.dev`,
    },
    template: {
      // 添付ファイル無し
      name: MailTemplateNames.NewFeedbackEnNoAttachments,
      data: {
        appName: feedbackData.deviceInfo.appName,
        feedbackId: feedbackId,
        message: feedbackComment.message,
        type: feedbackData.typeLocalized,
      },
    },
  };
  expect(mailDoc.data()).toEqual(expected);
});

it('不明な言語の場合、英語のテンプレートが使われること', async () => {
  // FeedbackDataを作成
  const feedbackData: FeedbackData = {
    createdAt: Timestamp.fromMillis(0),
    updatedAt: Timestamp.fromMillis(0),
    createdBy: 'user1',
    email: 'email@example.com',
    from: 'configure',
    deviceInfo: {
      osVersion: '1.0',
      modelName: 'model1',
      locale: 'foobar',
      appVersion: '1.0',
      appPackageName: 'com.example.app',
      appName: 'app1',
    },
    type: FeedbackType.impression,
    typeLocalized: 'ご意見・ご感想について',
    status: 'open',
    notifyByEmail: true,
    notifyByPush: true,
  };
  const feedbackId = await admin
    .firestore()
    .collection(CollectionPaths.FEEDBACKS)
    .add(feedbackData)
    .then(ref => ref.id);

  // コメントを作成
  const feedbackComment: FeedbackComment = {
    createdAt: Timestamp.fromMillis(0),
    updatedAt: Timestamp.fromMillis(0),
    feedbackId: feedbackId,
    createdBy: feedbackData.createdBy,
    message: 'this is a test message',
    // 添付ファイル無し
    attachments: [],
  };

  const feedbackCommentDocumentId = feedbackId;

  // コメントのmock
  const snapshot = test.firestore.makeDocumentSnapshot(
    feedbackComment,
    `${CollectionPaths.FEEDBACK_COMMENTS}/${feedbackCommentDocumentId}`
  );

  // onDocumentCreated
  const wrapped = wrap(targetFunction);
  await wrapped({
    params: {
      documentId: feedbackCommentDocumentId,
    },
    data: snapshot,
  });

  // expect
  const mailDoc = await admin
    .firestore()
    .doc(
      `${CollectionPaths.MAILS}/${feedbackCommentDocumentId}`
    )
    .get();
  expect(mailDoc.exists).toBe(true);

  const expected: Mail = {
    to: feedbackData.email!,
    cc: kSupportEmail,
    message: {
      messageId: `${feedbackId}@kingu.dev`,
    },
    template: {
      // 添付ファイル無し
      name: MailTemplateNames.NewFeedbackEnNoAttachments,
      data: {
        appName: feedbackData.deviceInfo.appName,
        feedbackId: feedbackId,
        message: feedbackComment.message,
        type: feedbackData.typeLocalized,
      },
    },
  };
  expect(mailDoc.data()).toEqual(expected);
});

it('メール送信できること', async () => {
  // FeedbackDataを作成
  const feedbackData: FeedbackData = {
    createdAt: Timestamp.fromMillis(0),
    updatedAt: Timestamp.fromMillis(0),
    createdBy: 'user1',
    email: 'email@example.com',
    from: 'configure',
    deviceInfo: {
      osVersion: '1.0',
      modelName: 'model1',
      locale: 'ja_JP',
      appVersion: '1.0',
      appPackageName: 'com.example.app',
      appName: 'app1',
    },
    type: FeedbackType.impression,
    typeLocalized: 'ご意見・ご感想について',
    status: 'open',
    notifyByEmail: true,
    notifyByPush: true,
  };
  const feedbackId = await admin
    .firestore()
    .collection(CollectionPaths.FEEDBACKS)
    .add(feedbackData)
    .then(ref => ref.id);

  // コメントを作成
  const feedbackComment: FeedbackComment = {
    createdAt: Timestamp.fromMillis(0),
    updatedAt: Timestamp.fromMillis(0),
    feedbackId: feedbackId,
    createdBy: feedbackData.createdBy,
    message: 'this is a test message',
    attachments: [
      {
        path: 'attachments',
      },
    ],
  };

  const feedbackCommentDocumentId = feedbackId;

  // コメントのmock
  const snapshot = test.firestore.makeDocumentSnapshot(
    feedbackComment,
    `${CollectionPaths.FEEDBACK_COMMENTS}/${feedbackCommentDocumentId}`
  );

  // onDocumentCreated
  const wrapped = wrap(targetFunction);
  await wrapped({
    params: {
      documentId: feedbackCommentDocumentId,
    },
    data: snapshot,
  });

  // expect
  const mailDoc = await admin
    .firestore()
    .doc(
      `${CollectionPaths.MAILS}/${feedbackCommentDocumentId}`
    )
    .get();
  expect(mailDoc.exists).toBe(true);

  const expected: Mail = {
    to: feedbackData.email!,
    cc: kSupportEmail,
    message: {
      messageId: `${feedbackId}@kingu.dev`,
    },
    template: {
      name: MailTemplateNames.NewFeedbackJa,
      data: {
        attachmentPath0:
          feedbackComment.attachments[0]!.path,
        appName: feedbackData.deviceInfo.appName,
        feedbackId: feedbackId,
        message: feedbackComment.message,
        type: feedbackData.typeLocalized,
      },
    },
  };
  expect(mailDoc.data()).toEqual(expected);
});

it('メール送信できること。添付ファイル無し', async () => {
  // FeedbackDataを作成
  const feedbackData: FeedbackData = {
    createdAt: Timestamp.fromMillis(0),
    updatedAt: Timestamp.fromMillis(0),
    createdBy: 'user1',
    email: 'email@example.com',
    from: 'configure',
    deviceInfo: {
      osVersion: '1.0',
      modelName: 'model1',
      locale: 'ja_JP',
      appVersion: '1.0',
      appPackageName: 'com.example.app',
      appName: 'app1',
    },
    type: FeedbackType.impression,
    typeLocalized: 'ご意見・ご感想について',
    status: 'open',
    notifyByEmail: true,
    notifyByPush: true,
  };
  const feedbackId = await admin
    .firestore()
    .collection(CollectionPaths.FEEDBACKS)
    .add(feedbackData)
    .then(ref => ref.id);

  // コメントを作成
  const feedbackComment: FeedbackComment = {
    createdAt: Timestamp.fromMillis(0),
    updatedAt: Timestamp.fromMillis(0),
    feedbackId: feedbackId,
    createdBy: feedbackData.createdBy,
    message: 'this is a test message',
    attachments: [],
  };

  const feedbackCommentDocumentId = feedbackId;

  // コメントのmock
  const snapshot = test.firestore.makeDocumentSnapshot(
    feedbackComment,
    `${CollectionPaths.FEEDBACK_COMMENTS}/${feedbackCommentDocumentId}`
  );

  // onDocumentCreated
  const wrapped = wrap(targetFunction);
  await wrapped({
    params: {
      documentId: feedbackCommentDocumentId,
    },
    data: snapshot,
  });

  // expect
  const mailDoc = await admin
    .firestore()
    .doc(
      `${CollectionPaths.MAILS}/${feedbackCommentDocumentId}`
    )
    .get();
  expect(mailDoc.exists).toBe(true);

  const expected: Mail = {
    to: feedbackData.email!,
    cc: kSupportEmail,
    message: {
      messageId: `${feedbackId}@kingu.dev`,
    },
    template: {
      // 添付ファイル無し
      name: MailTemplateNames.NewFeedbackJaNoAttachments,
      data: {
        appName: feedbackData.deviceInfo.appName,
        feedbackId: feedbackId,
        message: feedbackComment.message,
        type: feedbackData.typeLocalized,
      },
    },
  };
  expect(mailDoc.data()).toEqual(expected);
});
