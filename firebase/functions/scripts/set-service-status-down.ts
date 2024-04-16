import { FieldValue } from 'firebase-admin/firestore';
import { loadAdminSdk } from './utils/load-admin-sdk';
import { updateServiceStatus } from './utils/update-service-status';

void (async () => {
  await loadAdminSdk();

  await updateServiceStatus({
    status: 'down',
    updatedAt: FieldValue.serverTimestamp(),
  });
})();
