# ProxmoxModel

This is an attempt to model the Proxmox API to allow for easier client generation.

The api is very large so this has a long way to go.

To do some manual testing, I'm using a workflow to generate and publish a go client. This can be found [at my proxmox-go repo](https://github.com/awlsring/proxmox-go)

## Progress

This is a tracker of what resources have been implemented and what is left to do.

- [ ] access (in progress)
    - [x] domains
    - [x] groups
    - [ ] roles
    - [ ] openid
    - [ ] roles
    - [ ] tfa
    - [x] users

- [ ] cluster
    - [ ] acme
    - [ ] backup
    - [ ] backup-info
    - [x] config
    - [ ] firewall
    - [ ] ha
    - [ ] jobs
    - [ ] metrics
    - [ ] replication
    - [ ] sdn

- [ ] nodes (in progress)
    - [x] apt
    - [x] capabilities
    - [ ] ceph
    - [x] certificates
    - [x] disks
    - [ ] firewall
    - [x] hardware
    - [ ] lxc
    - [x] network
    - [ ] qemu  (in progress)
        - [ ] agent
        - [x] cloudinit
        - [ ] firewall
        - [ ] snapshot
        - [ ] status (in progress)
    - [ ] replication
    - [ ] scan
    - [ ] sdn
    - [ ] services
    - [ ] storage
    - [ ] tasks
    - [ ] vzdump

- [x] pools
- [x] storage