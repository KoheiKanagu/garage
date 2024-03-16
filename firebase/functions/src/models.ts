import {FieldValue, Timestamp} from 'firebase-admin/firestore';

export interface User {
  createdAt: Timestamp | FieldValue | null;
  updatedAt: Timestamp | FieldValue | null;
  deleted: boolean;
}

export interface Issue {
  createdAt: Timestamp | FieldValue | null;
  updatedAt: Timestamp | FieldValue | null;

  // サインアウト済みのユーザの場合はnull
  createdBy: string | null;

  // ユーザのメールアドレス
  // 未入力の場合はnull
  email: string | null;

  // どこからのフィードバックか
  from: 'configure' | 'shortcut' | 'unknown';

  deviceInfo: {
    osVersion: string;
    modelName: string;
    locale: string;
    appVersion: string;
    appPackageName: string;
  };

  // このissueのステータス
  status: 'open' | 'closed';

  // メールで通知するかどうか
  notifyByEmail: true;
  // プッシュ通知で通知するかどうか
  notifyByPush: true;

  // アプリの言語
  languageCode: 'ja';
}

export interface Comment {
  createdAt: Timestamp | FieldValue | null;
  updatedAt: Timestamp | FieldValue | null;

  // サインアウト後のフィードバックの場合はnull
  // サポートからのコメントの場合は"support"
  createdBy: string | null;

  message: string;

  attachment: [
    {
      // スクリーンショットをbase64でエンコードしたもの
      contentType: string;
      value: string;
    },
  ];
}

export interface Mail {
  to: string;
  cc: string;

  message: {
    messageId: string | null;
  };

  template: {
    name: MailTemplateNames;
    data: {
      attachmentsPath: string | null;
      appName: string;
      feedbackId: string;
      message: string;
      type: 'impression' | 'bugReport' | 'featureRequest' | 'other';
    };
  };
}

export enum MailTemplateNames {
  CreateIssueJa = 'createIssueJa',
  CreateIssueEn = 'createIssueEn',
}

export interface MailTemplates {
  subject: string;
  html: string;
  attachments: [
    {
      filename: string;
      path: string;
    },
  ];
}

export interface MailTemplatePartial {
  partial: true;
  html: string;
}
