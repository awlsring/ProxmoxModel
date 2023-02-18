$version: "2.0"

namespace awlsring.proxmox

@documentation("Write a file on the virtual machine. Requries the guest agent to be installed and active.")
@http(method: "POST", uri: "/nodes/{node}/qemu/{vmId}/agent/file-write", code: 200)
operation VirtualMachineWriteFile {
    input: VirtualMachineWriteFileInput,
    errors: [
        InvalidInputError,
        InternalServerError,
        NoGuestAgentError
    ]
}

@input
structure VirtualMachineWriteFileInput {
    @required
    @httpLabel
    node: NodeIdentifier

    @required
    @httpLabel
    @jsonName("vmid")
    vmId: VirtualMachineIdentifier

    @required
    file: String

    @required
    content: String
}