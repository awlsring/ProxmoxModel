$version: "2.0"

namespace awlsring.proxmox

@documentation("Initialize disk with GPT.")
@http(method: "POST", uri: "/nodes/{node}/disks/smart", code: 200)
operation InitializeGPT {
    input: InitializeGPTInput,
    output: InitializeGPTOutput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure InitializeGPTInput {
    @required
    @httpLabel
    node: NodeIdentifier

    @documentation("Disk to initialize.")
    disk: DevicePath,

    uuid: UUID
}

@output
structure InitializeGPTOutput {
    @required
    data: String
}