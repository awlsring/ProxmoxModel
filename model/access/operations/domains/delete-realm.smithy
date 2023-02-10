$version: "2.0"

namespace awlsring.proxmox

@idempotent
@http(method: "DELETE", uri: "/access/domains/{realm}", code: 200)
operation DeleteRealm {
    input: DeleteRealmInput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure DeleteRealmInput {
    @required
    @httpLabel
    @jsonName("realm")
    realm: RealmIdentifier
}