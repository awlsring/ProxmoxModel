$version: "2.0"

namespace awlsring.proxmox

@documentation("Get user on system.")
@readonly
@http(method: "GET", uri: "/access/users/{userId}", code: 200)
operation GetUserConfiguration {
    input: GetUserConfigurationInput,
    output: GetUserConfigurationOutput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure GetUserConfigurationInput {
    @required
    @httpLabel
    @jsonName("userid")
    userId: UserIdentifier,
}

@output
structure GetUserConfigurationOutput {
    @required
    @jsonName("data")
    summary: UserConfigurationSummary
}

structure UserConfigurationSummary {
    @jsonName("email")
    email: String,

    @jsonName("firstname")
    firstName: String,

    @jsonName("lastname")
    lastName: String,

    @jsonName("enable")
    isEnabled: BooleanInteger,

    @jsonName("comment")
    comment: String,

    @jsonName("groups")
    groups: StringList,

    @jsonName("keys")
    keys: String

    @jsonName("expire")
    expirationDate: Long,

    @jsonName("tokens")
    tokens: TokenMap
}

map TokenMap {
    key: String,
    value: UserConfigurationTokenSummary
}
