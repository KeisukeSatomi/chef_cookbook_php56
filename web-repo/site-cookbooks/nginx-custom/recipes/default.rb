#
# Cookbook Name:: nginx-custom
# Recipe:: default
#
# Author:: KeisukeSatomi <mlh38048@yahoo.co.jp>
#
# Copyright since 2015, KeisukeSatomi
#
template "#{node['nginx']['dir']}/sites-available/default" do
  source "default-site.erb"
  owner  'root'
  group  node['root_group']
  mode   '0644'
  notifies :reload, 'service[nginx]', :delayed
end