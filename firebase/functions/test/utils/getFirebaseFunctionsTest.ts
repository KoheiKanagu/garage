import { kDevProjectId } from '../../src/utils/constants';

/* eslint-disable node/no-unpublished-require */
export function getFirebaseFunctionsTest() {
  return require('firebase-functions-test')({
    projectId: kDevProjectId,
  });
}
