$version: "2.0"

namespace awlsring.proxmox

resource NodeStorage {
    identifiers: {
        node: NodeIdentifier,
        storage: StorageIdentifier
    },
    list: ListNodeStorage,
    resources: [ StorageVolume ],
    operations: [
        GetStorageStatus,
        CreateStorageVolume,
        UploadToStorage,
        DownloadFromUrlToStorage,
    ]
}

enum UploadContentType {
    ISO = "iso",
    VZ_DUMP = "vztmpl",
}

enum ChecksumAlgorithm {
    MD5 = "md5",
    SHA1 = "sha1",
    SHA224 = "sha224",
    SHA256 = "sha256",
    SHA384 = "sha384",
    SHA512 = "sha512",
}