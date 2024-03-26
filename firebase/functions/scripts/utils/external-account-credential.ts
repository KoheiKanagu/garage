import * as admin from 'firebase-admin';
import { Credential } from 'firebase-admin/app';
import { ExternalAccountClient } from 'google-auth-library';
import { ComputeEngineCredential } from '../../node_modules/firebase-admin/lib/app/credential-internal.js';
import fs = require('fs');

// TODO: https://github.com/firebase/firebase-admin-node/issues/1377
// https://gist.github.com/k2wanko/289f5cf231ca80da099c7414dceb465d
export class ExternalAccountCredential
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
