$version: "2.0"

namespace awlsring.proxmox

@documentation("Get the cloudinit configuration with both current and pending values.")
@readonly
@http(method: "GET", uri: "/nodes/{node}/qemu/{vmId}/cloudinit", code: 200)
operation GetPendingVirtualMachineCloudInitChanges {
    input: GetPendingVirtualMachineCloudInitChangesInput,
    output: GetPendingVirtualMachineCloudInitChangesOutput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure GetPendingVirtualMachineCloudInitChangesInput {
    @required
    @httpLabel
    node: NodeIdentifier

    @required
    @httpLabel
    @jsonName("vmid")
    vmId: VirtualMachineIdentifier
}

@output
structure GetPendingVirtualMachineCloudInitChangesOutput {
    @required
    @jsonName("data")
    values: PendingVirtualMachineCloudInitFields
}

structure PendingVirtualMachineCloudInitField {
    @required
    @jsonName("key")
    name: String

    @jsonName("new")
    new: String

    @jsonName("old")
    current: String
}

list PendingVirtualMachineCloudInitFields {
    member: PendingVirtualMachineCloudInitField
}