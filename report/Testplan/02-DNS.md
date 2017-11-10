# Enterprise Linux Lab Report

- Student name:Tom Stechele
- Github repo: <https://github.com/HoGentTIN/elnx-sme-tomstechele.git>

Describe the goals of the current iteration/assignment in a short sentence.



## Test plan


- Check the `vagrant-hosts.yml` file, if the primary DNS server is added

- Execute `vagrant up `
    - The command should run without errors (exit status 0)
- Log in on the server with `vagrant ssh pu001` and run the acceptance tests. They should succeed

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

After `pu001` we test  `pu002` it should be the same outcome.

- Execute `vagrant up `
    - The command should run without errors (exit status 0)
- Log in on the server with `vagrant ssh pu002` and run the acceptance tests. They should succeed

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






## Resources


[Learning Ansible with Vagrant (Part 2/4)](https://sysadmincasts.com/episodes/45-learning-ansible-with-vagrant-part-2-4
)
[Bind role on ansible ](https://galaxy.ansible.com/bertvv/bind/)
[Role variables](https://github.com/bertvv/ansible-role-bind)



[Crash Course on Vagrant (revised)](https://sysadmincasts.com/episodes/42-crash-course-on-vagrant-revised)

[Ansible playbooks](https://docs.ansible.com/ansible/playbooks.html)

[Ansible information by Bert vv](https://github.com/bertvv/ansible-skeleton)
