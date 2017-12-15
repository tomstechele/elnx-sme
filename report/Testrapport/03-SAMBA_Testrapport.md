# Enterprise Linux Lab Report

- Student name:Tom Stechele
- Github repo: <https://github.com/HoGentTIN/elnx-sme-tomstechele.git>

Describe the goals of the current iteration/assignment in a short sentence.



## Test rapport

### SAMBA


- Execute `vagrant up `
    - The command should run without errors (exit status 0)
- Log in on the server with `vagrant ssh pr011` and run the acceptance tests. They should succeed
- If the command doesn't work use `VAGRANT_PREFER_SYSTEM_BIN=1 vagrant ssh pr`

![vagrant ssh](https://github.com/tomstechele/elnx-sme-tomstechele/blob/tomstechele/report/Images/03-SAMBA/vagrant%20ssh.JPG)

  ```
    Running test /vagrant/test/pr011/samba.bats
    ✓ The ’nmblookup’ command should be installed
    ✓ The ’smbclient’ command should be installed
    ✓ The Samba service should be running
    ✓ The Samba service should be enabled at boot
    ✓ The WinBind service should be running
    ✓ The WinBind service should be enabled at boot
    ✓ The SELinux status should be ‘enforcing’
    ✓ Samba traffic should pass through the firewall
    ✓ Check existence of users
    ✓ Checks shell access of users
    ✓ Samba configuration should be syntactically correct
    ✓ NetBIOS name resolution should work
    ✓ read access for share ‘public’
    ✓ write access for share ‘public’
    ✓ read access for share ‘management’
    ✓ write access for share ‘management’
    ✓ read access for share ‘technical’
    ✓ write access for share ‘technical’
    ✓ read access for share ‘sales’
    ✓ write access for share ‘sales’
    ✓ read access for share ‘it’
    ✓ write access for share ‘it’

    22 tests, 0 failures

  ```
![test samba](https://github.com/tomstechele/elnx-sme-tomstechele/blob/tomstechele/report/Images/03-SAMBA/testsamba.JPG)




- Use command `smbclient -L //files/` to see the shares with user Svena
- Use command `smbclient //files/public [-U|--user=username[%password]` the check is the share is correct
- try adding an directory to the share
- check if management is accessible, change /public into /management
- check if the user can access the group sales
![smb client](https://github.com/tomstechele/elnx-sme-tomstechele/blob/tomstechele/report/Images/03-SAMBA/smbclient.JPG)

![adding directory](https://github.com/tomstechele/elnx-sme-tomstechele/blob/tomstechele/report/Images/03-SAMBA/smbclient_user.JPG)

![overzicht](https://github.com/tomstechele/elnx-sme-tomstechele/blob/tomstechele/report/Images/03-SAMBA/samba_overzicht.JPG)





# VSFTPD

    ```
    Running test /vagrant/test/pr011/vsftp.bats
 ✓ VSFTPD service should be running
 ✓ VSFTPD service should be enabled at boot
 ✓ The ’curl’ command should be installed
 ✓ The SELinux status should be ‘enforcing’
 ✓ FTP traffic should pass through the firewall
 ✓ VSFTPD configuration should be syntactically correct
 ✓ Anonymous user should not be able to see shares
 ✓ read access for share ‘public’
 ✓ write access for share ‘public’
 ✓ read access for share ‘management’
 ✓ write access for share ‘management’
 ✓ read access for share ‘technical’
 ✓ write access for share ‘technical’
 ✓ read access for share ‘sales’
 ✓ write access for share ‘sales’
 ✓ read access for share ‘it’
 ✓ write access for share ‘it’

  17 tests, 0 failures


    ```
![testen VSFTP](https://github.com/tomstechele/elnx-sme-tomstechele/blob/tomstechele/report/Images/03-SAMBA/vsftp_overzicht.JPG)

 - User filezilla to test vsftpd.
 - Host: 172.16.0.11 , port 21, username: tom , password:...

 ![filezilla](https://github.com/tomstechele/elnx-sme-tomstechele/blob/tomstechele/report/Images/03-SAMBA/filezilla.JPG)





## Resources

[Samba manpages](https://www.samba.org/samba/docs/man/manpages-3/smbclient.1.html)

[Learning Ansible with Vagrant (Part 2/4)](https://sysadmincasts.com/episodes/45-learning-ansible-with-vagrant-part-2-4
)
[Bind role on ansible ](https://galaxy.ansible.com/bertvv/bind/)
[Role variables](https://github.com/bertvv/ansible-role-bind)

[Crash Course on Vagrant (revised)](https://sysadmincasts.com/episodes/42-crash-course-on-vagrant-revised)

[Ansible playbooks](https://docs.ansible.com/ansible/playbooks.html)

[Ansible information by Bert vv](https://github.com/bertvv/ansible-skeleton)
