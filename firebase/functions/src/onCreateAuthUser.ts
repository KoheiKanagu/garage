import { FieldValue } from 'firebase-admin/firestore';
import { logger } from 'firebase-functions/v1';
import { functions, initializeFirestore } from '.';
import { User } from './models';
import { CollectionPaths } from './utils/collection_paths';

export const onCreateAuthUser = functions()
  .auth.user()
  .onCreate(async (user, context) => {
    logger.info('uid', user.uid);

    const eventAgeMs =
      Date.now() - Date.parse(context.timestamp);
    const eventMaxAgeMs = 1000 * 60 * 3; // 3分
    if (eventAgeMs > eventMaxAgeMs) {
      logger.error('Event is too old to process.');
      return;
    }

    const tenantId = user.tenantId;
    if (!tenantId) {
      throw new Error('tenantId is not found');
    }

    const firestore = initializeFirestore(tenantId);

    const data: User = {
      createdAt: FieldValue.serverTimestamp(),
      updatedAt: FieldValue.serverTimestamp(),
      deleted: false,
    };

    await firestore
      .collection(CollectionPaths.USERS) //
      .doc(user.uid)
      .create(data)
      .catch(error => {
        logger.warn(error);
      });
  });
