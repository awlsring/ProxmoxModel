$version: "2.0"

namespace awlsring.proxmox

@idempotent
@http(method: "PUT", uri: "/access/roles/{roleId}", code: 200)
operation ModifyRole {
    input: ModifyRoleInput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure ModifyRoleInput {
    @required
    @httpLabel
    @jsonName("roleid")
    roleId: RoleIdentifier

    @jsonName("privs")
    privileges: String

    @jsonName("append")
    append: BooleanInteger
}