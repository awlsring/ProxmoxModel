$version: "2.0"

namespace awlsring.proxmox

resource StorageVolume {
    identifiers: {
        node: NodeIdentifier,
        storage: StorageIdentifier,
        volume: VolumeIdentifier,
    },
    delete: DeleteStorageVolume,
    update: UpdateStorageVolume
    list: ListStorageVolumes,
}

string VolumeIdentifier

enum StorageVolumeType {
    RAW = "raw",
    QCOW_2 = "qcow2",
    SUBVOL = "subvol", 
}