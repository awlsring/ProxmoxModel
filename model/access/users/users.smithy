$version: "2.0"

namespace awlsring.proxmox

resource Users {
    identifiers: { userId: UserIdentifier },
    resources: [ Token ]
    list: ListUsers,
    delete: DeleteUser,
    update: ModifyUser,
    read: GetUserConfiguration,
    operations: [
        CreateUser,
    ],
}

string UserIdentifier

structure UserTokenSummary {
    @required
    @jsonName("tokenid")
    tokenId: String,

    @jsonName("privsep")
    isPrivileged: BooleanInteger,

    @jsonName("expire")
    expirationDate: Long,

    @jsonName("comment")
    comment: String,
}

list UserTokenSummaries {
    member: UserTokenSummary
}

structure UserConfigurationTokenSummary {
    @jsonName("privsep")
    isPrivileged: BooleanInteger,

    @jsonName("expire")
    expirationDate: Long,

    @jsonName("comment")
    comment: String,
}