#
# Cookbook Name:: vw-dam
# Recipe:: _license
#
# Copyright (c) 2018 Volkswagen of America, Inc., All Rights Reserved.
#
# Drop the VW AEM license onto the filesystem and point the base AEM cookbook's URL at it.
#
node.default[:aem][:license_path] = "#{Chef::Config[:file_cache_path]}/license.properties"

cookbook_file node['aem']['license_path'] do
  source 'license.properties'
  owner 'root'
  group 'root'
  mode 0600
end

#Set the url for the base AEM cookbook to find the license
node.default['aem']['license_url'] = "file://#{node['aem']['license_path']}"
