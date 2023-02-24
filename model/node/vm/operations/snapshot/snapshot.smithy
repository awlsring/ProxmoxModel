$version: "2.0"

namespace awlsring.proxmox

resource Snapshot {
    identifiers: {
        node: NodeIdentifier,
        vmId: VirtualMachineIdentifier
        snapshot: SnapshotIdentifier
    },
    list: ListSnapshots,
}

@documentation("The snapshot name.")
string SnapshotIdentifier

structure SnapshotSummary {
    @required
    @documentation("The snapshot name.")
    name: SnapshotIdentifier

    @required
    @documentation("The snapshot description.")
    description: String

    parent: SnapshotIdentifier

    @jsonName("snaptime")
    @documentation("The snapshot time.")
    time: Long

    @documentation("If the snapshot includes RAM.")
    vmState: Boolean
}

list SnapshotSummaries {
    member: SnapshotSummary
}