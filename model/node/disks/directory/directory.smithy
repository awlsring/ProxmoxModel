$version: "2.0"

namespace awlsring.proxmox

resource Directory {
    identifiers: {
        node: NodeIdentifier
    },
    operations: [ CreateDirectory, ListDirectories, DeleteDirectory ]
}

structure DirectorySummary {
    @required
    @documentation("The mounted device")
    device: String

    @required
    @documentation("The mount options")
    options: String

    @required
    @documentation("The mount path")
    path: String

    @required
    @documentation("The mount type")
    type: String

    @required
    @jsonName("unitfile")
    @documentation("The path of the mount unit")
    unitFile: String
}

list DirectorySummaries {
    member: DirectorySummary
}