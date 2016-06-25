#
# Cookbook Name:: webapp-linux
# Recipe:: webserver
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

#Install Apache and start the Apache service

httpd_service 'customers' do
#  npm 'prefork'
  action [:create, :start]
end

# Add the customers site configuration
httpd_config 'customers' do
  instance 'customers'
  source 'customers.conf.erb'
  notifies :restart, 'httpd_service[customers]'
end

# Create the document root directory
directory node['webapp-linux']['document_root'] do
  recursive true
end

# Create a default home page

file "#{node['webapp-linux']['document_root']}/index.php" do
  content "<html>This is a temporary page</html>"
  owner 'web_admin'
  group 'web_admin'
  mode '0644'
  action :create
end

# Open TCP port 80 for web traffic
firewall_rule 'httpd' do
  port 80
  protocol :tcp
  action :create
end
