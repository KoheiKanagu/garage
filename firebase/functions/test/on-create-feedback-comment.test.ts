import * as admin from 'firebase-admin';
import { Timestamp } from 'firebase-admin/firestore';
import { wrap } from 'firebase-functions-test/lib/main';
import { loadAdminSdk } from '../scripts/utils/load-admin-sdk';
import { UndefinedDocumentData } from '../src/errors/undefined-document-data';
import { FeedbackComment, FeedbackData, FeedbackType, Mail, MailTemplateNames } from '../src/models';
import { onCreateFeedbackComment } from '../src/on-create-feedback-comment';
import { CollectionPaths } from '../src/utils/collection-paths';
import { kDevProjectId, kSupportEmail } from '../src/utils/constants';
import { getFirebaseFunctionsTest } from './utils/get-firebase-functions-test';

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
    `${CollectionPaths.FEEDBACK_COMMENTS}/documentId`,
  ) as admin.firestore.DocumentSnapshot;

  const wrapped = wrap(targetFunction);
  await expect(
    wrapped({
      params: {
        documentId: 'documentId',
      },
      data: snapshot,
    }),
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
    `${CollectionPaths.FEEDBACK_COMMENTS}/documentId`,
  ) as admin.firestore.DocumentSnapshot;

  const wrapped = wrap(targetFunction);
  await expect(
    wrapped({
      params: {
        documentId: 'documentId',
      },
      data: snapshot,
    }),
  ).rejects.toThrow(UndefinedDocumentData);
});

describe('メール送信できること', () => {
  async function setupData(options: {
    email: string | null;
    notifyByEmail: boolean;
    attachments: [
      {
        path: string;
      }?,
    ];
  }): Promise<Mail> {
    // FeedbackDataを作成
    const feedbackData: FeedbackData = {
      createdAt: Timestamp.fromMillis(0),
      updatedAt: Timestamp.fromMillis(0),
      createdBy: 'user1',
      email: options.email,
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
      notifyByEmail: options.notifyByEmail,
      notifyByPush: true,
    };
    const feedbackDoc = await admin
      .firestore()
      .collection(CollectionPaths.FEEDBACKS)
      .add(feedbackData)
      .then(ref => ref.get());

    const feedbackId = feedbackDoc.id;

    // コメントを作成
    const feedbackComment: FeedbackComment = {
      createdAt: Timestamp.fromMillis(0),
      updatedAt: Timestamp.fromMillis(0),
      feedbackId: feedbackId,
      createdBy: feedbackData.createdBy,
      message: 'this is a test message',
      attachments: options.attachments,
    };

    const feedbackCommentDocumentId = feedbackId;

    // コメントのmock
    const snapshot = test.firestore.makeDocumentSnapshot(
      feedbackComment,
      `${CollectionPaths.FEEDBACK_COMMENTS}/${feedbackCommentDocumentId}`,
    ) as admin.firestore.DocumentSnapshot;

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
        `${CollectionPaths.MAILS}/${feedbackCommentDocumentId}`,
      )
      .get();
    expect(mailDoc.exists).toBe(true);

    return mailDoc.data() as Mail;
  }

  it('送信される', async () => {
    const actual = await setupData({
      email: 'email@example.com',
      notifyByEmail: true,
      attachments: [
        {
          path: 'attachments',
        },
      ],
    });

    expect(actual.to).toBe('email@example.com');
    expect(actual.cc).toBe(kSupportEmail);
    expect(actual.template.data.attachmentPath0).toBe(
      'attachments',
    );
  });

  it('送信される。添付ファイル無し', async () => {
    const actual = await setupData({
      email: 'email@example.com',
      notifyByEmail: true,
      attachments: [],
    });

    expect(actual.to).toBe('email@example.com');
    expect(actual.cc).toBe(kSupportEmail);
    expect(
      actual.template.data.attachmentPath0,
    ).toBeUndefined();
  });

  describe('notifyByEmailがfalse', () => {
    it('supportにだけメール送信されること', async () => {
      const actual = await setupData({
        email: 'email@example.com',
        notifyByEmail: false,
        attachments: [
          {
            path: 'attachments',
          },
        ],
      });

      expect(actual.to).toBeUndefined();
      expect(actual.cc).toBe(kSupportEmail);
      expect(actual.template.data.attachmentPath0).toBe(
        'attachments',
      );
    });

    it('supportにだけメール送信されること。添付ファイル無し', async () => {
      const actual = await setupData({
        email: 'email@example.com',
        notifyByEmail: false,
        attachments: [],
      });

      expect(actual.to).toBeUndefined();
      expect(actual.cc).toBe(kSupportEmail);
      expect(
        actual.template.data.attachmentPath0,
      ).toBeUndefined();
    });

    it('supportにだけメール送信されること。emailはnull', async () => {
      const actual = await setupData({
        email: null,
        notifyByEmail: false,
        attachments: [
          {
            path: 'attachments',
          },
        ],
      });

      expect(actual.to).toBeUndefined();
      expect(actual.cc).toBe(kSupportEmail);
      expect(actual.template.data.attachmentPath0).toBe(
        'attachments',
      );
    });

    it('supportにだけメール送信されること。emailはnull。添付ファイル無し', async () => {
      const actual = await setupData({
        email: null,
        notifyByEmail: false,
        attachments: [],
      });

      expect(actual.to).toBeUndefined();
      expect(actual.cc).toBe(kSupportEmail);
      expect(
        actual.template.data.attachmentPath0,
      ).toBeUndefined();
    });
  });

  describe('emailが無い', () => {
    it('emailがnullの場合、supportにだけメール送信されること', async () => {
      const actual = await setupData({
        email: null,
        notifyByEmail: true,
        attachments: [
          {
            path: 'attachments',
          },
        ],
      });

      expect(actual.to).toBeUndefined();
      expect(actual.cc).toBe(kSupportEmail);
      expect(actual.template.data.attachmentPath0).toBe(
        'attachments',
      );
    });

    it('emailがnullの場合、supportにだけメール送信されること。添付ファイル無し', async () => {
      const actual = await setupData({
        email: null,
        notifyByEmail: true,
        attachments: [],
      });

      expect(actual.to).toBeUndefined();
      expect(actual.cc).toBe(kSupportEmail);
      expect(
        actual.template.data.attachmentPath0,
      ).toBeUndefined();
    });

    it('emailが空の場合、supportにだけメール送信されること', async () => {
      const actual = await setupData({
        email: '',
        notifyByEmail: true,
        attachments: [
          {
            path: 'attachments',
          },
        ],
      });

      expect(actual.to).toBeUndefined();
      expect(actual.cc).toBe(kSupportEmail);
      expect(actual.template.data.attachmentPath0).toBe(
        'attachments',
      );
    });

    it('emailが空の場合、supportにだけメール送信されること。添付ファイル無し', async () => {
      const actual = await setupData({
        email: '',
        notifyByEmail: true,
        attachments: [],
      });

      expect(actual.to).toBeUndefined();
      expect(actual.cc).toBe(kSupportEmail);
      expect(
        actual.template.data.attachmentPath0,
      ).toBeUndefined();
    });
  });
});

describe('メールの言語', () => {
  async function setupData(options: {
    locale: string;
    attachments: [
      {
        path: string;
      }?,
    ];
  }): Promise<Mail> {
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
        locale: options.locale,
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
    const feedbackDoc = await admin
      .firestore()
      .collection(CollectionPaths.FEEDBACKS)
      .add(feedbackData)
      .then(ref => ref.get());

    const feedbackId = feedbackDoc.id;

    // コメントを作成
    const feedbackComment: FeedbackComment = {
      createdAt: Timestamp.fromMillis(0),
      updatedAt: Timestamp.fromMillis(0),
      feedbackId: feedbackId,
      createdBy: feedbackData.createdBy,
      message: 'this is a test message',
      attachments: options.attachments,
    };

    const feedbackCommentDocumentId = feedbackId;

    // コメントのmock
    const snapshot = test.firestore.makeDocumentSnapshot(
      feedbackComment,
      `${CollectionPaths.FEEDBACK_COMMENTS}/${feedbackCommentDocumentId}`,
    ) as admin.firestore.DocumentSnapshot;

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
        `${CollectionPaths.MAILS}/${feedbackCommentDocumentId}`,
      )
      .get();
    expect(mailDoc.exists).toBe(true);

    return mailDoc.data() as Mail;
  }

  it('言語が\'ja\'の場合、日本語のテンプレートが使われること', async () => {
    const attachment = {
      path: 'attachments',
    };

    const locales = ['ja_JP', 'ja'];

    for (const locale of locales) {
      const actual = await setupData({
        locale: locale,
        attachments: [attachment],
      });

      expect(actual.template.name).toBe(
        MailTemplateNames.NewFeedbackJa,
      );
      expect(actual.template.data.attachmentPath0).toBe(
        attachment.path,
      );
    }
  });

  it('言語が\'ja\'の場合、日本語のテンプレートが使われること。添付ファイル無し', async () => {
    const locales = ['ja_JP', 'ja'];

    for (const locale of locales) {
      const actual = await setupData({
        locale: locale,
        attachments: [],
      });

      expect(actual.template.name).toBe(
        MailTemplateNames.NewFeedbackJaNoAttachments,
      );
      expect(
        actual.template.data.attachmentPath0,
      ).toBeUndefined();
    }
  });

  it('言語が\'en\'の場合、英語のテンプレートが使われること', async () => {
    const attachment = {
      path: 'attachments',
    };

    const locales = ['en_US', 'en'];

    for (const locale of locales) {
      const actual = await setupData({
        locale: locale,
        attachments: [attachment],
      });

      expect(actual.template.name).toBe(
        MailTemplateNames.NewFeedbackEn,
      );
      expect(actual.template.data.attachmentPath0).toBe(
        attachment.path,
      );
    }
  });

  it('言語が\'en\'の場合、英語のテンプレートが使われること。添付ファイル無し', async () => {
    const locales = ['en_US', 'en'];

    for (const locale of locales) {
      const actual = await setupData({
        locale: locale,
        attachments: [],
      });

      expect(actual.template.name).toBe(
        MailTemplateNames.NewFeedbackEnNoAttachments,
      );
      expect(
        actual.template.data.attachmentPath0,
      ).toBeUndefined();
    }
  });

  it('その他の言語の場合、英語のテンプレートが使われること', async () => {
    const attachment = {
      path: 'attachments',
    };

    const locales = ['zh_CN', 'zh_TW', 'ko_KR'];

    for (const locale of locales) {
      const actual = await setupData({
        locale: locale,
        attachments: [attachment],
      });

      expect(actual.template.name).toBe(
        MailTemplateNames.NewFeedbackEn,
      );
      expect(actual.template.data.attachmentPath0).toBe(
        attachment.path,
      );
    }
  });

  it('その他の言語の場合、英語のテンプレートが使われること。添付ファイル無し', async () => {
    const locales = ['zh_CN', 'zh_TW', 'ko_KR'];

    for (const locale of locales) {
      const actual = await setupData({
        locale: locale,
        attachments: [],
      });

      expect(actual.template.name).toBe(
        MailTemplateNames.NewFeedbackEnNoAttachments,
      );
      expect(
        actual.template.data.attachmentPath0,
      ).toBeUndefined();
    }
  });

  it('不明な言語の場合、英語のテンプレートが使われること', async () => {
    const attachment = {
      path: 'attachments',
    };

    const locales = ['unknown', ''];

    for (const locale of locales) {
      const actual = await setupData({
        locale: locale,
        attachments: [attachment],
      });

      expect(actual.template.name).toBe(
        MailTemplateNames.NewFeedbackEn,
      );
      expect(actual.template.data.attachmentPath0).toBe(
        attachment.path,
      );
    }
  });

  it('不明な言語の場合、英語のテンプレートが使われること。添付ファイル無し', async () => {
    const locales = ['unknown', ''];

    for (const locale of locales) {
      const actual = await setupData({
        locale: locale,
        attachments: [],
      });

      expect(actual.template.name).toBe(
        MailTemplateNames.NewFeedbackEnNoAttachments,
      );
      expect(
        actual.template.data.attachmentPath0,
      ).toBeUndefined();
    }
  });
});
