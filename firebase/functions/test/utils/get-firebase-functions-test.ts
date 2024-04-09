import firebaseFunctionsTest from 'firebase-functions-test';
import { kDevProjectId } from '../../src/utils/constants';

export function getFirebaseFunctionsTest() {
  return firebaseFunctionsTest({
    projectId: kDevProjectId,
  },
  process.env['GOOGLE_APPLICATION_CREDENTIALS'],
  );
}
