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

## Certificates
1. Generate a private key

`openssl genrsa -out ca.key 2048`
> This generates a CSR: Certificate Signing Request key

2. Generate csr

`openssl req -new -key ca.key -out ca.csr`
> This generates a self signed key

3. Copy the files to the correct locations with a pre task

```
pre_tasks:
  - name: copy key file
    copy:
      src: files/pu004.key
      dest: /etc/pki/tls/private/pu004.key
  - name: copy cert files
    copy:
      src: files/pu004.crt
      dest: /etc/pki/tls/certs/

```

> automation of the Certificates, its copy the .crt and .key to the folder that you made.

4. Change paths for key and crt file

```
httpd_SSLCertificateFile: /etc/pki/tls/certs/pu004.crt
httpd_SSLCertificateKeyFile: /etc/pki/tls/private/pu004.key
```
