$version: "2.0"

namespace awlsring.proxmox

list StringList {
    member: String
}

list IntegerList {
    member: Integer
}

@pattern("^[a-fA-F0-9-]+$")
string UUID

@documentation("An integer used to represent a boolean. 0 is false, 1 is true.")
@range(min: 0, max: 1)
integer BooleanInteger

@documentation("A string used to represent a boolean integer, because why not?")
@pattern("^(0|1)$")
string BooleanIntegerString