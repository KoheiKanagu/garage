import { firestore } from 'firebase-admin';
import { onDocumentCreated } from 'firebase-functions/v2/firestore';
import { isNull, isUndefined } from 'lodash';
import { UndefinedDocumentData } from './errors/undefined-document-data';
import { Mail, MailTemplateNames } from './models';
import { CollectionPaths } from './utils/collection-paths';
import { kSupportEmail } from './utils/constants';

export const onCreateFeedbackComment = onDocumentCreated(
  `${CollectionPaths.FEEDBACK_COMMENTS}/{documentId}`,
  async (event) => {
    const feedbackComment = event.data?.data();

    if (isUndefined(feedbackComment)) {
      throw new UndefinedDocumentData();
    }

    const feedbackId = feedbackComment['feedbackId'] as string;

    const feedbackSnapshot = await firestore()
      .collection(CollectionPaths.FEEDBACKS)
      .doc(feedbackId)
      .get();

    const feedbackData = feedbackSnapshot.data();
    if (isUndefined(feedbackData)) {
      throw new UndefinedDocumentData();
    }

    // メールで通知するかどうか
    const notifyByEmail = feedbackData['notifyByEmail'] as boolean;

    // メールアドレス
    const email = feedbackData['email'] as string | null;

    // 添付ファイルがあるか
    const hasAttachments = feedbackComment['attachments'].length > 0;

    // デバイスの言語によってメールのテンプレートを変える
    const locale = feedbackData['deviceInfo'].locale as string;
    const languageCode = locale.split('_')[0];

    let mailTemplateName: MailTemplateNames;
    if (languageCode === 'ja') {
      if (hasAttachments) {
        mailTemplateName = MailTemplateNames.NewFeedbackJa;
      } else {
        mailTemplateName = MailTemplateNames.NewFeedbackJaNoAttachments;
      }
    } else {
      if (hasAttachments) {
        mailTemplateName = MailTemplateNames.NewFeedbackEn;
      } else {
        mailTemplateName = MailTemplateNames.NewFeedbackEnNoAttachments;
      }
    }

    // メールデータ
    const mail: Mail = {
      cc: kSupportEmail,
      message: {
        messageId: `${feedbackId}@kingu.dev`,
      },
      template: {
        name: mailTemplateName,
        data: {
          appName: feedbackData['deviceInfo'].appName as string,
          feedbackId: feedbackId,
          message: feedbackComment['message'] as string,
          type: feedbackData['typeLocalized'] as string,
        },
      },
    };

    // メール通知する、メールアドレスが存在するならtoに追加
    if (notifyByEmail && !isNull(email) && email.length > 0) {
      mail.to = email;
    }

    // 添付ファイルがあれば追加
    if (hasAttachments) {
      mail.template.data.attachmentPath0 = feedbackComment['attachments'][0].path as string;
    }

    // メール送信
    await firestore()
      .collection(CollectionPaths.MAILS)
      .doc(event.params.documentId)
      .set(mail);
  },
);
