import { getFirestore } from 'firebase-admin/firestore';
import { readFileSync } from 'fs';
import { ServiceStatus } from '../../src/models';
import { CollectionPaths } from '../../src/utils/collection-paths';

export async function updateServiceStatus(
  serviceStatus: ServiceStatus,
) {
  const collection = getFirestore().collection(
    CollectionPaths.SERVICE_STATUS,
  );

  const firebaseJson = readFileSync('../../firebase.json', 'utf-8');
  const data = JSON.parse(firebaseJson) as Record<string, unknown>;

  for (const database of data['firestore'] as Record<string, unknown>[]) {
    const name = database['database'] as string;
    if (name === '(default)') {
      continue;
    }

    const doc = collection.doc(name);
    await doc.set(serviceStatus);
  }
}
