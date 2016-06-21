#
# Cookbook Name:: webapp-windows
# Recipe:: database
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

# Install SQL servers
include_recipe 'sql_server::server'

# Create a database, table and customer database
# Create a path to create-database.sql in Chef cache
create_database_script_path = win_friendly_path(File.join(Chef::Config[:file_cache_path], 'create-database.sql'))
