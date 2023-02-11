$version: "2.0"

namespace awlsring.proxmox

resource Realm {
    identifiers: { realm: RealmIdentifier }
    list: ListRealms
    delete: DeleteRealm
    read: GetRealm
    update: UpdateRealm
    operations: [ 
        CreateRealm,
        SyncRealm
    ]
}

string RealmIdentifier

enum RealmType {
    AD = "ad",
    LDAP = "ldap",
    PAM = "pam",
    PVE = "pve",
    OPEN_ID = "openid",
}

enum RealmMode {
    LDAP = "ldap",
    LDAPS = "ldaps",
    LDAP_START_TLS = "ldap+starttls",
}

enum RealmSslVersion {
    TLSV1 = "tlsv1",
    TLSV1_1 = "tlsv1_1",
    TLSV1_2 = "tlsv1_2",
    TLSV1_3 = "tlsv1_3",
}