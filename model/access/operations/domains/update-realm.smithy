$version: "2.0"

namespace awlsring.proxmox

@idempotent
@http(method: "PUT", uri: "/access/domains/{realm}", code: 200)
operation UpdateRealm {
    input: UpdateRealmInput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure UpdateRealmInput {
    @required
    @httpLabel
    @jsonName("realm")
    realm: RealmIdentifier

    @jsonName("autocreate")
    autoCreate: BooleanInteger

    @jsonName("base_dn")
    baseDomainName: String

    @jsonName("bind_dn")
    bindDomainName: String

    @jsonName("capath")
    caPath: String

    @jsonName("case-sensitive")
    caseSensitive: BooleanInteger

    @jsonName("cert")
    certificate: String

    @jsonName("certkey")
    certificateKey: String

    @jsonName("client-id")
    clientId: String

    @jsonName("client-key")
    clientKey: String

    @jsonName("comment")
    comment: String

    @jsonName("delete")
    delete: BooleanInteger

    @jsonName("digest")
    digest: String

    @jsonName("default")
    default: BooleanInteger

    @jsonName("domain")
    domain: String

    @jsonName("filter")
    filter: String

    @jsonName("group_classes")
    groupClasses: String

    @jsonName("group_filter")
    groupFilter: String

    @jsonName("group_dn")
    groupDomainName: String

    @jsonName("group_name_attr")
    groupNameAttribute: String

    @jsonName("issuer-url")
    issuerUrl: String

    @jsonName("mode")
    mode: RealmMode

    @jsonName("password")
    password: String

    @jsonName("port")
    port: Integer

    @jsonName("prompt")
    prompt: String

    @jsonName("scopes")
    scopes: String

    @jsonName("secure")
    secure: BooleanInteger

    @jsonName("server1")
    server: String

    @jsonName("server2")
    fallbackServer: String

    @jsonName("sslversion")
    sslVersion: RealmSslVersion

    @jsonName("sync-defaults-options")
    syncDefaultsOptions: String

    @jsonName("sync_attributes")
    syncAttributes: String

    @jsonName("tfa")
    twoFactorAuthentication: String

    @jsonName("user_attr")
    userAttribute: String

    @jsonName("user_classes")
    userClasses: String

    @jsonName("verify")
    verify: BooleanInteger
}