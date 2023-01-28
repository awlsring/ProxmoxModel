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
    nodeList: ConfigNodeSummaries
}

structure ConfigNodeSummary {
    @required
    @jsonName("nodeid")
    nodeId: String

    @required
    @jsonName("quorum_votes")
    quorumVotes: String

    @required
    @jsonName("ring0_addr")
    ring0Address: String

    @jsonName("ring1_addr")
    ring1Address: String

    @jsonName("ring2_addr")
    ring2Address: String

    @jsonName("ring3_addr")
    ring3Address: String

    @jsonName("ring4_addr")
    ring4Address: String

    @jsonName("ring5_addr")
    ring5Address: String

    @jsonName("ring6_addr")
    ring6Address: String

    @jsonName("ring7_addr")
    ring7Address: String

    @required
    @jsonName("name")
    name: String

    @required
    @jsonName("pve_addr")
    pveAddress: String
}

list ConfigNodeSummaries {
    member: ConfigNodeSummary
}