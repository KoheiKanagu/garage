import * as admin from 'firebase-admin';
import * as fs from 'firebase-admin/firestore';
import * as f from 'firebase-functions';
import { setGlobalOptions } from 'firebase-functions/v2';
import { tenantIdToDatabaseId } from './utils/tenant-id-to-database-id';

const app = admin.initializeApp();

export function initializeAuth(
  tenantId: string,
): admin.auth.TenantAwareAuth {
  return app.auth().tenantManager().authForTenant(tenantId);
}

export function initializeFirestore(
  tenantId: string | null,
): admin.firestore.Firestore {
  if (tenantId) {
    return fs.initializeFirestore(
      app,
      {
        preferRest: true,
      },
      tenantIdToDatabaseId(tenantId),
    );
  }

  return fs.initializeFirestore(app, {
    preferRest: true,
  });
}

// for v2
setGlobalOptions({
  region: 'asia-northeast1',
  minInstances: 0,
  timeoutSeconds: 10,
  memory: '256MiB',
  enforceAppCheck: true,
});

// for v1
export function functions(): f.FunctionBuilder {
  return f
    .runWith({
      memory: '256MB',
      timeoutSeconds: 10,
      failurePolicy: true,
      enforceAppCheck: true,
    })
    .region('asia-northeast1');
}

export { deleteUser } from './delete-user';
export { onCreateAuthUser } from './on-create-auth-user';
export { onCreateFeedbackComment } from './on-create-feedback-comment';
