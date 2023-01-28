$version: "2.0"

namespace awlsring.proxmox

@readonly
@http(method: "GET", uri: "/cluster/config/join", code: 200)
operation GetClusterJoinInformation {
    input: GetClusterJoinInformationInput,
    output: GetClusterJoinInformationOutput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure GetClusterJoinInformationInput {
    @documentation("The node which to join.")
    @httpQuery("node")
    node: String
}

@output
structure GetClusterJoinInformationOutput {
    @required
    data: JoinInformation
}

structure JoinInformation {
    @required
    totem: TotemSummary

    @required
    @jsonName("preferred_node")
    preferredNode: String

    @required
    @jsonName("config_digest")
    configDigest: String

    @required
    @jsonName("nodelist")
    nodeList: CorosyncNodeSummaries
}