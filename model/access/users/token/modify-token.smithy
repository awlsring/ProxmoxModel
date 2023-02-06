$version: "2.0"

namespace awlsring.proxmox

@documentation("Modify a token.")
@idempotent
@http(method: "PUT", uri: "/access/users/{userId}/token/{tokenId}", code: 200)
operation ModifyUserToken {
    input: ModifyUserTokenInput,
    output: ModifyUserTokenOutput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure ModifyUserTokenInput {
    @required
    @httpLabel
    @jsonName("userid")
    userId: UserIdentifier,

    @required
    @httpLabel
    @jsonName("tokenid")
    tokenId: TokenIdentifier,

    @jsonName("privsep")
    isPrivileged: BooleanInteger,

    @jsonName("expire")
    expirationDate: Long,

    @jsonName("comment")
    comment: String,
}

@output
structure ModifyUserTokenOutput {
    @required
    @jsonName("data")
    summary: UserConfigurationTokenSummary
}