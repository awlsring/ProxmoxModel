$version: "2.0"

namespace awlsring.proxmox

resource Role {
    identifiers: { roleId: RoleIdentifier }
    list: ListRoles
    read: GetRole
    update: ModifyRole
    delete: DeleteRole
    operations: [ CreateRole ]
}

string RoleIdentifier