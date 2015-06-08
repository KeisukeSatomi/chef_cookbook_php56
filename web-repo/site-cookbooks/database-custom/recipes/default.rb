mysql2_chef_gem 'default' do
  action :install
end


mysql_connection_info = {:host => '127.0.0.1',
                         :username => 'root',
                         :password => 'root'
                         }


mysql_database "paddock" do
  connection mysql_connection_info
  action :create
end

mysql_database_user "master" do
  connection mysql_connection_info
  password "aiueo"
  host '127.0.0.1'
  database_name "paddock"
  privileges [:all]
  action [:create, :grant]
end

mysql_database_user "slave" do
  connection mysql_connection_info
  password "aiueo"
  host '127.0.0.1'
  database_name "paddock"
  privileges [:select]
  action [:create, :grant]
end