$version: "2.0"

namespace awlsring.proxmox

resource Access {
    resources: [ Users, Realm, Group ],
    operations: [
        CreateTicket,
        ChangePassword,
        GetPermissions,
        GetAccessControlList,
        UpdateAccessControlList,
    ],
}