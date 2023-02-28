$version: "2.0"

namespace awlsring.proxmox

resource VirtualMachine {
    identifiers: {
        node: NodeIdentifier,
        vmId: VirtualMachineIdentifier
    },
    delete: DeleteVirtualMachine,
    list: ListVirtualMachines,
    resources: [ Snapshot ]
    operations: [
        CreateVirtualMachine,
        CreateVirtualMachineTemplate,
        GetPendingVirtualMachineCloudInitChanges,
        GetVirtualMachineCloudInit,
        RegenerateVirtualMachineCloudInit,
        ResizeVirtualMachineDisk,
        UnlinkVirtualMachineDisks,
        ListPendingVirtualMachineConfigurationChanges,
        GetVirtualMachineStatus,
        GetVirtualMachineConfiguration
        ApplyVirtualMachineConfigurationAsync,
        ApplyVirtualMachineConfigurationSync,
        CloneVirtualMachine,
        GetVirtualMachineFeatureSupport,
        GetVirtualMachineFileSystemInformation,
        GetVirtualMachineHostname,
        GetVirtualMachineMemoryBlockInformation,
        GetVirtualMachineMemoryBlocks,
        GetVirtualMachineOperatingSystemInformation,
        GetVirtualMachineTime,
        GetVirtualMachineTimeZone,
        GetVirtualMachineVcpus,
        GetVirtualMachineAgentInfo,
        GetVirtualMachineNetworkInterfaces,
        PingVirtualMachine,
        VirtualMachineExecuteCommand,
        GetVirtualMachineCommandStatus,
        VirtualMachineReadFile,
        VirtualMachineWriteFile,
        RebootVirtualMachine,
        StartVirtualMachine,
        StopVirtualMachine,
        ShutdownVirtualMachine,
        ResetVirtualMachine,
        ResumeVirtualMachine,
        SuspendVirtualMachine,
        ListVirtualMachineFirewallReferences
    ]
}

@documentation("The id of the virtual machine as a string")
string VirtualMachineIdentifier

@documentation("The id of the virtual machine as an integer")
integer VirtualMachineIdentifierInteger

structure VirtualMachineSummary {
    @required
    @jsonName("vmid")
    @documentation("The ID of the virtual machine. Unique across cluster")
    id: VirtualMachineIdentifierInteger,

    @required
    @documentation("The status of the virtual machine")
    status: VirtualMachineStatus,

    @jsonName("template")
    isTemplate: BooleanInteger,

    @jsonName("mem")
    @documentation("Current memory utilization in bytes")
    memory: Long,

    @jsonName("maxmem")
    @documentation("Max memory allocated in bytes")
    maxMemory: Long,

    @jsonName("maxdisk")
    @documentation("Max root disk size in bytes")
    maxDisk: Long,

    @documentation("The name of the virtual machine")
    name: String,

    @documentation("The uptime of the virtual machine in seconds")
    uptime: Long,

    @jsonName("netin")
    @documentation("Current incoming network traffic in bytes")
    netIn: Long,

    @jsonName("netout")
    @documentation("Current outgoing network traffic in bytes")
    netOut: Long,

    @jsonName("diskread")
    @documentation("Current disk read in bytes")
    diskRead: Long,

    @jsonName("diskwrite")
    @documentation("Current disk write in bytes")
    diskWrite: Long,

    @jsonName("cpu")
    @documentation("The virtual machines cpu utilization in percent")
    cpuUtilization: Float,

    @jsonName("cpus")
    @documentation("Amount of CPU cores allocated to the virtual machine")
    cpuCount: Integer,

    @documentation("PID of the qemu process on the host node")
    pid: Integer,

    @documentation("Tags assigned to the virtual machine. Comma separated list of tags returned as a string.")
    tags: String,

    @documentation("The current configuration lock")
    lock: String,

    @jsonName("qmpstatus")
    @documentation("Qemu QMP agent status")
    qmpStatus: String
}

enum VirtualMachineStatus {
    RUNNING = "running",
    STOPPED = "stopped",
}

list VirtualMachineSummaries {
    member: VirtualMachineSummary
}