$version: "2.0"

namespace awlsring.proxmox

@documentation("Get the utilization and status of a virtual machine.")
@readonly
@http(method: "GET", uri: "/nodes/{node}/qemu/{vmId}/feature", code: 200)
operation GetVirtualMachineFeatureSupport {
    input: GetVirtualMachineFeatureSupportInput,
    output: GetVirtualMachineFeatureSupportOutput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure GetVirtualMachineFeatureSupportInput {
    @required
    @httpLabel
    node: NodeIdentifier

    @required
    @httpLabel
    @jsonName("vmid")
    vmId: VirtualMachineIdentifier

    @required
    @httpQuery("feature")
    @jsonName("feature")
    featureToCheck: String

    @httpQuery("snapname")
    @jsonName("snapname")
    snapshotName: String
}

@output
structure GetVirtualMachineFeatureSupportOutput {
    @required
    @jsonName("data")
    summary: VirtualMachineFeatureSupportSummary
}

structure VirtualMachineFeatureSupportSummary {
    @required
    @jsonName("hasFeature")
    hasFeature: BooleanInteger

    @required
    @jsonName("nodes")
    supportedNodes: NodeIdentifiers
}