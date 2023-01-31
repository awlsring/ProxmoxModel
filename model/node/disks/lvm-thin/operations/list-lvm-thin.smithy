$version: "2.0"

namespace awlsring.proxmox

@documentation("List LVM thinpools on node.")
@readonly
@http(method: "GET", uri: "/nodes/{node}/disks/lvmthin", code: 200)
operation ListLVMThins {
    input: ListLVMThinsInput,
    output: ListLVMThinsOutput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure ListLVMThinsInput {
    @required
    @httpLabel
    node: NodeIdentifier
}

@output
structure ListLVMThinsOutput {
    @required
    @jsonName("data")
    summaries: LVMThinSummaries
}

