#!/usr/bin/bash

#Script to install postgreSQL
#Variable declaration
psql_version="$(psql --version)"


#Update server repository
echo "Updating cache...................................................."
echo ".................................................................."
echo ".................................................................."
sudo apt update && sudo apt upgrade -y


# Create the file repository configuration:
echo "................................................................"
echo "Creating the file repo.........................................."
echo "................................................................"
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'


# Import the repository signing key:
echo "................................................................."
echo "Importing the repository signing key............................."
echo "................................................................."
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -

# Update the package lists:
echo "................................................................."
echo "Updating the package lists......................................."
echo "................................................................."
sudo apt update

# Install the latest version of PostgreSQL.
echo "................................................................."
echo "Installing PostgreSQL............................................"
echo "................................................................."
sudo apt -y install postgresql postgresql-contrib

#Show postgreSQl version installed
echo "................................................................."
echo "Postgresql version info:........................................."
echo "================================================================="
echo "$psql_version"
echo "================================================================="

# Ensure postgreSQL is running
sudo systemctl start postgresql.service

# Ensure postgreSQL launches upon system bootup
sudo systemctl enable postgresql.service


echo "================================================================="
# Setting DB credentials 

sudo -u postgres psql -c "CREATE DATABASE miniprojectdb WITH ENCODING 'UTF8' TEMPLATE template0"
echo "Database Created"
echo "================================================================="
sudo -u postgres psql -c "CREATE USER miniproject"
echo "Role Created"
echo "================================================================="
sudo -i -u postgres psql -c "ALTER USER miniproject WITH ENCRYPTED PASSWORD 'minipass01';"
echo "Role Altered"
echo "--------------database, user, and password all set!----------------"

