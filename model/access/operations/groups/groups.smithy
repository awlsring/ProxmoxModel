$version: "2.0"

namespace awlsring.proxmox

resource Group {
    identifiers: { groupId: GroupIdentifier }
    list: ListGroups
    read: GetGroupDetails
}

string GroupIdentifier