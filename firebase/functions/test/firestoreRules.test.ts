import {
  RulesTestEnvironment,
  initializeTestEnvironment,
} from '@firebase/rules-unit-testing';
import {
  addDoc,
  doc,
  getDoc,
  getDocs,
  setLogLevel,
} from 'firebase/firestore';
import { readFileSync, writeFileSync } from 'fs';
import { CollectionPaths } from '../src/utils/collection_paths';
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
      rules: readFileSync(
        '../firestore/firestore.default.rules',
        'utf8'
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

describe('feedbacks_v1', () => {
  const collectionPath = CollectionPaths.FEEDBACKS;

  it('誰でもcreateできること', () => {
    const db = testEnv
      .authenticatedContext('user1')
      .firestore();
    expectFirestorePermissionSucceeds(
      addDoc(db.collection(collectionPath), {
        createdBy: 'user1',
      })
    );

    const unAuthDb = testEnv
      .unauthenticatedContext()
      .firestore();
    expectFirestorePermissionSucceeds(
      addDoc(unAuthDb.collection(collectionPath), {
        createdBy: 'user1',
      })
    );
  });
});

describe('feedbackComments_v1', () => {
  const collectionPath = CollectionPaths.FEEDBACK_COMMENTS;

  describe('get', () => {
    it('should not be able to get', async () => {
      const documentId = 'doc1';

      const db = testEnv
        .authenticatedContext('user1')
        .firestore();
      expectFirestorePermissionDenied(
        getDoc(doc(db, collectionPath, documentId))
      );

      const unAuthDb = testEnv
        .unauthenticatedContext()
        .firestore();
      expectFirestorePermissionDenied(
        getDoc(doc(unAuthDb, collectionPath, documentId))
      );
    });

    it('should not be able to list', async () => {
      const db = testEnv
        .authenticatedContext('user1')
        .firestore();
      expectFirestorePermissionDenied(
        getDocs(db.collection(collectionPath))
      );

      const unAuthDb = testEnv
        .unauthenticatedContext()
        .firestore();
      expectFirestorePermissionDenied(
        getDocs(unAuthDb.collection(collectionPath))
      );
    });
  });
});
