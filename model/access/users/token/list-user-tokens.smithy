$version: "2.0"

namespace awlsring.proxmox

@documentation("List user tokens system.")
@readonly
@http(method: "GET", uri: "/access/users/{userId}/token", code: 200)
operation ListUserTokens {
    input: ListUserTokensInput,
    output: ListUserTokensOutput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure ListUserTokensInput {
    @required
    @httpLabel
    @jsonName("userid")
    userId: UserIdentifier,
}

@output
structure ListUserTokensOutput {
    @required
    @jsonName("data")
    summaries: UserTokenSummaries
}