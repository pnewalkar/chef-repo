#
# Cookbook Name:: postgres-server
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe "postgresql::server"
include_recipe "database::postgresql"
 
conn_info = {
:host => "localhost",
:username => "postgres",
:password => node['postgresql']['password']['postgres']
}
 
postgresql_database_user "postgres" do
connection conn_info
password "hksdh34rJT"
action :create
end
 
postgresql_database "postgresql" do
connection conn_info
action :create
end
 
postgresql_database_user "postgres" do
connection conn_info
database_name "postgresql"
privileges [:all]
action :grant
end

service "postgresql" do
  supports :status => true, :restart => true, :reload => true
  action [ :enable, :start ] if node['postgres']['start_service']
  not_if { system("ps -ef | grep '[p]ostgres -D'") || system("svcs -a | grep postgres | grep online")   }
end
