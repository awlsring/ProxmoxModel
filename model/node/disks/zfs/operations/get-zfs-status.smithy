$version: "2.0"

namespace awlsring.proxmox

@documentation("List LVM volume groups on node.")
@readonly
@http(method: "GET", uri: "/nodes/{node}/disks/zfs/{name}", code: 200)
operation GetZFSPoolStatus {
    input: GetZFSPoolStatusInput,
    output: GetZFSPoolStatusOutput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure GetZFSPoolStatusInput {
    @required
    @httpLabel
    node: NodeIdentifier

    @required
    @httpLabel
    name: String
}

@output
structure GetZFSPoolStatusOutput {
    @required
    @jsonName("data")
    summaries: ZFSPoolStatusSummary
}

structure ZFSPoolStatusSummary {
    @required
    @documentation("The pool configuration including vdevs for each section. May be nested.")
    children: ZFSPoolStatusChildren

    @required
    @documentation("Errors on the pool")
    errors: String

    @required
    @documentation("The pool name")
    name: String

    @required
    @documentation("The state of the pool")
    state: String

    @documentation("Recommended action to address the pool state")
    action: String

    @documentation("Information on the last or current scrub.")
    scan: String

    @documentation("Information on the state of the pool")
    status: String
}

structure ZFSPoolStatusChild {
    @required
    @jsonName("cksum")
    checksum: Integer

    @required
    @jsonName("read")
    read: Integer

    @required
    @jsonName("write")
    write: Integer

    @required
    @jsonName("name")
    name: String

    @required
    @jsonName("state")
    state: String

    @jsonName("msg")
    message: String

    children: ZFSPoolStatusChildren
}

list ZFSPoolStatusChildren {
    member: ZFSPoolStatusChild
}