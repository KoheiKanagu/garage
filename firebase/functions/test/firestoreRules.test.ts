import {addDoc, doc, getDoc, setLogLevel} from '@firebase/firestore';
import {
  RulesTestEnvironment,
  initializeTestEnvironment,
} from '@firebase/rules-unit-testing';
import {readFileSync, writeFileSync} from 'node:fs';
import {describe} from 'node:test';
import {CollectionPaths} from '../src/utils/collection_paths';
import {
  expectFirestorePermissionDenied,
  expectFirestorePermissionSucceeds,
  getFirestoreCoverageMeta,
} from './utils/utils';

let testEnv: RulesTestEnvironment;
const PROJECT_ID = 'my-project';

beforeAll(async () => {
  setLogLevel('error');

  testEnv = await initializeTestEnvironment({
    projectId: PROJECT_ID,
    firestore: {
      rules: readFileSync('../firestore/firestore.default.rules', 'utf8'),
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

describe('feedbacks_v1', () => {
  const collectionPath = CollectionPaths.FEEDBACKS;

  it('誰でもcreateできること', () => {
    const db = testEnv.authenticatedContext('user1').firestore();
    expectFirestorePermissionSucceeds(
      addDoc(db.collection(collectionPath), {createdBy: 'user1'})
    );

    const unAuthDb = testEnv.unauthenticatedContext().firestore();
    expectFirestorePermissionSucceeds(
      addDoc(unAuthDb.collection(collectionPath), {createdBy: 'user1'})
    );
  });
});

describe('feedbackComments_v1', () => {
  const collectionPath = CollectionPaths.FEEDBACK_COMMENTS;

  describe('get', () => {
    it('should not be able to get', async () => {
      const documentId = 'doc1';

      const db = testEnv.authenticatedContext('user1').firestore();
      expectFirestorePermissionDenied(
        getDoc(doc(db, collectionPath, documentId))
      );

      const unAuthDb = testEnv.unauthenticatedContext().firestore();
      expectFirestorePermissionDenied(
        getDoc(doc(unAuthDb, collectionPath, documentId))
      );
    });

    it('should not be able to list', async () => {
      const db = testEnv.authenticatedContext('user1').firestore();
      expectFirestorePermissionDenied(db.collection(collectionPath).get());

      const unAuthDb = testEnv.unauthenticatedContext().firestore();
      expectFirestorePermissionDenied(
        unAuthDb.collection(collectionPath).get()
      );
    });

    it('should not be able to delete', async () => {
      const documentId = 'doc1';

      const db = testEnv.authenticatedContext('user1').firestore();
      expectFirestorePermissionDenied(
        db.collection(collectionPath).doc(documentId).delete()
      );

      const unAuthDb = testEnv.unauthenticatedContext().firestore();
      expectFirestorePermissionDenied(
        unAuthDb.collection(collectionPath).doc(documentId).delete()
      );
    });

    it('should not be able to update', async () => {
      const documentId = 'doc1';
      await testEnv.withSecurityRulesDisabled(async context => {
        await context
          .firestore()
          .doc(`${collectionPath}/${documentId}`)
          .set({createdBy: 'user1'});
      });

      const db = testEnv.authenticatedContext('user1').firestore();
      expectFirestorePermissionDenied(
        db.collection(collectionPath).doc(documentId).set({field: 'value'})
      );

      const unAuthDb = testEnv.unauthenticatedContext().firestore();
      expectFirestorePermissionDenied(
        unAuthDb
          .collection(collectionPath)
          .doc(documentId)
          .set({field: 'value'})
      );
    });
  });
});
