$version: "2.0"

namespace awlsring.proxmox

@documentation("Get user token.")
@readonly
@http(method: "GET", uri: "/access/users/{userId}/token/{tokenId}", code: 200)
operation GetUserToken {
    input: GetUserTokenInput,
    output: GetUserTokenOutput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure GetUserTokenInput {
    @required
    @httpLabel
    @jsonName("userid")
    userId: UserIdentifier,

    @required
    @httpLabel
    @jsonName("tokenid")
    tokenId: TokenIdentifier,
}

@output
structure GetUserTokenOutput {
    @required
    @jsonName("data")
    summary: UserConfigurationTokenSummary
}