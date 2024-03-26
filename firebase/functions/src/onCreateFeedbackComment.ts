import { firestore } from 'firebase-admin';
import { logger } from 'firebase-functions/v2';
import { onDocumentCreated } from 'firebase-functions/v2/firestore';
import { isNull, isUndefined } from 'lodash';
import { UndefinedDocumentData } from './errors/undefined_document_data';
import {
  FeedbackType,
  Mail,
  MailTemplateNames,
} from './models';
import { CollectionPaths } from './utils/collection_paths';
import { kSupportEmail } from './utils/constants';

export const onCreateFeedbackComment = onDocumentCreated(
  `${CollectionPaths.FEEDBACK_COMMENTS}/{documentId}`,
  async event => {
    const feedbackComment = event.data?.data();

    if (isUndefined(feedbackComment)) {
      throw new UndefinedDocumentData();
    }

    const feedbackId = feedbackComment.feedbackId as string;

    const feedbackSnapshot = await firestore()
      .collection(CollectionPaths.FEEDBACKS)
      .doc(feedbackId)
      .get();

    const feedbackData = feedbackSnapshot.data();
    if (isUndefined(feedbackData)) {
      throw new UndefinedDocumentData();
    }

    // メールで通知するかどうか
    const notifyByEmail =
      feedbackData.notifyByEmail as boolean;
    if (!notifyByEmail) {
      logger.info(
        'not send email. because notifyByEmail is false'
      );
      return;
    }

    // メールアドレスのチェック
    const email = feedbackData.email as string | null;
    if (isNull(email) || email.length === 0) {
      logger.info('not send email. because email is null');
      return;
    }

    // デバイスの言語によってメールのテンプレートを変える
    const locale = feedbackData.deviceInfo.locale as string;
    const languageCode = locale.split('-')[0];

    let mailTemplateName: MailTemplateNames;
    if (languageCode === 'ja') {
      mailTemplateName = MailTemplateNames.NewFeedbackJa;
    } else {
      mailTemplateName = MailTemplateNames.NewFeedbackEn;
    }

    // メールデータ
    const mail: Mail = {
      to: email,
      cc: kSupportEmail,
      message: {
        messageId: null,
      },
      template: {
        name: mailTemplateName,
        data: {
          attachments:
            feedbackComment.attachments as Array<unknown>,
          appName: feedbackData.deviceInfo
            .appName as string,
          feedbackId: feedbackId,
          message: feedbackComment.message as string,
          type: feedbackData.type as FeedbackType,
        },
      },
    };

    // メール送信
    await firestore()
      .collection(CollectionPaths.MAILS)
      .doc(event.params.documentId)
      .set(mail);
  }
);
