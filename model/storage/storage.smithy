$version: "2.0"

namespace awlsring.proxmox

resource Storage {
    identifiers: { storage: StorageName },
    list: ListStorage,
}

@pattern("^[A-Za-z]+$")
string StorageName

structure StorageSummary {
    @required
    @documentation("The storage class name")
    storage: StorageName,

    @documentation("Comma seperated list of content types in storage. Returned as a string")
    content: String,

    digest: String,

    thinpool: String,

    @documentation("The storage type")
    type: StorageType,

    @jsonName("vgname")
    @documentation("The volume group name")
    vgName: String,

    @jsonName("path")
    @documentation("The storage path")
    path: String,

    @jsonName("mountpoint")
    @documentation("The storage mountpoint")
    mount: String,

    @jsonName("nodes")
    @documentation("The nodes that have access to this storage")
    nodes: String,
}

enum StorageType {
    ZFS_LOCAL = "zfspool",
    DIRECTORY = "dir",
    BTRFS = "btrfs",
    NFS = "nfs",
    CIFS = "cifs",
    PROXMOX_BACKUP = "pbs",
    GLUSTER_FS = "glusterfs",
    CEPH_FS = "cephfs",
    LVM_THIN = "lvmthin",
    LVM = "lvm",
    ISCSI = "iscsi",
    ISCSCI_LIBISCSI = "iscsidirect",
    CEPH_RBD = "rbd",
    ZFS = "zfs",
}

list StorageSummaries {
    member: StorageSummary
}