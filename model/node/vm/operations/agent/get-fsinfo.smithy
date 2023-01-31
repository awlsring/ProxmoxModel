$version: "2.0"

namespace awlsring.proxmox

@documentation("Get the file system information on the virtual machine. Requries the guest agent to be installed and active.")
@readonly
@http(method: "GET", uri: "/nodes/{node}/qemu/{vmId}/agent/get-fsinfo", code: 200)
operation GetVirtualMachineFileSystemInformation {
    input: GetVirtualMachineFileSystemInformationInput,
    output: GetVirtualMachineFileSystemInformationOutput,
    errors: [
        InvalidInputError,
        InternalServerError,
        NoGuestAgentError
    ]
}

@input
structure GetVirtualMachineFileSystemInformationInput {
    @required
    @httpLabel
    node: NodeIdentifier

    @required
    @httpLabel
    @jsonName("vmid")
    vmId: VirtualMachineIdentifier
}

@output
structure GetVirtualMachineFileSystemInformationOutput {
    @required
    @jsonName("data")
    result: GetFsInfoResult
}

structure GetFsInfoResult {
    @jsonName("result")
    summaries: FileSystemInformationSummaries
}

structure FileSystemInformationSummary {
    disk: DiskInformationSummaries,

    name: String
    
    @jsonName("mountpoint")
    mountPoint: String,

    @jsonName("type")
    type: String,

    @jsonName("used-bytes")
    usedBytes: Long,

    @jsonName("total-bytes")
    totalBytes: Long
}

list FileSystemInformationSummaries {
    member: FileSystemInformationSummary
}

structure DiskInformationSummary {
    target: Integer,
    
    bus: Integer,

    @jsonName("pci-controller")
    pciController: PciControllerSummary,

    unit: Integer,

    @jsonName("dev")
    device: String,

    @jsonName("bus-type")
    busType: String,

    serial: String,
}

list DiskInformationSummaries {
    member: DiskInformationSummary
}

structure PciControllerSummary {
    bus: Integer
    domain: Integer
    function: Integer
    slot: Integer
}