$version: "2.0"

namespace awlsring.proxmox

@documentation("List PVE managed directory storages.")
@readonly
@http(method: "GET", uri: "/nodes/{node}/disks/directory", code: 200)
operation ListDirectories {
    input: ListDirectoriesInput,
    output: ListDirectoriesOutput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure ListDirectoriesInput {
    @required
    @httpLabel
    node: NodeName
}

@output
structure ListDirectoriesOutput {
    @required
    @jsonName("data")
    summaries: DirectorySummaries
}

