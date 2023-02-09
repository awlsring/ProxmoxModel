$version: "2.0"

namespace awlsring.proxmox

@readonly
@http(method: "GET", uri: "/access/domains/{realm}", code: 200)
operation GetRealm {
    input: GetRealmInput,
    output: GetRealmOutput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure GetRealmInput {
    @required
    @httpLabel
    @jsonName("realm")
    realm: RealmIdentifier
}

@output
structure GetRealmOutput {
    @required
    @jsonName("data")
    summary: RealmConfigurationSummary
}

structure RealmConfigurationSummary {
    @required
    @jsonName("type")
    type: String,

    @required
    @jsonName("digest")
    digest: String,

    @jsonName("comment")
    comment: String,
}