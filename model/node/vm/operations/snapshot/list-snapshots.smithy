$version: "2.0"

namespace awlsring.proxmox

@readonly
@http(method: "GET", uri: "/nodes/{node}/qemu/{vmId}/snapshot", code: 200)
operation ListSnapshots {
    input: ListSnapshotsInput,
    output: ListSnapshotsOutput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure ListSnapshotsInput {
    @required
    @httpLabel
    node: NodeIdentifier

    @required
    @httpLabel
    @jsonName("vmid")
    vmId: VirtualMachineIdentifier
}

@output
structure ListSnapshotsOutput {
    @required
    @jsonName("data")
    summaries: SnapshotSummaries
}