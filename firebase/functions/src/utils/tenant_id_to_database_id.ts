export function tenantIdToDatabaseId(tenantId: string | undefined): string {
  if (!tenantId) {
    return '';
  }

  const parts = tenantId.split('-');
  parts.pop();
  return parts.join('-');
}
