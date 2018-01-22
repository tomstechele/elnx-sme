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


# Dig commando

| Task                                         | Command                   |
| :---                                         | :---                      |
| Querying DNS nameservers                     | `dig mt-example.com`              |


## What can you find using the dig command?

- IP address
- text annotations
- mail exchanges
- NS nameservers
