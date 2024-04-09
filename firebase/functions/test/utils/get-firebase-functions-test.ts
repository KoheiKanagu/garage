import { kDevProjectId } from '../../src/utils/constants';

export function getFirebaseFunctionsTest() {
  return require('firebase-functions-test')(
    {
      projectId: kDevProjectId,
    },
    process.env['GOOGLE_APPLICATION_CREDENTIALS'],
  );
}
