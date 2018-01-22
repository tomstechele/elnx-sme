# Cheat sheets and checklists

- Student name: [Tom Stechele](https://github.com/tomstechele/)
- Github repo: [elnx-sme-tomstechele](https://github.com/tomstechele/elnx-sme-tomstechele)

## Basic commands

| Task                | Command |
| :---                | :---    |
| Query IP-adress(es) | `ip a`  |

## Git workflow

Simple workflow for a personal project without other contributors:

| Task                                         | Command                   |
| :---                                         | :---                      |
| Current project status                       | `git status`              |
| Select files to be committed                 | `git add FILE...`         |
| Commit changes to local repository           | `git commit -m 'MESSAGE'` |
| Push local changes to remote repository      | `git push`                |
| Pull changes from remote repository to local | `git pull`                |

## Checklist network configuration

1. Is the IP-adress correct? `ip a`
2. Is the router/default gateway correct? `ip r -n`
3. Is a DNS-server available? `cat /etc/resolv.conf`

## Add a rol to Ansible for the vagrant VMs
open `site.yml` in `Atom`

under roles:  add -bertvv.rhbase

> make sure there are 2 space in front of any added roles

## Downloading a role
1. Download the role from the github respository

[Role download](https://github.com/bertvv/ansible-role-rh-base/releases)

2. Open the `all.yml` file to make configurations to all servers.

```
rhbase_install_packages:
  - bash-completion
  - vim-enhanced
  - bind-utils
  - git
  - nano
  - tree
  - wget

```

3. Create a user with rhbase


```
rhbase_users:
  - name: tom
    comment: 'Tom Stechele'
    groups:
      - users
      - wheel

```
The group 'wheel' makes the user automatically sudo in Centos.
