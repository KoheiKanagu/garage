import {
  FieldValue,
  getFirestore,
} from 'firebase-admin/firestore';
import {
  MailTemplateFooterNames,
  MailTemplateNames,
  MailTemplatePartial,
  MailTemplates,
} from '../src/models';
import { CollectionPaths } from '../src/utils/collection_paths';
import { loadAdminSdk } from './utils/load_admin_sdk';
import fs = require('fs');

void (async () => {
  await loadAdminSdk();

  const collection = getFirestore().collection(
    CollectionPaths.MAIL_TEMPLATES
  );

  for (const templateName of Object.values(
    MailTemplateNames
  )) {
    const doc = collection.doc(templateName);

    let subject: string;
    switch (templateName) {
      case MailTemplateNames.NewFeedbackJa:
        subject =
          '[{{feedbackId}}] {{appName}} へのお問い合わせ';
        break;
      case MailTemplateNames.NewFeedbackEn:
        subject =
          '[{{feedbackId}}] Feedback to {{appName}}';
        break;
      default:
        throw new Error('Unknown template name');
    }

    const data: MailTemplates = {
      updatedAt: FieldValue.serverTimestamp(),
      subject: subject,
      html: fs.readFileSync(
        `./scripts/assets/mail_templates/${templateName}.html`,
        'utf8'
      ),
      attachments: '{{attachments}}',
    };
    await doc.set(data);
  }

  for (const templateFooterName of Object.values(
    MailTemplateFooterNames
  )) {
    const doc = collection.doc(templateFooterName);

    const data: MailTemplatePartial = {
      updatedAt: FieldValue.serverTimestamp(),
      partial: true,
      html: fs.readFileSync(
        `./scripts/assets/mail_templates/${templateFooterName}.html`,
        'utf8'
      ),
    };
    await doc.set(data);
  }
})();
