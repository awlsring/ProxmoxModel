$version: "2.0"

namespace awlsring.proxmox

@documentation("Create token for user.")
@http(method: "POST", uri: "/access/users/{userId}/token/{tokenId}", code: 200)
operation CreateUserToken {
    input: CreateUserTokenInput,
    output: CreateUserTokenOutput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure CreateUserTokenInput {
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
structure CreateUserTokenOutput {
    @required
    @jsonName("data")
    summary: CreatedTokenSummary
}

structure CreatedTokenSummary {
    @required
    @jsonName("full-tokenid")
    fullTokenId: String,

    @required
    @jsonName("value")
    secret: String,

    @required
    @jsonName("info")
    tokenInfo: UserConfigurationTokenSummary
}