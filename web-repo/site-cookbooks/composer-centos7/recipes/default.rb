# composer install
bash "get_composer" do
  code <<-EOF
    curl -sS https://getcomposer.org/installer | php
    mv composer.phar #{node['composer']['install_dir']}/composer
  EOF
  not_if { File.exists?("#{node['composer']['install_dir']}/composer") }
end