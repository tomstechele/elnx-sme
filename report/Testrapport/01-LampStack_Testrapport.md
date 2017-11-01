# Enterprise Linux Lab Report

- Student name:Tom Stechele
- Github repo: <https://github.com/HoGentTIN/elnx-sme-tomstechele.git>

Describe the goals of the current iteration/assignment in a short sentence.



## Test rapport

Every lab report should contain a test plan. To give an idea of what is meant by this, a test plan for this assignment is given here.


- Execute `vagrant up pu004`
    - The command should run without errors (exit status 0)

   ![vagrant up pu004] (https://github.com/HoGentTIN/elnx-sme-tomstechele/blob/tomstechele/report/Images/00_02.png)

   ![vagrant login](https://github.com/HoGentTIN/elnx-sme-tomstechele/blob/tomstechele/report/Images/00_03.png)


- Log in on the server with `vagrant ssh pu004` and run the acceptance tests. They should succeed

    ```
    Running test /vagrant/test/pu004/lamp.bats
 ✓ The necessary packages should be installed
 ✓ The Apache service should be running
 ✓ The Apache service should be started at boot
 ✓ The MariaDB service should be running
 ✓ The MariaDB service should be started at boot
 ✓ The SELinux status should be ‘enforcing’
 ✓ Web traffic should pass through the firewall
 ✓ Mariadb should have a database for Wordpress
 ✓ The MariaDB user should have "write access" to the database
 ✓ The website should be accessible through HTTP
 ✓ The website should be accessible through HTTPS
 ✓ The certificate should not be the default one
 ✓ The Wordpress install page should be visible under http://192.0.2.50/wordpress/
 ✓ MariaDB should not have a test database
 ✓ MariaDB should not have anonymous users




    ```
    
    ![vagrant test] (https://github.com/HoGentTIN/elnx-sme-tomstechele/blob/tomstechele/report/Images/01_01.png)

    After `vagrant up` (when the VM is not yet created), the install page of Wordpress should be visable if you use a browser from the host system to surf to [](https://192.168.15.10/wordpress/).
    
    ![wordpress](https://github.com/HoGentTIN/elnx-sme-tomstechele/blob/tomstechele/report/Images/01_02.png)
