import { FieldValue, Timestamp } from "firebase-admin/firestore";

export interface User {
  createdAt: Timestamp | FieldValue | null;
  updatedAt: Timestamp | FieldValue | null;
  deleted: boolean;
}
