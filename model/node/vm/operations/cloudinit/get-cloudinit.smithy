$version: "2.0"

namespace awlsring.proxmox

@documentation("Get automatically generated cloudinit config.")
@readonly
@http(method: "GET", uri: "/nodes/{node}/qemu/{vmId}/cloudinit/dump", code: 200)
operation GetVirtualMachineCloudInit {
    input: GetVirtualMachineCloudInitInput,
    output: GetVirtualMachineCloudInitOutput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure GetVirtualMachineCloudInitInput {
    @required
    @httpLabel
    node: NodeIdentifier

    @required
    @httpLabel
    @jsonName("vmid")
    vmId: VirtualMachineIdentifier

    @required
    @httpQuery("type")
    type: CloudInitType
}

@output
structure GetVirtualMachineCloudInitOutput {
    @required
    @jsonName("data")
    cloudinit: String
}

enum CloudInitType {
    USER = "user",
    NETWORK = "network",
    META = "meta",
}