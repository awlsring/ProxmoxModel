$version: "2.0"

namespace awlsring.proxmox

@documentation("Create a new user.")
@http(method: "POST", uri: "/access/users", code: 200)
operation CreateUser {
    input: CreateUserInput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure CreateUserInput {
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

    @jsonName("keys")
    keys: String

    @jsonName("expire")
    expirationDate: Long,
}