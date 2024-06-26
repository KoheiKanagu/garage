import { RulesTestEnvironment, initializeTestEnvironment } from '@firebase/rules-unit-testing';
import { addDoc, collection, doc, getDoc, getDocs, setLogLevel } from 'firebase/firestore';
import { readFileSync, writeFileSync } from 'fs';
import { FeedbackComment, FeedbackData, FeedbackType } from '../src/models';
import { CollectionPaths } from '../src/utils/collection-paths';
import { expectFirestorePermissionDenied, expectFirestorePermissionSucceeds, getFirestoreCoverageMeta } from './utils/utils';

let testEnv: RulesTestEnvironment;
const PROJECT_ID = 'my-project';

beforeAll(async () => {
  setLogLevel('error');

  testEnv = await initializeTestEnvironment({
    projectId: PROJECT_ID,
    firestore: {
      rules: readFileSync(
        '../firestore/firestore.default.rules',
        'utf8',
      ),
      host: 'localhost',
      port: 8080,
    },
  });
});

beforeEach(async () => {
  await testEnv.clearFirestore();
});

afterAll(async () => {
  await testEnv.cleanup();

  const url = getFirestoreCoverageMeta(PROJECT_ID);
  const outPath = './firestore-coverage.html';

  const response = await fetch(url);
  const data = await response.text();

  writeFileSync(outPath, data);
});

function createFeedbackData(
  createdBy: string | null,
): FeedbackData {
  return {
    createdAt: null,
    updatedAt: null,
    createdBy: createdBy,
    email: 'email@example.com',
    from: 'configure',
    deviceInfo: {
      osVersion: 'osVersion',
      modelName: 'modelName',
      locale: 'locale',
      appVersion: 'appVersion',
      appPackageName: 'appPackageName',
      appName: 'appName',
    },
    type: FeedbackType.impression,
    typeLocalized: 'ご意見・ご感想について',
    status: 'open',
    notifyByEmail: true,
    notifyByPush: true,
  };
}

function createFeedbackCommentData(
  createdBy: string | null,
  feedbackId: string,
): FeedbackComment {
  return {
    createdAt: null,
    updatedAt: null,
    feedbackId: feedbackId,
    createdBy: createdBy,
    message: 'message',
    attachments: [],
  };
}

describe('feedbacks_v1', () => {
  const collectionPath = CollectionPaths.FEEDBACKS;

  describe('create', () => {
    it('createできること', async () => {
      const createdBy = 'user1';

      const db = testEnv
        .authenticatedContext(createdBy)
        .firestore();

      // 自分のdocumentは作成できる
      await expectFirestorePermissionSucceeds(
        addDoc(
          collection(db, collectionPath),
          createFeedbackData(createdBy),
        ),
      );

      // ユーザを偽って作成はできない
      await expectFirestorePermissionDenied(
        addDoc(
          collection(db, collectionPath),
          createFeedbackData('user2'),
        ),
      );
    });

    it('未認証ユーザがcreateできること', async () => {
      const unAuthDb = testEnv
        .unauthenticatedContext()
        .firestore();

      // 未認証でも作成できる
      await expectFirestorePermissionSucceeds(
        addDoc(
          collection(unAuthDb, collectionPath),
          createFeedbackData(null),
        ),
      );

      // ユーザを偽って作成はできない
      await expectFirestorePermissionDenied(
        addDoc(
          collection(unAuthDb, collectionPath),
          createFeedbackData('user1'),
        ),
      );
    });
  });

  describe('get', () => {
    it('documentがgetできること', async () => {
      const uid = 'user1';

      const db = testEnv
        .authenticatedContext(uid)
        .firestore();

      // documentを作成
      const documentId = await addDoc(
        collection(db, collectionPath),
        createFeedbackData(uid),
      ).then(docRef => docRef.id);

      // 自分のdocumentはgetできる
      await expectFirestorePermissionSucceeds(
        getDoc(doc(db, collectionPath, documentId)),
      );

      // 他人はgetできない
      const otherDb = testEnv
        .authenticatedContext('user2')
        .firestore();
      await expectFirestorePermissionDenied(
        getDoc(doc(otherDb, collectionPath, documentId)),
      );
    });

    it('未認証の場合はdocumentがgetできないこと', async () => {
      const uid = 'user1';

      const db = testEnv
        .authenticatedContext(uid)
        .firestore();

      // documentを作成
      const documentId = await addDoc(
        collection(db, collectionPath),
        createFeedbackData(uid),
      ).then(docRef => docRef.id);

      // 未認証ユーザはgetできない
      const unAuthDb = testEnv
        .unauthenticatedContext()
        .firestore();
      await expectFirestorePermissionDenied(
        getDoc(doc(unAuthDb, collectionPath, documentId)),
      );
    });
  });

  describe('list', () => {
    it('listできること', async () => {
      const uid = 'user1';

      const db = testEnv
        .authenticatedContext(uid)
        .firestore();

      // documentを作成
      await addDoc(
        collection(db, collectionPath),
        createFeedbackData(uid),
      );

      // 自分のdocumentはlistできる
      await expectFirestorePermissionSucceeds(
        getDocs(
          db
            .collection(collectionPath)
            .where('createdBy', '==', uid),
        ),
      );

      // 他人のdocumentはlistできない
      await expectFirestorePermissionDenied(
        getDocs(
          db
            .collection(collectionPath)
            .where('createdBy', '==', 'user2'),
        ),
      );

      // 他人はlistできない
      const otherDb = testEnv
        .authenticatedContext('user2')
        .firestore();
      await expectFirestorePermissionDenied(
        getDocs(
          otherDb
            .collection(collectionPath)
            .where('createdBy', '==', uid),
        ),
      );
    });

    it('未認証の場合はlistできないこと', async () => {
      // 未認証ユーザはlistできない
      const unAuthDb = testEnv
        .unauthenticatedContext()
        .firestore();

      await expectFirestorePermissionDenied(
        getDocs(
          unAuthDb
            .collection(collectionPath)
            .where('createdBy', '==', 'uid'),
        ),
      );
    });
  });
});

describe('feedbackComments_v1', () => {
  const collectionPath = CollectionPaths.FEEDBACK_COMMENTS;

  describe('create', () => {
    it('createできること', async () => {
      const uid = 'user1';

      const db = testEnv
        .authenticatedContext(uid)
        .firestore();

      // feedbackを作成
      const feedbackId = await addDoc(
        collection(db, CollectionPaths.FEEDBACKS),
        createFeedbackData(uid),
      ).then(docRef => docRef.id);

      // commentを作成できる
      await expectFirestorePermissionSucceeds(
        addDoc(
          collection(db, collectionPath),
          createFeedbackCommentData(uid, feedbackId),
        ),
      );

      // ユーザを偽って作成はできない
      await expectFirestorePermissionDenied(
        addDoc(
          collection(db, collectionPath),
          createFeedbackCommentData('user2', feedbackId),
        ),
      );
    });

    it('未認証ユーザがcreateできること', async () => {
      const unAuthDb = testEnv
        .unauthenticatedContext()
        .firestore();

      // feedbackを作成
      const feedbackId = await addDoc(
        collection(unAuthDb, CollectionPaths.FEEDBACKS),
        createFeedbackData(null),
      ).then(docRef => docRef.id);

      // commentを作成できる
      await expectFirestorePermissionSucceeds(
        addDoc(
          collection(unAuthDb, collectionPath),
          createFeedbackCommentData(null, feedbackId),
        ),
      );

      // ユーザを偽って作成はできない
      await expectFirestorePermissionDenied(
        addDoc(
          collection(unAuthDb, collectionPath),
          createFeedbackCommentData('user1', feedbackId),
        ),
      );
    });

    it('存在しないfeedbackにcommentをcreateできないこと', async () => {
      const uid = 'user1';

      const db = testEnv
        .authenticatedContext(uid)
        .firestore();

      // 存在しないfeedbackIdのcommentは作成できない
      await expectFirestorePermissionDenied(
        addDoc(
          collection(db, collectionPath),
          createFeedbackCommentData(uid, 'notExist'),
        ),
      );
    });

    it('他人のfeedbackにcommentをcreateできないこと', async () => {
      const uid = 'user1';

      const db = testEnv
        .authenticatedContext(uid)
        .firestore();

      // feedbackを作成
      const feedbackId = await addDoc(
        collection(db, CollectionPaths.FEEDBACKS),
        createFeedbackData(uid),
      ).then(docRef => docRef.id);

      // 他人のfeedbackにcommentは作成できない
      const otherUid = 'user2';
      const otherDb = testEnv
        .authenticatedContext(otherUid)
        .firestore();

      await expectFirestorePermissionDenied(
        addDoc(
          collection(otherDb, collectionPath),
          createFeedbackCommentData(otherUid, feedbackId),
        ),
      );
    });
  });
});
