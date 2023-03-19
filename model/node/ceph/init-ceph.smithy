$version: "2.0"

namespace awlsring.proxmox

@http(method: "POST", uri: "/nodes/{node}/ceph/init", code: 200)
operation InitCephCluster {
    input: InitCephClusterInput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure InitCephClusterInput {
    @required
    @httpLabel
    node: NodeIdentifier

    @jsonName("cluster-network")
    clusterNetwork: String

    @jsonName("disable_cephx")
    disableCephx: BooleanInteger

    @jsonName("min_size")
    minimumReplicas: Integer

    @jsonName("network")
    publicNetwork: String

    @jsonName("pg_bits")
    placementGroupBits: Integer

    @jsonName("size")
    replicas: Integer
}