$version: "2.0"

namespace awlsring.proxmox

resource Access {
    resources: [ Users, Realm ],
    operations: [
        CreateTicket,
        ChangePassword,
        GetPermissions,
        GetAccessControlList,
        UpdateAccessControlList,
    ],
}