$version: "2.0"

namespace awlsring.proxmox

@readonly
@http(method: "GET", uri: "/access/acl", code: 200)
operation GetAccessControlList {
    output: GetAccessControlListOutput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@output
structure GetAccessControlListOutput {
    @required
    @jsonName("data")
    summaries: AccessControlSummaries
}

structure AccessControlSummary {
    @required
    @jsonName("path")
    path: String,

    @required
    @jsonName("roleid")
    @documentation("The role id")
    roleId: String,

    @required
    @jsonName("ugid")
    @documentation("The user group id")
    userGroupId: String,

    @required
    @documentation("The type of access control item")
    type: AccessControlType,

    @required
    @documentation("Allow permission propegation")
    propagate: AccessControlPropegation,
}

intEnum AccessControlPropegation {
    @enumValue(1)
    ALLOW
    @enumValue(0)
    DENY
}

enum AccessControlType {
    USER = "user",
    GROUP = "group",
    TOKEN = "token",
}

list AccessControlSummaries {
    member: AccessControlSummary
}