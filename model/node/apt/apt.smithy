$version: "2.0"

namespace awlsring.proxmox

resource Apt {
    identifiers: {
        node: NodeIdentifier
    }
    operations: [
        GetPackageChangelog,
        ListRepositoriesInformation,
        ChangeRepositoryProperties,
        AddRepository,
        ListUpdates,
        ListPackages
    ]
}