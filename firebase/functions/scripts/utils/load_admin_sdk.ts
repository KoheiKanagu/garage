import * as admin from 'firebase-admin';
import { Credential } from 'firebase-admin/app';
import { ExternalAccountClient } from 'google-auth-library';
import { exit } from 'process';
import * as readLine from 'readline';
import { ComputeEngineCredential } from '../../node_modules/firebase-admin/lib/app/credential-internal';
import fs = require('fs');
import path = require('path');

export async function loadAdminSdk() {
  console.log(
    'This script will initialize the Firebase Admin SDK.'
  );

  if (process.argv.includes('--emulator')) {
    console.log('Connecting to the emulators...');

    process.env.FIREBASE_AUTH_EMULATOR_HOST =
      '127.0.0.1:9099';
    process.env.FIRESTORE_EMULATOR_HOST = '127.0.0.1:8080';

    admin.initializeApp({
      projectId: 'kingu-garage-dev',
    });
    return;
  }

  if (!process.env.GOOGLE_APPLICATION_CREDENTIALS) {
    outputExportExample();
    throw new Error(
      'GOOGLE_APPLICATION_CREDENTIALS is not set.'
    );
  } else {
    console.log(
      `GOOGLE_APPLICATION_CREDENTIALS is ${process.env.GOOGLE_APPLICATION_CREDENTIALS}`
    );
  }

  if (!process.argv.includes('--force')) {
    await askYesNo();
  }

  admin.initializeApp({
    credential: new ExternalAccountCredential(),
    // credential: applicationDefault(),
  });
}

// TODO: https://github.com/firebase/firebase-admin-node/issues/1377
// https://gist.github.com/k2wanko/289f5cf231ca80da099c7414dceb465d
class ExternalAccountCredential
  extends ComputeEngineCredential
  implements Credential
{
  async getAccessToken(): Promise<admin.GoogleOAuthAccessToken> {
    const json = JSON.parse(
      fs.readFileSync(
        process.env
          .GOOGLE_APPLICATION_CREDENTIALS as string,
        'utf-8'
      )
    );
    const client = ExternalAccountClient.fromJSON(json);
    if (!client) {
      throw new Error('client is empty');
    }
    const res = await client.getAccessToken();

    return {
      access_token: res.res?.data?.accessToken || '',
      expires_in:
        new Date(
          res.res?.data?.expireTime ?? 1000
        ).getTime() / 1000,
    };
  }
}

function outputExportExample() {
  const secretsDir = path.join(
    __dirname,
    '../../../secrets/'
  );

  const files = fs.readdirSync(secretsDir);
  console.warn('===');
  for (const file of files) {
    if (file.endsWith('.json')) {
      console.warn(
        `export GOOGLE_APPLICATION_CREDENTIALS="${path.join(
          secretsDir,
          file
        )}"`
      );
    }
  }
  console.warn('===');
}

function askYesNo(): Promise<void> {
  return new Promise(resolve => {
    const rl = readLine.createInterface({
      input: process.stdin,
      output: process.stdout,
    });

    rl.question('Continue? (y/n): ', answer => {
      rl.close();
      if (answer.toLowerCase() !== 'y') {
        console.log('Canceled.');
        exit(1);
      }
      resolve();
    });
  });
}
