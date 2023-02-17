$version: "2.0"

namespace awlsring.proxmox

@documentation("Read a file on the virtual machine. Requries the guest agent to be installed and active.")
@readonly
@http(method: "GET", uri: "/nodes/{node}/qemu/{vmId}/agent/file-read", code: 200)
operation VirtualMachineReadFile {
    input: VirtualMachineReadFileInput,
    output: VirtualMachineReadFileOutput,
    errors: [
        InvalidInputError,
        InternalServerError,
        NoGuestAgentError
    ]
}

@input
structure VirtualMachineReadFileInput {
    @required
    @httpLabel
    node: NodeIdentifier

    @required
    @httpLabel
    @jsonName("vmid")
    vmId: VirtualMachineIdentifier

    @required
    @httpQuery("file")
    file: String
}

@output
structure VirtualMachineReadFileOutput {
    @required
    @jsonName("data")
    summary: FileReadSummary
}

structure FileReadSummary {
    @required
    content: String

    @jsonName("truncated")
    isTruncated: BooleanInteger
}