$version: "2.0"

namespace awlsring.proxmox

@documentation("List the virtual machine configuration with both current and pending values.")
@readonly
@http(method: "GET", uri: "/nodes/{node}/qemu/{vmId}/pending", code: 200)
operation ListPendingVirtualMachineConfigurationChanges {
    input: ListPendingVirtualMachineConfigurationChangesInput,
    output: ListPendingVirtualMachineConfigurationChangesOutput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure ListPendingVirtualMachineConfigurationChangesInput {
    @required
    @httpLabel
    node: NodeIdentifier

    @required
    @httpLabel
    @jsonName("vmid")
    vmId: VirtualMachineIdentifier
}

@output
structure ListPendingVirtualMachineConfigurationChangesOutput {
    @required
    @jsonName("data")
    data: String
}

structure PendingVirtualMachineConfigurationChangeEntry {
    @required
    @jsonName("key")
    name: String

    @jsonName("value")
    current: String

    @jsonName("pending")
    new: Boolean

    @jsonName("delete")
    @documentation("Whether the value is pending deletion. 1 indicates a pending delete, 2 indicates a force delete.")
    deleteCode: Integer
}

list PendingVirtualMachineConfigurationChangeEntries {
    member: PendingVirtualMachineConfigurationChangeEntry
}
