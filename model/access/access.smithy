$version: "2.0"

namespace awlsring.proxmox

resource Access {
    resources: [ Users, Realm, Group, Role ],
    operations: [
        CreateTicket,
        ChangePassword,
        GetPermissions,
        GetAccessControlList,
        UpdateAccessControlList,
    ],
}