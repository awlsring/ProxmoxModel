$version: "2.0"

namespace awlsring.proxmox

@documentation("List LVM volume groups on node.")
@readonly
@http(method: "GET", uri: "/nodes/{node}/disks/zfs", code: 200)
operation ListZFSPools {
    input: ListZFSPoolsInput,
    output: ListZFSPoolsOutput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure ListZFSPoolsInput {
    @required
    @httpLabel
    node: NodeName
}

@output
structure ListZFSPoolsOutput {
    @required
    @jsonName("data")
    summaries: ZFSPoolSummaries
}

