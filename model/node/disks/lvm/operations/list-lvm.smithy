$version: "2.0"

namespace awlsring.proxmox

@documentation("List LVM volume groups on node.")
@readonly
@http(method: "GET", uri: "/nodes/{node}/disks/lvm", code: 200)
operation ListLVMs {
    input: ListLVMsInput,
    output: ListLVMsOutput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure ListLVMsInput {
    @required
    @httpLabel
    node: NodeIdentifier
}

@output
structure ListLVMsOutput {
    @required
    @jsonName("data")
    summaries: LVMSummaries
}

