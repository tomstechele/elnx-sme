#!/bin/vbash
source /opt/vyatta/etc/functions/script-template

configure

# Fix for error "INIT: Id "TO" respawning too fast: disabled for 5 minutes"
delete system console device ttyS0

#
# Basic settings
#
set system host-name router #sets host name to Router
set system domain-name 'avalon.lan' #sets domain-name to avalon.lan
set service ssh port '22' #set service ssh port '22'

#
# IP settings
#// sets eth0 interface as the wan-link that gets its ip from the dhcp server
set interfaces ethernet eth0 address dhcp
set interfaces ethernet eth0 description "WAN link"

#sets the interface of the DMZ at eth1
set interfaces ethernet eth1 address 192.0.2.254/24
set interfaces ethernet eth1 description DMZ

#sets the interface of the internal LAN at eth2
set interfaces ethernet eth2 address 172.16.255.254/16
set interfaces ethernet eth2 description internal





#
# Network Address Translation
#

set nat source rule 200 outbound-interface 'eth1'
set nat source rule 200 translation address 'masquerade'
set nat source rule 200 source address '172.16.0.0/16'

set nat source rule 300 outbound-interface 'eth0'
set nat source rule 300 translation address 'masquerade'
set nat source rule 300 source address '172.16.0.0/16'




#
# Time
#

delete system ntp server 0.pool.ntp.org #Deletes old ntp servers that would remain after a provision
delete system ntp server 1.pool.ntp.org
delete system ntp server 2.pool.ntp.org
set system ntp server 'be.pool.ntp.org' # sets ntp server to the one for belgium
set system time-zone Europe/Brussels #sets the time zone to Europe/Brussels


#

#
# Domain Name Service
#

set service dns forwarding domain avalon.lan server 192.0.2.10 # sets the DNS forwarding domain and DNS server pu001
set service dns forwarding name-server 10.0.2.3 # sets the DNS of the IPS

#allow the eth1 and eth2 interfaces (the DMZ) to listen for DNS forwarding
set service dns forwarding listen-on 'eth1'
set service dns forwarding listen-on 'eth2'





# Make configuration changes persistent
commit
save

# Fix permissions on configuration
sudo chown -R root:vyattacfg /opt/vyatta/config/active

# vim: set ft=sh
