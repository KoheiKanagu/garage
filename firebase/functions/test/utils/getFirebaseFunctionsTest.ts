import { kDevProjectId } from '../../src/utils/constants';

export function getFirebaseFunctionsTest() {
  // eslint-disable-next-line node/no-unpublished-require
  return require('firebase-functions-test')(
    {
      projectId: kDevProjectId,
    },
    process.env.GOOGLE_APPLICATION_CREDENTIALS
  );
}
