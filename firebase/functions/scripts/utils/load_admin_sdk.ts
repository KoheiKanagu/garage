import * as admin from 'firebase-admin';
import { applicationDefault } from 'firebase-admin/app';
import { exit } from 'process';
import * as readLine from 'readline';
import { kDevProjectId } from '../../src/utils/constants';
import fs = require('fs');
import path = require('path');

export async function loadAdminSdk({
  connectToEmulator = false,
  useExternalAccountCredential = false,
}: {
  connectToEmulator: boolean;
  useExternalAccountCredential: boolean;
}) {
  console.log(
    'This script will initialize the Firebase Admin SDK.'
  );

  if (
    process.argv.includes('--emulator') ||
    connectToEmulator
  ) {
    console.log('Connecting to the emulators...');

    process.env.FIREBASE_AUTH_EMULATOR_HOST =
      '127.0.0.1:9099';
    process.env.FIRESTORE_EMULATOR_HOST = '127.0.0.1:8080';

    admin.initializeApp({
      projectId: kDevProjectId,
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

  if (useExternalAccountCredential) {
    admin.initializeApp({
      credential: require('./external-account-credential'),
    });
  } else {
    admin.initializeApp({
      credential: applicationDefault(),
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
