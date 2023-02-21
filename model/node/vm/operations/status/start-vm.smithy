$version: "2.0"

namespace awlsring.proxmox

@documentation("Start the specified virtual machine.")
@http(method: "POST", uri: "/nodes/{node}/qemu/{vmId}/status/start", code: 200)
operation StartVirtualMachine {
    input: StartVirtualMachineInput,
    output: StartVirtualMachineOutput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure StartVirtualMachineInput {
    @required
    @httpLabel
    node: NodeIdentifier

    @required
    @httpLabel
    @jsonName("vmid")
    vmId: VirtualMachineIdentifier

    @jsonName("timeout")
    timeout: Integer

    @jsonName("skiplock")
    skipLock: BooleanInteger

    @jsonName("force-cpu")
    @documentation("Override QEMU `-cpu` argument.")
    overrideCpuArgs: String

    @jsonName("machine")
    @documentation("Specify QEMU machine type.")
    machineType: String

    @jsonName("migratedfrom")
    @documentation("Specify migrated from node.")
    migratedFrom: String

    @jsonName("migration_network")
    @documentation("Specify migration network.")
    migrationNetwork: String

    @jsonName("migration_type")
    @documentation("Specify migration type.")
    migrationType: VirtualMachineMigrationType

    @jsonName("stateuri")
    @documentation("Save/restore state from the URI.")
    stateUri: String

    @jsonName("targetstorage")
    @documentation("Specify target storage.")
    targetStorage: String
}

@output
structure StartVirtualMachineOutput {
    @required
    @jsonName("data")
    result: String
}

enum VirtualMachineMigrationType {
    SECURE = "secure",
    INSECURE = "insecure"
}