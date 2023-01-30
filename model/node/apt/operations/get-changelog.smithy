$version: "2.0"

namespace awlsring.proxmox

@readonly
@http(method: "GET", uri: "/nodes/{node}/apt/changelog", code: 200)
operation GetPackageChangelog {
    input: GetPackageChangelogInput
    output: GetPackageChangelogOutput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure GetPackageChangelogInput {
    @required
    @httpLabel
    node: NodeName,

    @httpQuery("name")
    @documentation("The name of the package to get the changelog for.")
    name: String
}

@output
structure GetPackageChangelogOutput {
    @required
    @jsonName("data")
    result: String
}
