$version: "2.0"

namespace awlsring.proxmox

@http(method: "POST", uri: "/cluster/config/join", code: 200)
operation JoinCluster {
    input: JoinClusterInput,
    output: JoinClusterOutput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure JoinClusterInput {
    @required
    @documentation("The fingerprint of the cluster certificate")
    fingerprint: String

    @required
    @documentation("The hostname or IP address an existing cluster node")
    hostname: String

    @required
    @documentation("Password for the node root user")
    password: String

    force: Boolean

    link0: String

    link1: String

    link2: String

    link3: String

    link4: String

    link5: String

    link6: String

    link7: String

    @documentation("The node ID to use for the joining node")
    @jsonName("nodeid")
    nodeId: Integer

    @documentation("Votes for the node")
    votes: Integer
}

@output
structure JoinClusterOutput {
    @required
    data: String
}