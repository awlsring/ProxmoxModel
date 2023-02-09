$version: "2.0"

namespace awlsring.proxmox

@readonly
@http(method: "GET", uri: "/access/domains", code: 200)
operation ListRealms {
    output: ListRealmsOutput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@output
structure ListRealmsOutput {
    @required
    @jsonName("data")
    summaries: RealSummaries
}

structure RealmSummary {
    @required
    @jsonName("realm")
    realm: String,

    @required
    @jsonName("type")
    type: String,

    @jsonName("comment")
    comment: String,

    @jsonName("tfa")
    twoFactorAuthenticationType: TFAType,
}

list RealSummaries {
    member: RealmSummary
}

enum TFAType {
    YUBICO = "yubico",
    OAUTH = "oauth",
}