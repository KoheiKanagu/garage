import * as admin from 'firebase-admin';
import { applicationDefault } from 'firebase-admin/app';
import { exit } from 'process';
import * as readLine from 'readline';
import fs = require('fs');
import path = require('path');

export async function loadAdminSdk(options?: {
  connectToEmulator: boolean;
}) {
  console.log(
    'This script will initialize the Firebase Admin SDK.'
  );

  if (
    process.argv.includes('--emulator') ||
    options?.connectToEmulator
  ) {
    console.log('Connecting to the emulators...');

    process.env.FIREBASE_AUTH_EMULATOR_HOST =
      '127.0.0.1:9099';
    process.env.FIRESTORE_EMULATOR_HOST = '127.0.0.1:8080';

    adminInitializeApp();
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

  adminInitializeApp();
}

function adminInitializeApp() {
  // OIDCを利用している場合、applicationDefault()で初期化ができない
  // GOOGLE_APPLICATION_CREDENTIALSがセットされるので有無で判定してapplicationDefaultを使わない
  // https://github.com/firebase/firebase-admin-node/issues/1377
  if (process.env.GOOGLE_APPLICATION_CREDENTIALS) {
    const ExternalAccountCredential =
      require('./external-account-credential').ExternalAccountCredential;
    admin.initializeApp({
      credential: new ExternalAccountCredential(),
      projectId: process.env.GOOGLE_CLOUD_PROJECT,
    });
  } else {
    admin.initializeApp({
      credential: applicationDefault(),
      projectId: process.env.GOOGLE_CLOUD_PROJECT,
    });
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
