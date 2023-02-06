$version: "2.0"

namespace awlsring.proxmox

@documentation("List users on system.")
@readonly
@http(method: "GET", uri: "/access/users", code: 200)
operation ListUsers {
    input: ListUsersInput,
    output: ListUsersOutput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure ListUsersInput {
    @httpQuery("enabled")
    @jsonName("enabled")
    isEnabled: BooleanInteger,

    @httpQuery("full")
    @jsonName("full")
    fullDetails: BooleanInteger,
}

@output
structure ListUsersOutput {
    @required
    @jsonName("data")
    summaries: UserSummaries
}

structure UserSummary {
    @required
    @jsonName("userid")
    userId: UserIdentifier,

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
    groups: String,

    @jsonName("expire")
    expirationDate: Long,

    @jsonName("realm-type")
    realmType: String,

    @jsonName("tokens")
    tokens: UserTokenSummaries,
}

list UserSummaries {
    member: UserSummary
}