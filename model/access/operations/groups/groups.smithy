$version: "2.0"

namespace awlsring.proxmox

resource Group {
    identifiers: { groupId: GroupIdentifier }
    list: ListGroups
    read: GetGroupDetails
    update: UpdateGroup
    delete: DeleteGroup
    operations: [ CreateGroup ]
}

string GroupIdentifier