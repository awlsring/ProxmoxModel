$version: "2.0"

namespace awlsring.proxmox

@documentation("Change a users password. This method cannot be used by API tokens.")
@idempotent
@http(method: "PUT", uri: "/access/password", code: 200)
operation ChangePassword {
    input: ChangePasswordInput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure ChangePasswordInput {
    @required
    @jsonName("userid")
    userId: String,

    @required
    @jsonName("password")
    password: String,
}