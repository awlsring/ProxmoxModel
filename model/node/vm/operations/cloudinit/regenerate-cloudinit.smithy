$version: "2.0"

namespace awlsring.proxmox

@documentation("Regenerate and change cloudinit config drive..")
@idempotent
@http(method: "PUT", uri: "/nodes/{node}/qemu/{vmId}/cloudinit", code: 200)
operation RegenerateVirtualMachineCloudInit {
    input: RegenerateVirtualMachineCloudInitInput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure RegenerateVirtualMachineCloudInitInput {
    @required
    @httpLabel
    node: NodeIdentifier

    @required
    @httpLabel
    @jsonName("vmid")
    vmId: VirtualMachineIdentifier
}