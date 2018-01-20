# Enterprise Linux Lab Report

- Student name:Tom Stechele
- Github repo: <https://github.com/HoGentTIN/elnx-sme-tomstechele.git>

Describe the goals of the current iteration/assignment in a short sentence.



## Test plan

### DHCP


- Execute `vagrant status `
    - The command should run without errors (exit status 0)
- Log in on the server with `vagrant ssh pr001` and run `sudo yum install nmap`
- If the command doesn't work use `VAGRANT_PREFER_SYSTEM_BIN=1 vagrant ssh pr`
- Test DHCP functionality by typing `sudo nmap --script broadcast-dhcp-discover -e enp0s8`.
- Test the DHCP ip allocation on the workstation you created.


![nmap](https://github.com/tomstechele/elnx-sme-tomstechele/blob/tomstechele/report/Images/04-DHCP/nmap.JPG)


### Workstation DHCP allocation Test

![hosts](https://github.com/tomstechele/elnx-sme-tomstechele/blob/tomstechele/report/Images/04-DHCP/ethernetHost.JPG)

![ip a](https://github.com/tomstechele/elnx-sme-tomstechele/blob/tomstechele/report/Images/04-DHCP/ipa.JPG)





## Resources

[Ansible role -DHCP](https://github.com/bertvv/ansible-role-dhcp)

[nMap ](https://nmap.org/nsedoc/scripts/dhcp-discover.html)
[Ansible playbooks](https://docs.ansible.com/ansible/playbooks.html)
