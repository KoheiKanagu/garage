import * as admin from 'firebase-admin';

export function loadAdminSdkForEmulators() {
  process.env.FIREBASE_AUTH_EMULATOR_HOST = '127.0.0.1:9099';
  process.env.FIRESTORE_EMULATOR_HOST = '127.0.0.1:8080';

  admin.initializeApp({
    projectId: 'kingu-garage-dev',
  });
}
