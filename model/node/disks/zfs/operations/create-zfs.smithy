$version: "2.0"

namespace awlsring.proxmox

@documentation("Create a ZFS pool.")
@http(method: "POST", uri: "/nodes/{node}/disks/zfs", code: 200)
operation CreateZFSPool {
    input: CreateZFSPoolInput,
    output: CreateZFSPoolOutput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure CreateZFSPoolInput {
    @required
    @httpLabel
    node: NodeName

    @required
    @documentation("The devices to create the zfs pool on. This is a comma seperated list sent as a string.")
    devices: String

    @required
    @documentation("The storage identifier.")
    name: String

    @required
    @documentation("The storage type.")
    @jsonName("raidlevel")
    raidLevel: ZFSRaidLevel

    @jsonName("add_storage")
    @documentation("Configure storage using the directory. Takes a boolean integer value (0 false, 1 true).")
    addStorage: Integer

    @documentation("The pool vector size exponent.")
    ashift: Integer

    @documentation("The compression algorithm to use.")
    compression: ZFSCompression

    @documentation("Draid config. Set as string like 'data=<int>,spares=<int>")
    @jsonName("draid-config")
    draidConfig: String
}

@output
structure CreateZFSPoolOutput {
    @required
    @jsonName("data")
    output: String
}

