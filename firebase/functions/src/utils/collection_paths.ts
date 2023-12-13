export const CollectionPaths = {
  USERS: 'users_v1',
} as const;

export type CollectionPaths =
  (typeof CollectionPaths)[keyof typeof CollectionPaths];

export const CollectionPathsValues = Object.values(CollectionPaths);
