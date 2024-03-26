import {
  FieldValue,
  getFirestore,
} from 'firebase-admin/firestore';
import {
  MailTemplateNames,
  MailTemplates,
  MailTemplatesNoAttachments,
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
    let subject: string;
    switch (templateName) {
      case MailTemplateNames.NewFeedbackJa:
        subject =
          '「{{appName}}」へのお問い合わせありがとうございます';
        break;
      case MailTemplateNames.NewFeedbackEn:
        subject = 'Thank you for feedback to "{{appName}}"';
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
      text: fs.readFileSync(
        `./scripts/assets/mail_templates/${templateName}.txt`,
        'utf8'
      ),
      attachments: [
        {
          path: '{{attachmentPath0}}',
        },
      ],
    };
    const doc = collection.doc(templateName);
    await doc.set(data);

    const noAttachmentData: MailTemplatesNoAttachments = {
      updatedAt: FieldValue.serverTimestamp(),
      subject: data.subject,
      html: data.html,
      text: data.text,
    };
    const noAttachmentDoc = collection.doc(
      templateName + 'NoAttachments'
    );
    await noAttachmentDoc.set(noAttachmentData);
  }
})();
