$version: "2.0"

namespace awlsring.proxmox

@readonly
@http(method: "GET", uri: "/nodes/{node}/apt/versions", code: 200)
operation ListPackages {
    input: ListPackagesInput
    output: ListPackagesOutput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure ListPackagesInput {
    @required
    @httpLabel
    node: NodeName,
}

@output
structure ListPackagesOutput {
    @required
    @jsonName("data")
    updates: PackageSummaries
}

structure PackageSummary {
    @required
    @jsonName("Title")
    title: String,

    @required
    @jsonName("Priority")
    priority: String,

    @required
    @jsonName("OldVersion")
    oldVersion: String,

    @required
    @jsonName("Description")
    description: String,

    @required
    @jsonName("Arch")
    arch: String,

    @required
    @jsonName("Package")
    package: String

    @required
    @jsonName("Section")
    section: String,

    @required
    @jsonName("Version")
    version: String,

    @required
    @jsonName("Origin")
    origin: String

    @required
    @jsonName("CurrentState")
    currentState: String

    @jsonName("RunningKernel")
    runningKernel: String
}

list PackageSummaries {
    member: PackageSummary
}