$version: "2.0"

namespace awlsring.proxmox

@documentation("Delete a token.")
@idempotent
@http(method: "DELETE", uri: "/access/users/{userId}/token/{tokenId}", code: 200)
operation DeleteUserToken {
    input: DeleteUserTokenInput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure DeleteUserTokenInput {
    @required
    @httpLabel
    @jsonName("userid")
    userId: UserIdentifier,

    @required
    @httpLabel
    @jsonName("tokenid")
    tokenId: TokenIdentifier,
}