# Chef Configuration Management System on Ubuntu Server

This is the test file

## PREREQUISITES FOR CHEF SETUP –
server should have at least 4 cores and 4 GB of RAM.
64-bit operating system. 
4 core / 8 GB  with 64-bit Ubuntu 14.04.

## Configure the Chef Server  -
cd ~
wget https://web-dl.packagecloud.io/chef/stable/packages/ubuntu/trusty/chef-server-core_12.0.5-1_amd64.deb
sudo dpkg -i chef-server-core_*.deb
sudo chef-server-ctl reconfigure

## Create an Admin User and Organization
sudo chef-server-ctl user-create admin admin admin admin@example.com examplepass -f admin.pem
sudo chef-server-ctl org-create mycap "capgem, Inc." --association_user admin -f capgem-validator.pem 

## Now Time to Configure a Chef Workstation -
sudo apt-get update
sudo apt-get install git

## Once you have git installed, you can clone the Chef repository onto your machine.
cd ~
git clone https://github.com/chef/chef-repo.git

## Putting your Chef Repo Under Version Control
git config --global user.name "Your Name"
git config --global user.email "username@domain.com"

## Download and Install the Chef Development Kit
cd ~
wget https://opscode-omnibus-packages.s3.amazonaws.com/ubuntu/12.04/x86_64/chefdk_0.4.0-1_amd64.deb
sudo dpkg -i chefdk_*.deb
chef verify

## Download Keys when Connecting to a Chef Server with Passwords
scp root@server_domain_or_IP:/root/admin.pem ~/chef-repo/.chef
scp root@server_domain_or_IP:/root/capgem-validator.pem ~/chef-repo/.chef

## Configuring Knife to Manage your Chef Environment
vi ~/chef-repo/.chef/knife.rb

## Edit content as below

current_dir = File.dirname(__FILE__)

log_level                :info

log_location             STDOUT

node_name                "name_for_workstation"

client_key               "#{current_dir}/name_of_user_key"

validation_client_name   "organization_validator_name"

validation_key           "#{current_dir}/organization_validator_key"

chef_server_url          "https://server_domain_or_IP/organizations/organization_name"

syntax_check_cache_path  "#{ENV['HOME']}/.chef/syntaxcache"

cookbook_path            ["#{current_dir}/../cookbooks"]

cd ~/chef-repo
knife client list
knife ssl fetch

## Bootstrapping Node with Knife
knife bootstrap node_domain_or_IP -N testing -x demo -P password --sudo --use-sudo-password

To verify client list
knife client list

## Start to write your Chef Cookbooks 










