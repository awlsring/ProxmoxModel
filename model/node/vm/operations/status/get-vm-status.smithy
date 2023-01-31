$version: "2.0"

namespace awlsring.proxmox

@documentation("Get the utilization and status of a virtual machine.")
@readonly
@http(method: "GET", uri: "/nodes/{node}/qemu/{vmId}/status/current", code: 200)
operation GetVirtualMachineStatus {
    input: GetVirtualMachineStatusInput,
    output: GetVirtualMachineStatusOutput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure GetVirtualMachineStatusInput {
    @required
    @httpLabel
    node: NodeIdentifier

    @required
    @httpLabel
    @jsonName("vmid")
    vmId: VirtualMachineIdentifier
}

@output
structure GetVirtualMachineStatusOutput {
    @required
    @jsonName("data")
    status: VirtualMachineStatusSummary
}

structure VirtualMachineStatusSummary {
    @required
    @jsonName("status")
    status: VirtualMachineStatus

    @required
    @jsonName("ha")
    highAvailability: VirtualMachineHighAvailabilityStatus

    @required
    @jsonName("vmid")
    id: VirtualMachineIdentifierInteger

    @jsonName("agent")
    agentInstalled: BooleanInteger

    @jsonName("cpus")
    cpuCount: Integer

    @jsonName("lock")
    lock: String

    @jsonName("maxdisk")
    maxDisk: Long

    @jsonName("maxmem")
    maxMemory: Long

    name: String

    @jsonName("pid")
    processId: Integer

    @jsonName("qmpstatus")
    qmpStatus: String

    @jsonName("running-machine")
    runningMachineType: String

    @jsonName("running-qemu")
    runningQemuVersion: String

    @jsonName("spice")
    spiceEnabled: BooleanInteger

    tags: String

    @jsonName("uptime")
    upTime: Long

    @jsonName("cpu")
    cpuUtilization: Float

    @jsonName("mem")
    memoryUtilization: Long

    @jsonName("balloon")
    balloonUtilization: Long

    @jsonName("disk")
    disk: Long

    @jsonName("netin")
    networkIn: Long

    @jsonName("netout")
    networkOut: Long

    @jsonName("diskwrite")
    diskWrite: Long

    @jsonName("diskread")
    diskRead: Long

    @jsonName("freemem")
    freeMemory: Long

    @jsonName("nics")
    networkInterfaces: VirtualMachineNicStatusMap

    @jsonName("ballooninfo")
    balloonSummary: VirtualMachineBalloonSummary

    @jsonName("blockstat")
    blockStatistics: VirtualMachineNicBlockStatisticsMap

    @jsonName("proxmox-support")
    proxmoxSupport: ProxmoxSupportSummary
}

structure VirtualMachineHighAvailabilityStatus {
    @required
    managed: BooleanInteger
}

structure ProxmoxSupportSummary {
    @jsonName("pbs-library-version")
    libraryVersion: String

    @jsonName("pbs-masterkey")
    masterKey: Boolean

    @jsonName("pbs-dirty-bitmap-savevm")
    dirtyBitmapSaveVm: Boolean

    @jsonName("pbs-dirty-bitmap-migration")
    dirtyBitmapMigration: Boolean

    @jsonName("pbs-dirty-bitmap")
    dirtyBitmap: Boolean

    @jsonName("backup-max-workers")
    backupMaxWorkers: Boolean

    @jsonName("query-bitmap-info")
    queryBitmapInfo: Boolean
}

structure VirtualMachineNicStatus {
    @jsonName("netin")
    networkIn: Long

    @jsonName("netout")
    networkOut: Long
}

map VirtualMachineNicStatusMap {
    key: String,
    value: VirtualMachineNicStatus
}

structure VirtualMachineNicBlockStatistics {
    @jsonName("flush_total_time_ns")
    flushTotalTimeNs: Long

    @jsonName("rd_bytes")
    readBytes: Long

    @jsonName("timed_stats")
    timedStats: StringList //could be int list, none of my tests have data here

    @jsonName("wr_highest_offset")
    writeHighestOffset: Long

    @jsonName("rd_total_time_ns")
    readTotalTimeNs: Long

    @jsonName("flush_operations")
    flushOperations: Integer

    @jsonName("wr_operations")
    writeOperations: Integer

    @jsonName("idle_time_ns")
    idleTimeNs: Long

    @jsonName("wr_merged")
    writeMerged: Integer

    @jsonName("invalid_rd_operations")
    invalidReadOperations: Integer

    @jsonName("failed_flush_operations")
    failedFlushOperations: Integer

    @jsonName("unmap_bytes")
    unmapBytes: Long

    @jsonName("failed_rd_operations")
    failedReadOperations: Integer

    @jsonName("wr_bytes")
    writeBytes: Long

    @jsonName("invalid_flush_operations")
    invalidFlushOperations: Integer

    @jsonName("unmap_operations")
    unmapOperations: Integer
    
    @jsonName("wr_total_time_ns")
    writeTotalTimeNs: Long

    @jsonName("failed_wr_operations")
    failedWriteOperations: Integer

    @jsonName("unmap_merged")
    unmapMerged: Integer

    @jsonName("invalid_wr_operations")
    invalidWriteOperations: Integer

    @jsonName("rd_operations")
    readOperations: Integer

    @jsonName("unmap_total_time_ns")
    unmapTotalTimeNs: Long

    @jsonName("invalid_unmap_operations")
    invalidUnmapOperations: Integer

    @jsonName("account_failed")
    accountFailed: Boolean

    @jsonName("account_invalid")
    accountInvalid: Boolean

    @jsonName("rd_merged")
    readMerged: Integer

    @jsonName("failed_unmap_operations")
    failedUnmapOperations: Integer
}

map VirtualMachineNicBlockStatisticsMap {
    key: String,
    value: VirtualMachineNicBlockStatistics
}

structure VirtualMachineBalloonSummary {
    @jsonName("max_mem")
    maxMemory: Long

    @jsonName("free_mem")
    freeMemory: Long

    @jsonName("mem_swapped_out")
    memorySwappedOut: Long

    @jsonName("mem_swapped_in")
    memorySwappedIn: Long

    @jsonName("total_mem")
    totalMemory: Long

    @jsonName("actual")
    actualMemory: Long

    @jsonName("last_update")
    lastUpdate: Long

    @jsonName("minor_page_faults")
    minorPageFaults: Long

    @jsonName("major_page_faults")
    majorPageFaults: Long
}