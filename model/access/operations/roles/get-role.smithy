$version: "2.0"

namespace awlsring.proxmox

@readonly
@http(method: "GET", uri: "/access/roles/{roleId}", code: 200)
operation GetRole {
    input: GetRoleInput,
    output: GetRoleOutput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure GetRoleInput {
    @required
    @httpLabel
    @jsonName("roleid")
    roleId: RoleIdentifier
}

@output
structure GetRoleOutput {
    @required
    @jsonName("data")
    summary: RolePermissionSummary
}

structure RolePermissionSummary {
    @jsonName("Datastore.Allocate")
    datastoreAllocate: BooleanInteger,

    @jsonName("Datastore.AllocateSpace")
    datastoreAllocateSpace: BooleanInteger,

    @jsonName("Datastore.Audit")
    datastoreAudit: BooleanInteger,

    @jsonName("Datastore.AllocateTemplate")
    datastoreAllocateTemplate: BooleanInteger,

    @jsonName("Group.Allocate")
    groupAllocate: BooleanInteger,

    @jsonName("Permission.Modify")
    permissionModify: BooleanInteger,

    @jsonName("Pool.Allocate")
    poolAllocate: BooleanInteger,

    @jsonName("Pool.Audit")
    poolAudit: BooleanInteger,

    @jsonName("Realm.Allocate")
    realmAllocate: BooleanInteger,

    @jsonName("Realm.AllocateUser")
    realmAllocateUser: BooleanInteger,

    @jsonName("SDN.Allocate")
    sdnAllocate: BooleanInteger,

    @jsonName("SDN.Audit")
    sdnAudit: BooleanInteger,

    @jsonName("Sys.Audit")
    sysAudit: BooleanInteger,

    @jsonName("Sys.Modify")
    sysModify: BooleanInteger,

    @jsonName("Sys.Console")
    sysConsole: BooleanInteger,

    @jsonName("Sys.Incoming")
    sysIncoming: BooleanInteger,

    @jsonName("Sys.PowerMgmt")
    sysPowerMgmt: BooleanInteger,

    @jsonName("Sys.Syslog")
    sysSyslog: BooleanInteger,

    @jsonName("User.Modify")
    userModify: BooleanInteger,

    @jsonName("VM.Allocate")
    vmAllocate: BooleanInteger,

    @jsonName("VM.Audit")
    vmAudit: BooleanInteger,

    @jsonName("VM.Backup")
    vmBackup: BooleanInteger,

    @jsonName("VM.Clone")
    vmClone: BooleanInteger,

    @jsonName("VM.Config.CDROM")
    vmConfigCdrom: BooleanInteger,

    @jsonName("VM.Config.CPU")
    vmConfigCpu: BooleanInteger,

    @jsonName("VM.Config.Cloudinit")
    vmConfigCloudinit: BooleanInteger,

    @jsonName("VM.Config.Disk")
    vmConfigDisk: BooleanInteger,

    @jsonName("VM.Config.HWType")
    vmConfigHwType: BooleanInteger,

    @jsonName("VM.Config.Memory")
    vmConfigMemory: BooleanInteger,

    @jsonName("VM.Config.Network")
    vmConfigNetwork: BooleanInteger,

    @jsonName("VM.Config.Options")
    vmConfigOptions: BooleanInteger,

    @jsonName("VM.Console")
    vmConsole: BooleanInteger,

    @jsonName("VM.Migrate")
    vmMigrate: BooleanInteger,

    @jsonName("VM.Monitor")
    vmMonitor: BooleanInteger,

    @jsonName("VM.PowerMgmt")
    vmPowerMgmt: BooleanInteger,

    @jsonName("VM.Snapshot")
    vmSnapshot: BooleanInteger,

    @jsonName("VM.Snapshot.Rollback")
    vmSnapshotRollback: BooleanInteger,
}