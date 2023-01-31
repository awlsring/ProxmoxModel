$version: "2.0"

namespace awlsring.proxmox

@readonly
@http(method: "GET", uri: "/nodes/{node}/apt/repository", code: 200)
operation ListRepositoriesInformation {
    input: ListRepositoriesInformationInput
    output: ListRepositoriesInformationOutput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure ListRepositoriesInformationInput {
    @required
    @httpLabel
    node: NodeIdentifier,
}

@output
structure ListRepositoriesInformationOutput {
    @required
    @jsonName("data")
    report: RepositoriesReport
}

structure RepositoriesReport {
    @required
    digest: String,

    @required
    @jsonName("standard-repos")
    standardRepos: RepositorySummaries,

    @required
    errors: StringList,

    @required
    files: FileSummaries

    @required
    infos: FileInfoSummaries
}

structure RepositorySummary {
    @required
    description: String,

    @required
    status: Integer,

    @required
    name: String,

    @required
    handle: String,
}

list RepositorySummaries {
    member: RepositorySummary
}

structure FileSummary {
    path: String,

    content: String,

    repositories: FileRepositorySummaries,

    digest: IntegerList,

    @jsonName("file-type")
    fileType: String
}

list FileSummaries {
    member: FileSummary
}

structure FileInfoSummary {
    @required
    path: String

    @required
    index: Integer

    @required
    message: String

    @required
    kind: String
}

list FileInfoSummaries {
    member: FileInfoSummary
}

structure FileRepositorySummary {
    @jsonName("Enabled")
    enabled: Integer

    @jsonName("Components")
    components: StringList

    @jsonName("FileType")
    fileType: String

    @jsonName("URIs")
    uris: StringList

    @jsonName("Types")
    types: StringList

    @jsonName("Suites")
    suites: StringList

    @jsonName("Comment")
    comment: String
}

list FileRepositorySummaries {
    member: FileRepositorySummary
}