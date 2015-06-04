#
# Cookbook Name:: firewalld
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

package 'firewalld'

service "firewalld" do
  action [:enable, :start]
end

firewalld_service 'http' do
  action :add
  zone "public"
  options "--permanent"
end

bash "reload_firewall" do
  code <<-EOF
    firewall-cmd --reload
  EOF
end