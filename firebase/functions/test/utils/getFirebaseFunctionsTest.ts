import { kDevProjectId } from '../../src/utils/constants';

/* eslint-disable node/no-unpublished-require */
export function getFirebaseFunctionsTest() {
  // const test = new FirebaseFunctionsTest();
  // test.init({
  //   projectId: kDevProjectId,
  // });

  if (process.env.GOOGLE_APPLICATION_CREDENTIALS) {
    const ExternalAccountCredential =
      require('../../scripts/utils/external-account-credential').ExternalAccountCredential;
    return require('firebase-functions-test')({
      credential: new ExternalAccountCredential(),
      projectId: kDevProjectId,
    });
  } else {
    return require('firebase-functions-test')({
      projectId: kDevProjectId,
    });
  }
}
