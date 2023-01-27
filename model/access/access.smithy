$version: "2.0"

namespace awlsring.proxmox

resource Access {
    operations: [ GetAccessControlList, UpdateAccessControlList ],
}