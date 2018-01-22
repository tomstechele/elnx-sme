# Cheat sheets and checklists

- Student name: NAME
- Github repo: URL

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

## Vagrant commands
| Command                  |Werking                                                                                                                                  |
| :---                                               | :---                                                  |
| `vagrant ssh pu004` | In virtuele machine pu004 gaan, na ssh kan je machine specifiëren |
| `vagrant up pu004` | Virtule machine opstarten, na up kan je machine specifiëren |
| `vagrant provision pu004`  | Na vagrant up kan je wijzigingen toepassen op je lopende virtuele machines |
| `vagrant halt pu004` | Virtuele machine uitschakelen, na halt kan je machine specifiëren. Als je niets meegeeft, schakel je alle machines uit. |
| `vagrant destroy pu004` | Virtuele machine verwijderen, als je niets meegeeft, worden alle machines verwijderd. |

## Linux commands
| Command                                                              | Werking                                            |
| :---                                               | :---                                                  |
| `sudo /vagrant/test/runbats.sh`  | Acceptatietesten uitvoeren      |
| `yum install mod_ssl openssl` | SSL installeren |
| `openssl genrsa -out ca.key 2048` | Private key genereren |
| `openssl x509 -req -days 365 -in ca.csr -signkey ca.key -out ca.crt` | Self signed key genereren |
| `route -n` | Routering checken |



## Ansible commands
| Command                                                                         | Werking                                                                                                                   |
| :---                                                       | :---                                                  |
| `rhbase_firewall_allow_services`          | Firewall services die moeten doorgelaten worden. Http, https en dns toevoegen voor toegang vanaf het host-systeem. |
| `wheel` | Voor groups: paswoordloze sudo rechten geven.
| `wp_db.*:ALL` | Alle rechten geven aan een mariadb user. |
| `pre_tasks` | Taken die moeten uitgevoerd worden voor de machine runt. |
| `bind_zone_master_server_ip` | Server IP van master, slave gebruikt ook dit IP. |
| `httpd_SSLCertificateFile` | Crt file(certificaat) specifiëren(directory).
| `httpd_SSLCertificateKeyFile` | Key file(certificaat) specifiëren(directory).
| `bind_zone_networks` | Netwerken specifiëren die deel uitmaken van het domain. |
| `directory_mode`  | Specifiekere permissies toekennen. |
| `valid_users` | Leesrechten toekennen. |
| `write_list` | Schrijfrechten toekennen. |
| `dhcp_hosts` | DHCP hosts definiëren. |
| `mac` | Voor in dhcp_hosts, om de 2 karakters scheiding met ":" aanduiden.|
| `set service dns forwarding listen-on 'eth1'` | Specifiëren op welke interface de VyOS moet luisteren, bijv 'eth1' |
