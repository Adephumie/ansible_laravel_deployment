# ansible_laravel_deployment
Deploying Laravel application with ansible: this includes installation of packages and dependencies like apache, php, MySQL, and composer on Ubuntu 20.04


The server_setup.yml includes the play for the entire set up 
-ansible user
-setting ssh key for the user
-installation of apache2, php, MySQL, composer, and installing a laravel application.

The postgres.yml includes a play that plays a script to install postgresql, create a database, user, and password.


