import * as admin from 'firebase-admin';
import * as readLine from 'readline';

export async function loadAdminSdk() {
  const env = process.argv[2];

  let secret: string;

  switch (env) {
    case 'dev':
      secret =
        '../secrets/kingu-garage-dev-firebase-adminsdk-ajer4-9d175efbae.json';
      break;

    case 'prod':
      secret =
        '../secrets/leafy-winter-373014-firebase-adminsdk-ms2w6-8a34d1c77b.json';
      break;

    default:
      throw new Error('Unknown env. Please specify one of dev or prod.');
  }

  if ((await _askEnter()) !== '') {
    console.log('Aborting...');
    return;
  }

  admin.initializeApp({
    credential: admin.credential.cert(secret),
  });
}

function _askEnter(): Promise<string> {
  const rl = readLine.createInterface({
    input: process.stdin,
    output: process.stdout,
  });

  return new Promise(resolve =>
    rl.question(
      'Are you sure you want to continue? Press enter to continue, or type anything to abort: ',
      (ans: string) => {
        rl.close();
        resolve(ans);
      }
    )
  );
}
