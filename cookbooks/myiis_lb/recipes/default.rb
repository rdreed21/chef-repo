#
# Cookbook:: myiis_lb
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

all_web_nodes = search('node',"role:web AND chef_environment:#{node.chef_environment}")
include_recipe 'iis-lib::default'
members = []
all_web_nodes.each do |web_node|
  member = {
    'address' => web_node['ipaddress'],
    'weight' => 100,
    'port' => 80,
    'ssl_port' => 443
  }
  members.push(member)
end

node.default['iis-lb']['members'] = members

# contents of chef-repo/cookbooks/my-wrapper-cookbook/recipes/default.rb
#node.default['iis-lb']['members'] = [
#  {
#    'address' => 'hs94.southcentralus.cloudapp.azure.com',
#    'weight' => 100,
#    'port' => 80,
#    'ssl_port' => 443
#  },
#  {
#    'address' => 'hs4.southcentralus.cloudapp.azure.com',
#    'weight' => 100,
#    'port' => 80,
#    'ssl_port' => 443
#  }]

include_recipe 'iis-lb::default'