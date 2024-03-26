import {
  FieldValue,
  Timestamp,
} from 'firebase-admin/firestore';

export interface User {
  createdAt: Timestamp | FieldValue | null;
  updatedAt: Timestamp | FieldValue | null;
  deleted: boolean;
}

export enum FeedbackType {
  impression,
  bugReport,
  featureRequest,
  other,
}

export interface FeedbackData {
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
    appName: string;
  };

  // フィードバックの種類
  type: FeedbackType;

  // フィードバックの種類のローカライズ
  typeLocalized: string;

  // このissueのステータス
  status: 'open' | 'closed';

  // メールで通知するかどうか
  notifyByEmail: boolean;

  // プッシュ通知で通知するかどうか
  notifyByPush: boolean;
}

export interface FeedbackComment {
  createdAt: Timestamp | FieldValue | null;
  updatedAt: Timestamp | FieldValue | null;

  // フィードバックのDocumentId
  feedbackId: string;

  // サインアウト後のフィードバックの場合はnull
  // サポートからのコメントの場合は"support"
  createdBy: string | null;

  message: string;

  // Data URL
  attachments: [
    {
      path: string;
    }?,
  ];
}

export interface Mail {
  to: string;
  cc: string;

  message?: {
    messageId: string | null;
  };

  template: {
    name: MailTemplateNames;
    data: {
      attachmentPath0?: string;
      appName: string;
      feedbackId: string;
      message: string;
      type: string;
    };
  };
}

export enum MailTemplateNames {
  NewFeedbackJa = 'newFeedbackJa',
  NewFeedbackJaNoAttachments = 'newFeedbackJa.NoAttachments',
  NewFeedbackEn = 'newFeedbackEn',
  NewFeedbackEnNoAttachments = 'newFeedbackEn.NoAttachments',
}

export interface MailTemplates {
  updatedAt: Timestamp | FieldValue | null;
  subject: string;
  html: string;
  text: string;
  attachments?: [
    {
      path: string;
    },
  ];
}
