#!/bin/bash

#Update the package manager's list of available packages by running the following command:
sudo apt update -y
sudo apt upgrade -y

#After confirming the installation, apt will install Apache and all required dependencies.
sudo apt install apache2

#Once the installation is complete, the Apache service will be automatically started. You can check the status of the Apache service by running the following command:
sudo systemctl status apache2

#To make sure the Apache service starts automatically after a reboot, run the following command:
sudo systemctl enable apache2

#You can verify that the Apache service is set to start automatically by running the following command: 
#If the command returns enabled, then the Apache service is set to start automatically after a reboot.
sudo systemctl is-enabled apache2
