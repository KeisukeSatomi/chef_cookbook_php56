Vagrant.configure(2) do |config|
  config.vm.box = "testCentos7"
  config.vm.box_url = "https://github.com/holms/vagrant-centos7-box/releases/download/7.1.1503.001/CentOS-7.1.1503-x86_64-netboot.box"
  config.ssh.insert_key = false
  Encoding.default_external = 'UTF-8'
  
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # config.vm.network :private_network, ip: "192.168.33.90"

  config.vm.network :public_network, ip: "192.168.100.89"

  # config.vm.synced_folder "../data", "/vagrant_data"
  config.vm.synced_folder "c:/git_repo/test/", "/var/www/public/", mount_options: ['dmode=777', 'fmode=666']
  
  config.omnibus.chef_version=:latest
  config.chef_zero.chef_repo_path = "."
  
  config.vm.provision :chef_zero do |chef|
      chef.cookbooks_path = ["./web-repo/cookbooks", "./web-repo/site-cookbooks"]
      chef.roles_path = 'web-repo/roles'
      chef.add_role 'common'
      chef.add_role 'nginx'
      chef.add_role 'firewall'
      chef.add_role 'php56'
  end
end
