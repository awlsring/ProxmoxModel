$version: "2.0"

namespace awlsring.proxmox

@idempotent
@http(method: "PUT", uri: "/access/acl", code: 200)
operation UpdateAccessControlList {
    input: UpdateAccessControlListInput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure UpdateAccessControlListInput {
    @required
    path: String

    @required
    roles: String

    @documentation("Removed permissions specified in request")
    delete: Boolean

    @documentation("Comma separated list of groups")
    groups: String

    @documentation("Allow propegation of permissions.")
    propagate: Boolean

    @documentation("Comma separated list of tokens")
    tokens: String

    @documentation("Comma separated list of users")
    users: String
}