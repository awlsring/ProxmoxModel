$version: "2.0"

namespace awlsring.proxmox

@documentation("Delete a user.")
@idempotent
@http(method: "DELETE", uri: "/access/users/{userId}", code: 200)
operation DeleteUser {
    input: DeleteUserInput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure DeleteUserInput {
    @required
    @httpLabel
    @jsonName("userid")
    userId: UserIdentifier,
}