$version: "2.0"

namespace awlsring.proxmox

@documentation("List local disks on node.")
@readonly
@http(method: "GET", uri: "/nodes/{node}/disks/list", code: 200)
operation ListDisks {
    input: ListDisksInput,
    output: ListDisksOutput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure ListDisksInput {
    @required
    @httpLabel
    node: NodeName

    @httpQuery("include-partitions")
    @documentation("Include partitions in response list. Takes a boolean integer value (0 false, 1 true).")
    includePartitions: Integer,

    @httpQuery("skipsmart")
    @documentation("Skip SMART checks. Takes a boolean integer value (0 false, 1 true).")
    skipSmartChecks: Integer,

    @httpQuery("type")
    type: DiskTypeFilter,
}

@output
structure ListDisksOutput {
    @required
    @jsonName("data")
    summaries: DiskSummaries
}

enum DiskTypeFilter {
    UNUSED = "unused",
    JOURNAL_DISKS = "journal_disks",
}