import { tenantIdToDatabaseId } from '../../src/utils/tenant-id-to-database-id';

describe('tenantIdToDatabaseId', () => {
  it('should return the correct databaseId when tenantId is provided', () => {
    const tenantId = 'example-tenant-id-123';
    const result = tenantIdToDatabaseId(tenantId);
    expect(result).toEqual('example-tenant-id');
  });
});
