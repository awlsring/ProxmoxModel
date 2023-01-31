$version: "2.0"

namespace awlsring.proxmox

@documentation("Create a new virtual machine.")
@idempotent
@http(method: "DELETE", uri: "/nodes/{node}/qemu/{vmId}", code: 200)
operation DeleteVirtualMachine {
    input: DeleteVirtualMachineInput,
    output: DeleteVirtualMachineOutput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure DeleteVirtualMachineInput {
    @required
    @httpLabel
    node: NodeIdentifier

    @required
    @httpLabel
    @jsonName("vmid")
    vmId: VirtualMachineIdentifier

    @httpQuery("destory-unreferenced-disks")
    @jsonName("destroy-unreferenced-disks")
    @documentation("Destroy disks that are not referenced in the config.")
    destroyUnreferencedDisks: BooleanInteger

    @httpQuery("purge")
    @documentation("Purge the VM from the configurations, backups, jobs, and HA.")
    purge: BooleanInteger

    @httpQuery("skiplock")
    @documentation("Skip the lock check. Only valid for root.")
    skipLock: BooleanInteger
}

@output
structure DeleteVirtualMachineOutput {
    @required
    @jsonName("data")
    result: String
}