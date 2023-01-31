$version: "2.0"

namespace awlsring.proxmox

@documentation("Get the OS information of the virtual machine. Requries the guest agent to be installed and active.")
@readonly
@http(method: "GET", uri: "/nodes/{node}/qemu/{vmId}/agent/get-osinfo", code: 200)
operation GetVirtualMachineOperatingSystemInformation {
    input: GetVirtualMachineOperatingSystemInformationInput,
    output: GetVirtualMachineOperatingSystemInformationOutput,
    errors: [
        InvalidInputError,
        InternalServerError,
        NoGuestAgentError
    ]
}

@input
structure GetVirtualMachineOperatingSystemInformationInput {
    @required
    @httpLabel
    node: NodeIdentifier

    @required
    @httpLabel
    @jsonName("vmid")
    vmId: VirtualMachineIdentifier
}

@output
structure GetVirtualMachineOperatingSystemInformationOutput {
    @required
    @jsonName("data")
    result: GetOsInfoResult
}

structure GetOsInfoResult {
    @jsonName("result")
    summary: OperatingSystemInformationSummary
}

structure OperatingSystemInformationSummary {
    @jsonName("pretty-name")
    prettyName: String

    @jsonName("name")
    name: String

    @jsonName("version")
    version: String

    @jsonName("version-id")
    versionId: String

    @jsonName("id")
    id: String

    @jsonName("kernel-version")
    kernelVersion: String

    @jsonName("kernel-release")
    kernelRelease: String

    machine: String
}
