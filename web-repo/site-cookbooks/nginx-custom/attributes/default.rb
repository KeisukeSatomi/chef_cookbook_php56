#
# Cookbook Name:: nginx-custom
# Attributes:: default
#
# Author:: KeisukeSatomi
#
# Copyright 2015 KeisukeSatomi.
#
default['nginx']['port']         = '80'
default['nginx']['dir']          = '/etc/nginx'
default['nginx']['default_root'] = '/var/www/paddock/webroot'
