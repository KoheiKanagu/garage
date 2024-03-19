import {
  assertFails,
  assertSucceeds,
} from '@firebase/rules-unit-testing';

// https://github.com/aws/aws-sdk-js-v3/issues/3063#issuecomment-1188564123
declare global {
  // eslint-disable-next-line @typescript-eslint/no-unused-vars
  interface ReadableStream<Uint8Array> {}
  interface ServiceWorkerRegistration {}
}

export function getFirestoreCoverageMeta(
  projectId: string
) {
  return `http://localhost:8080/emulator/v1/projects/${projectId}:ruleCoverage.html`;
}

export async function expectFirestorePermissionDenied(
  promise: Promise<unknown>
) {
  const errorResult = await assertFails(promise);
  expect(errorResult.code).toBe(
    'permission-denied' || 'PERMISSION_DENIED'
  );
}

export async function expectFirestorePermissionSucceeds(
  promise: Promise<unknown>
) {
  const successResult = await assertSucceeds(promise);
  expect(successResult).not.toBeUndefined();
}

// export async function expectFirestorePermissionGetSucceeds(
//   promise: Promise<unknown>
// ) {
//   const successResult = await assertSucceeds(promise);
//   expect(successResult).not.toBeUndefined();
// }
