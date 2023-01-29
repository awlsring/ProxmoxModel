$version: "2.0"

namespace awlsring.proxmox

@http(method: "POST", uri: "/cluster/config/nodes/{node}", code: 200)
operation AddCorosyncNode {
    input: AddCorosyncNodeInput,
    output: AddCorosyncNodeOutput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure AddCorosyncNodeInput {
    @required
    @httpLabel
    node: NodeName

    @documentation("The api version on the new node")
    @jsonName("apiversion")
    apiVersion: Integer

    @documentation("Do not throw an error if the node is already in the cluster")
    force: Boolean

    @documentation("Address and priority of the link. Input as string with format address=<ip>,priority=<int>")
    link0: String

    @documentation("Address and priority of the link. Input as string with format address=<ip>,priority=<int>")
    link1: String

    @documentation("Address and priority of the link. Input as string with format address=<ip>,priority=<int>")
    link2: String

    @documentation("Address and priority of the link. Input as string with format address=<ip>,priority=<int>")
    link3: String

    @documentation("Address and priority of the link. Input as string with format address=<ip>,priority=<int>")
    link4: String

    @documentation("Address and priority of the link. Input as string with format address=<ip>,priority=<int>")
    link5: String

    @documentation("Address and priority of the link. Input as string with format address=<ip>,priority=<int>")
    link6: String

    @documentation("Address and priority of the link. Input as string with format address=<ip>,priority=<int>")
    link7: String

    @documentation("The IP address of the node to add")
    @jsonName("new_node_ip")
    newNodeIp: String

    @documentation("NodeID of the node to add")
    @jsonName("nodeid")
    nodeId: Integer

    @documentation("Votes thew new node should have")
    votes: Integer
}

@output
structure AddCorosyncNodeOutput {
    @required
    @jsonName("data")
    corosyncSettings: CorosyncSettings
}

structure CorosyncSettings {
    @required
    @jsonName("corosync_authkey")
    corosyncAuthKey: String

    @required
    @jsonName("corosync_conf")
    corosyncConfiguration: String

    @required
    @jsonName("warnings")
    warnings: String
}