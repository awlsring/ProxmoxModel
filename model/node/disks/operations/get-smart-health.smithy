$version: "2.0"

namespace awlsring.proxmox

@documentation("Get SMART health of a disk.")
@readonly
@http(method: "GET", uri: "/nodes/{node}/disks/smart", code: 200)
operation GetSmartHealth {
    input: GetSmartHealthInput,
    output: GetSmartHealthOutput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure GetSmartHealthInput {
    @required
    @httpLabel
    node: NodeName

    @httpQuery("disk")
    @documentation("Disk to check.")
    disk: DevicePath,

    @httpQuery("healthonly")
    @documentation("Return only health status. Takes a boolean integer value (0 false, 1 true).")
    healthOnly: Integer,
}

@output
structure GetSmartHealthOutput {
    @required
    @jsonName("data")
    summaries: DiskSummaries
}

structure SmartHealthSummary {
    @required
    health: String,

    attributes: StringList

    wearout: Integer

    type: String

    text: String
}

structure SmartAttributeSummary {
    @required
    id: String,

    @required
    name: String,

    @required
    value: Integer,

    @required
    worst: Integer,

    @required
    threshold: Integer,

    @required
    normalized: Integer,

    @required
    raw: String,

    @required
    flags: String,

    @required
    fail: String,

    @required
    description: String
}

list SmartAttributeSummaries {
    member: SmartAttributeSummary
}
