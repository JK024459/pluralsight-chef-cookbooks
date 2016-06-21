# See https://docs.getchef.com/config_rb_knife.html for more information on knife configuration options

current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "joep"
client_key               "#{current_dir}/joep.pem"
validation_client_name   "wg-validator"
validation_key           "#{current_dir}/wg-validator.pem"
chef_server_url          "https://centos-server.local/organizations/wg"
cookbook_path            ["#{current_dir}/../cookbooks"]
