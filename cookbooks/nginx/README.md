# nginx Cookbook
==============
TODO: Enter the cookbook description here.

cd ~/chef-repo
knife cookbook create cookbook_name
knife cookbook create nginx
cd recipes
vi default.rb

Start to write your recipe

Requirements
------------
TODO: List your cookbook requirements. Be sure to include any requirements this cookbook has on platforms, libraries, other cookbooks, packages, operating systems, etc.

e.g.
#### packages
- `toaster` - nginx needs toaster to brown your bagel.

Attributes
----------
TODO: List your cookbook attributes here.


#### nginx::default
TODO: Write usage instructions for each cookbook.

e.g.
Just include `nginx` in your node's `run_list`:

include_recipe "apt"

package 'nginx' do
  action :install
end

service 'nginx' do
  action [ :enable, :start ]
end

cookbook_file "/usr/share/nginx/www/index.html" do
  source "index.html"
  mode "0644"
end


