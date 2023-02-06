$version: "2.0"

namespace awlsring.proxmox

@documentation("Retrive the permissions for the given user. If none specified the permissions for the current user are returned.")
@readonly
@http(method: "GET", uri: "/access/permissions", code: 200)
operation GetPermissions {
    input: GetPermissionsInput,
    output: GetPermissionsOutput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure GetPermissionsInput {
    @httpQuery("path")
    @jsonName("path")
    permissionPath: String,

    @httpQuery("userid")
    @jsonName("userid")
    userId: String,
}

@output
structure GetPermissionsOutput {
    @required
    @jsonName("data")
    permissions: PermissionsMap
}

map PermissionsMap {
    key: String,
    value: PermissionsDetailMap
}

map PermissionsDetailMap {
    key: String,
    value: BooleanInteger
}