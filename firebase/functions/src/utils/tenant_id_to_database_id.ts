export function tenantIdToDatabaseId(
  tenantId: string
): string {
  const parts = tenantId.split('-');
  parts.pop();
  return parts.join('-');
}
