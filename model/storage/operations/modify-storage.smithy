$version: "2.0"

namespace awlsring.proxmox

@idempotent
@http(method: "PUT", uri: "/storage/{storage}", code: 200)
operation ModifyStorage {
    input: ModifyStorageInput,
    output: ModifyStorageOutput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure ModifyStorageInput {
    @required
    @httpLabel
    storage: StorageName

    @jsonName("blocksize")
    blockSize: String

    @jsonName("bwlimit")
    bandwidthLimit: String

    @jsonName("comstar_hg")
    comstarHostGroup: String

    @jsonName("comstar_tg")
    comstarTargetGroup: String

    @documentation("Allowed content types.")
    content: String

    @jsonName("data-pool")
    @documentation("Data pool, only for erasure coding")
    dataPool: String

    @documentation("A list of settings to delete.")
    delete: String

    @documentation("Prevent change if current configuration has a different SHA1 digest.")
    digest: String

    @jsonName("disable")
    @documentation("Disable the storage")
    disabled: Boolean

    @jsonName("domain")
    @documentation("CIFS domain")
    cifsDomain: String

    @jsonName("encryption-key")
    @documentation("Encryption key for storage. Use 'autogen' to generate one automatically without passphrase.")
    encryptionKey: String

    @documentation("Certificate SHA256 fingerprint")
    fingerprint: String

    @documentation("Default image format")
    format: String

    @documentation("The ceph filesystem name")
    @jsonName("fs-name")
    cephFsName: String

    @documentation("Mount CephFS through FUSE")
    @jsonName("fuse")
    useFuse: Boolean

    @documentation("Assume the given path is an externally managed mountpoint. This is a string boolean, using 'yes' or 'no'")
    @jsonName("is_mountpoint")
    isMountPoint: String

    @documentation("Client keyring contents")
    keyring: String

    @documentation("Always access rbd through krbd kernel module")
    krbd: Boolean

    @documentation("Target portal group for Linux LIO targets")
    @jsonName("lio_tpg")
    lioTargetPortalGroup: String

    @documentation("Base64 encoded, PEM formatted public RSA key")
    @jsonName("master-pubkey")
    masterPublicKey: String

    @documentation("Mac number of protected backups. Defaults to unlimited")
    @jsonName("max-protected-backups")
    maxProtectedBackups: Integer

    @documentation("Maximum number of files.")
    @jsonName("maxfiles")
    maxFiles: Integer

    @documentation("Create the directory if doesnt exist. Defaults to true.")
    @jsonName("mkdir")
    makeDirectory: Boolean

    @documentation("IP addresses of monitors.")
    @jsonName("monhost")
    monitorHosts: String

    @documentation("The mount point")
    @jsonName("mountpoint")
    mountPoint: String

    @documentation("The namespace")
    namespace: String

    @documentation("Set the NOCOW flag on files. This is a boolean integer, using 0 for false or 1 for true.")
    @jsonName("nocow")
    noCow: Integer

    @documentation("Comma seperated list of node names")
    nodes: String

    @documentation("Disable write caching on the target.")
    @jsonName("nowritecache")
    noWriteCache: Boolean

    @documentation("NFS mount options.")
    @jsonName("options")
    nfsOptions: String

    @documentation("Password for accessing the datastore")
    password: String

    @documentation("The pool name")
    pool: String

    @documentation("For non default port")
    port: Integer

    @documentation("Preallocation mode for raw and qcow images.")
    @jsonName("preallocation")
    preallocation: StoragePreallocation

    @documentation("The retention options.")
    @jsonName("prune-backups")
    pruneBackups: String

    @documentation("Zero out data when removing LVs")
    @jsonName("saferemove")
    safeRemove: Boolean

    @documentation("Wipe throughput.")
    @jsonName("saferemove-throughput")
    safeRemoveThroughput: String

    @documentation("Server IP or DNS name")
    server: String

    @documentation("Backup server IP or DNS name")
    @jsonName("server2")
    backupServer: String

    @documentation("Indicates if the storage is shared.")
    @jsonName("shared")
    isShared: Boolean

    @documentation("The SMB version.")
    @jsonName("smbversion")
    smbVersion: StorageSMBVersion

    @documentation("Use sparse volumes.")
    @jsonName("sparse")
    isSparse: Boolean

    @documentation("The subdir to mount.")
    @jsonName("subdir")
    subDirectory: String

    @documentation("Only use logical volumes tagged with 'pve-vm-ID'.")
    @jsonName("tagged_only")
    useTaggedOnly: Boolean

    @documentation("Gluster transport type.")
    @jsonName("transport")
    transport: StorageTransport

    @documentation("The username to use.")
    username: String
}

@output
structure ModifyStorageOutput {
    @required
    @jsonName("data")
    configuration: StorageConfiguration
}