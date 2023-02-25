$version: "2.0"

namespace awlsring.proxmox

@http(method: "POST", uri: "/nodes/{node}/qemu/{vmId}/snapshot", code: 200)
operation CreateSnapshot {
    input: CreateSnapshotInput,
    output: CreateSnapshotOutput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure CreateSnapshotInput {
    @required
    @httpLabel
    node: NodeIdentifier

    @required
    @httpLabel
    @jsonName("vmid")
    vmId: VirtualMachineIdentifier
    
    @required
    @jsonName("snapname")
    snapshot: SnapshotIdentifier

    description: String

    @jsonName("vmstate")
    includeVmState: BooleanInteger
}

@output
structure CreateSnapshotOutput {
    @required
    @jsonName("data")
    result: String
}