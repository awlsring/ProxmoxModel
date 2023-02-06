$version: "2.0"

namespace awlsring.proxmox

resource Token {
    identifiers: { 
        userId: UserIdentifier,
        tokenId: TokenIdentifier,
    },
    list: ListUserTokens,
    delete: DeleteUserToken,
    update: ModifyUserToken,
    read: GetUserToken,
    operations: [ CreateUserToken ]
}

string TokenIdentifier