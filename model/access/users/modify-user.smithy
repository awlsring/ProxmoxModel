$version: "2.0"

namespace awlsring.proxmox

@documentation("Update a user.")
@idempotent
@http(method: "PUT", uri: "/access/users/{userId}", code: 200)
operation ModifyUser {
    input: ModifyUserInput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure ModifyUserInput {
    @required
    @httpLabel
    @jsonName("userid")
    userId: UserIdentifier,

    @jsonName("comment")
    comment: String,

    append: BooleanInteger,

    @jsonName("email")
    email: String,

    @jsonName("enable")
    isEnabled: BooleanInteger,

    @jsonName("firstname")
    firstName: String,

    @jsonName("lastname")
    lastName: String,

    @jsonName("groups")
    groups: String,

    @jsonName("keys")
    keys: String

    @jsonName("expire")
    expirationDate: Long,
}