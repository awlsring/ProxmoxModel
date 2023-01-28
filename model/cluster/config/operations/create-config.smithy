$version: "2.0"

namespace awlsring.proxmox

@http(method: "POST", uri: "/cluster/config", code: 200)
operation CreateClusterConfig {
    input: CreateClusterConfigInput,
    output: CreateClusterConfigOutput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure CreateClusterConfigInput {
    @required
    @jsonName("clustername")
    @documentation("Cluster name")
    clusterName: String

    link0: String

    link1: String

    link2: String

    link3: String

    link4: String

    link5: String

    link6: String

    link7: String

    @jsonName("nodeid")
    @documentation("Node ID for the node")
    nodeId: Integer

    @documentation("Votes for the node")
    votes: Integer
}

@output
structure CreateClusterConfigOutput {
    @required
    data: String
}