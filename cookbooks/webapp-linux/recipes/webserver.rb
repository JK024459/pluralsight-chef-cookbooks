#
# Cookbook Name:: webapp-linux
# Recipe:: webserver
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

#Install Apache and start the Apache service

httpd_service 'customers' do
  npm 'prefork'
  action [:create, :start]
end

# Add the customers site configuration
