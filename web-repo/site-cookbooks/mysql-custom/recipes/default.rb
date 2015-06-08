# mysql導入
mysql_service 'default' do
  port '3306'
  version '5.6'
  initial_root_password 'root'
  action [:create, :start]
end

bash 'insert_timezone_tokyo' do
  code <<-EOF
    mysql_tzinfo_to_sql /usr/share/zoneinfo/Asia/Tokyo Asia/Tokyo | mysql -uroot -proot mysql -S '/var/run/mysql-default/mysqld.sock'
  EOF
end

mysql_config 'default' do
  source 'extra_setting.erb'
  instance 'default'
  action :create
  notifies :restart, 'mysql_service[default]'
end
