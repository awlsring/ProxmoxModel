$version: "2.0"

namespace awlsring.proxmox

@http(method: "POST", uri: "/access/roles", code: 200)
operation CreateRole {
    input: CreateRoleInput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure CreateRoleInput {
    @required
    @jsonName("roleid")
    roleId: RoleIdentifier

    @jsonName("privs")
    privileges: String
}