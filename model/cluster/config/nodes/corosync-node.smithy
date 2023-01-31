namespace awlsring.proxmox

resource CorosyncNode {
    identifiers: { node: NodeIdentifier },
    list: ListCorosyncNodes,
    delete: RemoveCorosyncNode
    operations: [ AddCorosyncNode ]
}

structure CorosyncNodeSummary {
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
    name: NodeIdentifier

    @jsonName("pve_addr")
    pveAddress: String
}

list CorosyncNodeSummaries {
    member: CorosyncNodeSummary
}