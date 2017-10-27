# Enterprise Linux Lab Report - Troubleshooting

- Student name: Tom Stechele
- Class/group: TIN-TI-3B (Gent),

## Instructions

- Write a detailed report in the "Report" section below (in Dutch or English)
- Use correct Markdown! Use fenced code blocks for commands and their output, terminal transcripts, ...
- The different phases in the bottom-up troubleshooting process are described in their own subsections (heading of level 3, i.e. starting with `###`) with the name of the phase as title.
- Every step is described in detail:
    - describe what is being tested
    - give the command, including options and arguments, needed to execute the test, or the absolute path to the configuration file to be verified
    - give the expected output of the command or content of the configuration file (only the relevant parts are sufficient!)
    - if the actual output is different from the one expected, explain the cause and describe how you fixed this by giving the exact commands or necessary changes to configuration files
- In the section "End result", describe the final state of the service:
    - copy/paste a transcript of running the acceptance tests
    - describe the result of accessing the service from the host system
    - describe any error messages that still remain

## Report

### General settings

* There was a problem with the ova file one cable of the adapters was not connected `enp0s8 connect cable`.
* We use `loadkeys be` to change the keyboard layout qwerty to azerty ( much better!!)


### Phase 1: Link

* Check the network adapters with commando `ip a`
  * The adapters should all be `up`.

### Phase 2: Internet

  * Check the adapter so they have the correct IP addresses with commando  `ip a`:
    * enp0s3 should have `10.0.2.15`, the default NAT IP from VB
    * enp0s8 should have `192.168.56.42` as the assignment prescribes
    * Both interfaces have the correct IP's
  * A default gateway should be defined
    * Issue `ip r`
    * The expected value is `10.0.2.2`, the VB default
    * The Default Gateway is correct
  * The DNS-server should be defined
    * Issue `cat /etc/resolv.conf`
    * The expected value for nameserver is `10.0.2.3`, the VB default
    * The DNS-server is correct
  * Execute some ping commands, they should **ALL** succeed
    * The Default Gateway: `ping 10.0.2.2 `
    * The DNS-server: `ping 10.0.2.3`
    * The host of the Virtual Machine (VM): `ping 192.168.56.1`
    * The VM from the host: `ping 192.168.56.42`
    * The pings were successful

### Phase 3: Transport

### 3.1 Service

  * Check if the service is running
      > sudo systemctl status nginx.service

  * The output should state that the service is `Active`
     * Output shows `inactive (dead)` and `Failed to start The nginx HTTP and reverse proxy server`
     * Try to start the service
          > sudo systemctl start nginx.service

  * The service did not start
  * Check the journal for errors with the startup
       	> sudo journalctl -u nginx.service | less

     * Errormessage about a missing file or directory
     * Error describes `/etc/pki/tls/certs/nigxn.pem` while you would expect `/etc/pki/tls/certs/nginx.pem`
     * Check the nginx configuration file
    	  > sudo vi /etc/nginx/nginx.conf

     * Scroll to the line with `ssl_certificate`
     * There's a typo in the path to the `nginx.pem` file
     * Correct the typo from `/etc/pki/tls/certs/nigxn.pem` to `/etc/pki/tls/certs/nginx.pem` use insert `i` to correct the type and exit vi with `:wq`

     * Try to start the service, the service should start without errors
     > sudo systemctl start nginx.service

     * The service started without errors
     * Check if the service is running
       > sudo systemctl status nginx.service

       * The service is running
       * Make the service start at boot
       > sudo systemctl enable nginx.service

### 3.2 Ports

* Check to which ports nginx listens
       > sudo ss -tulpn      

* From the configuration file `/etc/nginx/nginx.conf` we use vi to enter the file, we should expect it to listen to `port 80`
       * Port 80 is listed as expected
       * We see that nginx is configured to listen to `port 8443` for https
       * Change this setting in `/etc/nginx/nginx.conf` to `port 443`, the default port for https
           > sudo vi /etc/nginx/nginx.conf

       * Go to the second server section and change `8443` to `443`
         * Exit vi with `:wq`            


* Check to which ports nginx listens
    > sudo ss -tulpn

* The output should state that nginx listens to port 80 and port 443
* Nginx listens to port 80 and port 443

### 3.3 Firewall

* Check the Firewall rules
    > sudo firewall-cmd --list-all

* We expect to see the 2 interfaces `enp0s3` and `enp0s8` listed in the active default public zone
     * Public is de default zone and is Active
     * `enp0s8` is not listed as an interface of this zone
     * Add the interface to the public zone
        > sudo firewall-cmd --permanent --zone=public --change-interface=enp0s8

     * Restart the firewall to apply the changes
         > sudo firewall-cmd --reload

     * Check the changes
        > sudo firewall-cmd --list-all

     * `enp0s8` should be listed in the interface section
     * `enp0s8` is indeed listed in the interface section

    * To have `https` enabled, we expect the service to be listed in the services section
    * `https` is not listed
    * Add `https`
    > sudo firewall-cmd --zone=public --permanent --add-service=https

* Restart the firewall to apply the changes
    > sudo firewall-cmd --reload

* Check the changes
    > sudo firewall-cmd --list-all

 * `https` shoud be listed in the interface section
 * `https` is indeed listed in the interface section.


    * From this point, we should at least be able to access the IP over http and https, the browser shouldn't give default errors anymore
      * Access `192.168.56.42` from the browser
        * We get `Access denied.`, not a default browser error
      * Access `https://192.168.56.42` from the browser
        * We get `Access denied.`, not a default browser error

        ### Phase 4: Application

        As described in the previous section, we get an `Access denied error.`. This has something to do with the nginx application.

        * Check the errors
          > cat /var/log/nginx/error.log

          * We can see there is an `Permission Denied problem`
          * After Googling the error message, we find that this is an SELinux problem
          * Disable SELinux to ensure it's an SELinux problem
            > setenforce 0

          * Issue the following commands to fix the problem
            > setsebool -P httpd_can_network_connect_db 1
            > setsebool -P httpd_can_network_connect 1

          * Restore SELinux on `/usr/share/nginx/html/`
            > restorecon -R -v /usr/share/nginx/html/

          * Enforce SELinux again
            > setenforce 1




## End result

* All of the results pass:

  * The SELinux status should be 'enforcing'
  * The firewall should be running
  * Apache should not be installed
  * Apache should not be running

  * The web server host should be reachable
  * The website should be accessible through HTTP
  * The website should be accessible through HTTPS

* When accessing the webpage in the browser:
  * Keep calm and vagrant up

## Resources



https://www.softprayog.in/tutorials/ip-command-in-linux

http://nginx.org/en/docs/ngx_core_module.html

https://www.digitalocean.com/community/tutorials/how-to-set-up-a-firewall-using-firewalld-on-centos-7

https://wiki.centos.org/HowTos/SELinux

https://www.petefreitag.com/item/793.cfm

https://bertvv.github.io/presentation-el7-basics/

https://github.com/bertvv/presentation-el7-basics

https://github.com/bertvv/cheat-sheets/blob/master/src/EL7.md
