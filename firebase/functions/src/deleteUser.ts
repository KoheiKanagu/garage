import {FieldValue} from 'firebase-admin/firestore';

import {logger} from 'firebase-functions/v2';
import {onCall} from 'firebase-functions/v2/https';

import {initializeAuth, initializeFirestore} from '.';
import {CollectionPaths} from './utils/collection_paths';

export const deleteUser = onCall(async request => {
  const uid = request.auth?.uid;
  if (!uid) {
    throw new Error('uid is not found');
  }

  const tenantId = request.auth?.token.firebase.tenant;
  if (!tenantId) {
    throw new Error('tenantId is not found');
  }

  logger.info(`tenantId: ${tenantId}, uid: ${uid}`);

  const tenantAuth = initializeAuth(tenantId);
  await tenantAuth.deleteUser(uid);

  const firestore = initializeFirestore(tenantId);
  await firestore.runTransaction(transaction => {
    transaction.update(
      firestore.collection(CollectionPaths.USERS).doc(uid), //
      {
        updatedAt: FieldValue.serverTimestamp(),
        deleted: true,
      }
    );
    return Promise.resolve();
  });
});
