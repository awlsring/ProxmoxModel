$version: "2.0"

namespace awlsring.proxmox

@http(method: "POST", uri: "/access/domains/{realm}", code: 200)
operation SyncRealm {
    input: SyncRealmInput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure SyncRealmInput {
    @required
    @httpLabel
    @jsonName("realm")
    realm: RealmIdentifier

    @jsonName("dry-run")
    dryRun: BooleanInteger

    @jsonName("enable-new")
    enableNew: BooleanInteger

    @jsonName("full")
    full: BooleanInteger

    @jsonName("purge")
    purge: BooleanInteger

    @jsonName("remove-vanished")
    removeVanished: String

    @jsonName("scope")
    scope: RealmSyncScope
}

enum RealmSyncScope {
    USERS = "users",
    GROUPS = "groups",
    BOTH = "both"
}

