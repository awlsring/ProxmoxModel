$version: "2.0"

namespace awlsring.proxmox

@documentation("List IPSet/Alias references which are allowed in source and destination properties of a virtual machine.")
@readonly
@http(method: "GET", uri: "/nodes/{node}/qemu/{vmId}/firewall/refs", code: 200)
operation ListVirtualMachineFirewallReferences {
    input: ListVirtualMachineFirewallReferencesInput,
    output: ListVirtualMachineFirewallReferencesOutput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure ListVirtualMachineFirewallReferencesInput {
    @required
    @httpLabel
    node: NodeIdentifier

    @required
    @httpLabel
    @jsonName("vmid")
    vmId: VirtualMachineIdentifier

    @httpQuery("type")
    type: FirewallReferenceType
}

@output
structure ListVirtualMachineFirewallReferencesOutput {
    @required
    @jsonName("data")
    summaries: VirtualMachineFirewallReferenceSummaries
}

structure VirtualMachineFirewallReferenceSummary {
    @required
    @jsonName("type")
    referenceType: FirewallReferenceType

    @required
    name: String

    comment: String
}

list VirtualMachineFirewallReferenceSummaries {
    member: VirtualMachineFirewallReferenceSummary
}

enum FirewallReferenceType {
    IP_SET = "ipset",
    ALIAS = "alias"
}