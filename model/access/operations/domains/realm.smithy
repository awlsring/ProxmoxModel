$version: "2.0"

namespace awlsring.proxmox

resource Realm {
    identifiers: { realm: RealmIdentifier }
    list: ListRealms
    delete: DeleteRealm
    read: GetRealm
}

string RealmIdentifier