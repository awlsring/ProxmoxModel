$version: "2.0"

namespace awlsring.proxmox

@idempotent
@http(method: "DELETE", uri: "/access/roles/{roleId}", code: 200)
operation DeleteRole {
    input: DeleteRoleInput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure DeleteRoleInput {
    @required
    @httpLabel
    @jsonName("roleid")
    roleId: RoleIdentifier
}