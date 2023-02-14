$version: "2.0"

namespace awlsring.proxmox

resource LVM {
    identifiers: {
        node: NodeIdentifier
    },
    operations: [ CreateLVM, ListLVMs, DeleteLVM ]
}