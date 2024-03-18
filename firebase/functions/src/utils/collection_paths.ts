export const CollectionPaths = {
  USERS: 'users_v1',
  FEEDBACKS: 'feedbacks_v1',
  FEEDBACK_COMMENTS: 'feedbackComments_v1',
  MAILS: 'mails_v1',
  MAIL_TEMPLATES: 'mailTemplates_v1',
} as const;

export type CollectionPaths =
  (typeof CollectionPaths)[keyof typeof CollectionPaths];

export const CollectionPathsValues = Object.values(CollectionPaths);
