$version: "2.0"

namespace awlsring.proxmox

@readonly
@http(method: "GET", uri: "/access/roles", code: 200)
operation ListRoles {
    output: ListRolesOutput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@output
structure ListRolesOutput {
    @required
    @jsonName("data")
    summaries: RoleSummaries
}

structure RoleSummary {
    @required
    @jsonName("roleid")
    roleId: RoleIdentifier,

    @jsonName("privs")
    privileges: String,

    @jsonName("special")
    isSpecial: BooleanInteger,
}

list RoleSummaries {
    member: RoleSummary
}