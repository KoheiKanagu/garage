import {
  FieldValue,
  getFirestore,
} from 'firebase-admin/firestore';
import {
  MailTemplateNames,
  MailTemplates,
} from '../src/models';
import { CollectionPaths } from '../src/utils/collection-paths';
import { loadAdminSdk } from './utils/load-admin-sdk';

import fs = require('fs');

void (async () => {
  await loadAdminSdk();

  const collection = getFirestore().collection(
    CollectionPaths.MAIL_TEMPLATES
  );

  for (const templateName of Object.values(
    MailTemplateNames
  )) {
    let subject: string;
    switch (templateName) {
      case MailTemplateNames.NewFeedbackJa:
      case MailTemplateNames.NewFeedbackJaNoAttachments:
        subject =
          '「{{appName}}」へのお問い合わせありがとうございます [{{feedbackId}}]';
        break;
      case MailTemplateNames.NewFeedbackEn:
      case MailTemplateNames.NewFeedbackEnNoAttachments:
        subject =
          'Thank you for feedback to "{{appName}}" [feedbackId]';
        break;
      default:
        throw new Error('Unknown template name');
    }

    const data: MailTemplates = {
      updatedAt: FieldValue.serverTimestamp(),
      subject: subject,
      html: fs.readFileSync(
        `./scripts/assets/mail_templates/${
          templateName.split('.')[0]
        }.html`,
        'utf8'
      ),
      text: fs.readFileSync(
        `./scripts/assets/mail_templates/${
          templateName.split('.')[0]
        }.txt`,
        'utf8'
      ),
      attachments: [
        {
          path: '{{attachmentPath0}}',
        },
      ],
    };
    const doc = collection.doc(templateName);

    switch (templateName) {
      case MailTemplateNames.NewFeedbackJaNoAttachments:
      case MailTemplateNames.NewFeedbackEnNoAttachments:
        // 添付ファイルなしのテンプレ
        delete data.attachments;
    }
    await doc.set(data);
  }
})();
