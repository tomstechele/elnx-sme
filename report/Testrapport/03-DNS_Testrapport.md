# Enterprise Linux Lab Report: DNS testrapport

- Student name:Tom Stechele
- Github repo: <https://github.com/tomstechele/elnx-sme-tomstechele>

Describe the goals of the current iteration/assignment in a short sentence.



## Test rapport

Every lab report should contain a test plan. To give an idea of what is meant by this, a test plan for this assignment is given here.

## Test plan


- Check the `vagrant-hosts.yml` file, if the primary DNS server is added
![vagrant-hosts.yml](https://github.com/tomstechele/elnx-sme-tomstechele/blob/tomstechele/report/Images/02-DNS/vagrant-hosts.JPG)
- Execute `vagrant up `
    - The command should run without errors (exit status 0)
- Log in on the server with `vagrant ssh pu001` and run the acceptance tests. They should succeed

![vagrant ssh pu001](https://github.com/tomstechele/elnx-sme-tomstechele/blob/tomstechele/report/Images/02-DNS/vagrant_ssh.JPG)


```
    Running test /vagrant/test/runbats.sh
 ✓ The 'dig ' command should be installed
 ✓ The main config file should be syntactically correct
 ✓ The forward zone file should be syntactically correct
 ✓ The reverse zone files should be syntactically correct
 ✓ The service should be running
 ✓ Forward lookups public servers
 ✓ Forward lookups private servers
 ✓ Reverse lookups public servers
 ✓ Reverse lookups private servers
 ✓ Alias lookups public servers
 ✓ Alias lookups private servers
 ✓ NS record lookup
 ✓ Mail server lookup

 13 tests, 0 failures

```

![runbats](https://github.com/tomstechele/elnx-sme-tomstechele/blob/tomstechele/report/Images/02-DNS/testen.JPG)





After `pu001` we test  `pu002` it should be the same outcome.

- Execute `vagrant up `
    - The command should run without errors (exit status 0)
- Log in on the server with `vagrant ssh pu002` and run the acceptance tests. They should succeed

![vagrant ssh pu002](https://github.com/tomstechele/elnx-sme-tomstechele/blob/tomstechele/report/Images/02-DNS/vagrant_ssh2.JPG)



```
    Running test /vagrant/test/runbats.sh
 ✓ The 'dig ' command should be installed
 ✓ The main config file should be syntactically correct
 ✓ The forward zone file should be syntactically correct
 ✓ The reverse zone files should be syntactically correct
 ✓ The service should be running
 ✓ Forward lookups public servers
 ✓ Forward lookups private servers
 ✓ Reverse lookups public servers
 ✓ Reverse lookups private servers
 ✓ Alias lookups public servers
 ✓ Alias lookups private servers
 ✓ NS record lookup
 ✓ Mail server lookup

 13 tests, 0 failures

```

![runbats](https://github.com/tomstechele/elnx-sme-tomstechele/blob/tomstechele/report/Images/02-DNS/testen2.JPG)
