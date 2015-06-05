# epel repository導入
remote_file "/tmp/#{node['epel']['file_name']}" do
  source "#{node['epel']['remote_uri']}"
  not_if { ::File.exists?("/tmp/#{node['epel']['file_name']}") }
end

package node['epel']['file_name'] do
  action :install
  provider Chef::Provider::Package::Rpm
  source "/tmp/#{node['epel']['file_name']}"
end

# remi repository導入
remote_file "/tmp/#{node['remi']['file_name']}" do
  source "#{node['remi']['remote_uri']}"
  not_if { ::File.exists?("/tmp/#{node['remi']['file_name']}") }
end

package node['remi']['file_name'] do
  action :install
  provider Chef::Provider::Package::Rpm
  source "/tmp/#{node['remi']['file_name']}"
end


# phpインストール
%w{php php-fpm php-devel php-mbstring php-mcrypt php-opcache php-intl php-mysql php-phpunit-PHPUnit php-pecl-xdebug}.each do |p|
  package p do
    action :install
    options "--enablerepo=remi --enablerepo=remi-php56"
  end
end

# php-fpmサービス
service 'php-fpm' do
  supports :status => true, :start => true, :stop => true, :restart => true
  action [:start, :enable]
end

# php設定
template "php.ini" do
  path "/etc/php.ini"
  source "php.ini.erb"
  mode 0644
  notifies :restart, 'service[nginx]'
end

# php-fpm設定
template "php-fpm.ini" do
  path "/etc/php-fpm.d/www.conf"
  source "php-fpm.ini.erb"
  mode 0644
  notifies :restart, 'service[nginx]'
  notifies :restart, 'service[php-fpm]'
end