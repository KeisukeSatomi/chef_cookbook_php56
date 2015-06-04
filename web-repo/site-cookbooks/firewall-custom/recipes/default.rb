#
# Cookbook Name:: firewall-custom
# Recipe:: default
#
# Copyright 2015, KeisukeSatomi.
#
firewall_rule 'allow world to ssh' do
  port 22
  source '192.168.100.0/24'
  action [:allow]
  only_if { node['firewall']['allow_ssh'] }
end

firewall_rule 'allow world to http' do
  port [80, 443]
  source '0.0.0.0/0'
  protocol :tcp
  action [:allow]
end

#bash 'restart_firewall' do
#  code <<-EOF
#    firewall-cmd --reload
#  EOF
#end