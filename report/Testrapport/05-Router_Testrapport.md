# Enterprise Linux Lab Report

- Student name:Tom Stechele
- Github repo: <https://github.com/HoGentTIN/elnx-sme-tomstechele.git>

Describe the goals of the current iteration/assignment in a short sentence.



## Test plan

### DHCP


- Execute `vagrant status `
    - The command should run without errors (exit status 0)
- Log in on the server with `vagrant ssh router`
- If the command doesn't work use `VAGRANT_PREFER_SYSTEM_BIN=1 vagrant ssh router`
- Test IP , Routing and DNS setup by executing: vagrant@router:~$ `curl icanhazip.com `, this HTTP request
should return an IP address.
- start the workstation and open the internet browser, there should be general internet
- surf to `avalon.lan ` you should see an Apache default welcome page.
- Enter `smb://172.16.0.11/`  in the browser. You should see the shares from SAMBA.
- Enter `ftp://172.10.0.11/ ` in the browser. You shoudl be prompted for login. Log in with credentials and check
if the policies are in place by accessing the shares. If you log in with the admin `Tom ` you shoud be able to access all samba_shares
except management share.  









## Resources

[Ansible role -DHCP](https://github.com/bertvv/ansible-role-dhcp)

[nMap ](https://nmap.org/nsedoc/scripts/dhcp-discover.html)
[Ansible playbooks](https://docs.ansible.com/ansible/playbooks.html)
