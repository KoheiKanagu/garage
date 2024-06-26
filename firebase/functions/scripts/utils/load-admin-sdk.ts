import * as admin from 'firebase-admin';
import { exit } from 'process';
import * as readLine from 'readline';
import fs = require('fs');
import path = require('path');

const _GOOGLE_APPLICATION_CREDENTIALS = 'GOOGLE_APPLICATION_CREDENTIALS';

export async function loadAdminSdk(options?: {
  connectToEmulator: boolean;
}) {
  console.log(
    'This script will initialize the Firebase Admin SDK.',
  );

  if (process.argv.includes('--emulator') || options?.connectToEmulator) {
    console.log('Connecting to the emulators...');

    process.env['FIREBASE_AUTH_EMULATOR_HOST'] = '127.0.0.1:9099';
    process.env['FIRESTORE_EMULATOR_HOST'] = '127.0.0.1:8080';

    admin.initializeApp();
    return;
  }

  if (!process.env[_GOOGLE_APPLICATION_CREDENTIALS]) {
    outputExportExample();
    throw new Error(
      `${_GOOGLE_APPLICATION_CREDENTIALS} is not set.`,
    );
  } else {
    console.log(
      `${_GOOGLE_APPLICATION_CREDENTIALS} is ${process.env[_GOOGLE_APPLICATION_CREDENTIALS]}`,
    );
  }

  if (!process.argv.includes('--force')) {
    await askYesNo();
  }

  admin.initializeApp();
}

function outputExportExample() {
  const secretsDir = path.join(
    __dirname,
    '../../../secrets/',
  );

  const files = fs.readdirSync(secretsDir);
  console.warn('===');
  for (const file of files) {
    if (file.endsWith('.json')) {
      console.warn(
        `export ${_GOOGLE_APPLICATION_CREDENTIALS}="${path.join(secretsDir, file)}"`,
      );
    }
  }
  console.warn('===');
}

function askYesNo(): Promise<void> {
  return new Promise((resolve) => {
    const rl = readLine.createInterface({
      input: process.stdin,
      output: process.stdout,
    });

    rl.question('Continue? (y/n): ', (answer) => {
      rl.close();
      if (answer.toLowerCase() !== 'y') {
        console.log('Canceled.');
        exit(1);
      }
      resolve();
    });
  });
}
