import {assertFails, assertSucceeds} from '@firebase/rules-unit-testing';

export function getFirestoreCoverageMeta(projectId: string) {
  return `http://localhost:8080/emulator/v1/projects/${projectId}:ruleCoverage.html`;
}

export async function expectFirestorePermissionDenied(
  promise: Promise<unknown>
) {
  const errorResult = await assertFails(promise);
  expect(errorResult.code).toBe('permission-denied' || 'PERMISSION_DENIED');
}

export async function expectFirestorePermissionUpdateSucceeds(
  promise: Promise<unknown>
) {
  const successResult = await assertSucceeds(promise);
  expect(successResult).toBeUndefined();
}

export async function expectFirestorePermissionGetSucceeds(
  promise: Promise<unknown>
) {
  const successResult = await assertSucceeds(promise);
  expect(successResult).not.toBeUndefined();
}
