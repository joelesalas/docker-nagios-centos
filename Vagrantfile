# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.define "nagios" do |config|
    config.vm.box = "bento/centos-7.1"
    config.vm.hostname = "nagios"
    config.vm.network "private_network", type: "dhcp"
    config.vm.synced_folder ".", "/vagrant", type: "nfs", :nfs_version => '3', :mount_options => ['fsc', 'actimeo=1'] #, disabled: true
    config.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--memory", "1024"]
    end
    # Caching stuff
    if Vagrant.has_plugin?("vagrant-cachier")
      # Configure cached packages to be shared between instances of the same base box.
      # More info on http://fgrehm.viewdocs.io/vagrant-cachier/usage
      config.cache.scope = :box
      config.cache.enable :yum
      config.cache.enable :gem

      config.cache.synced_folder_opts = {
        type: :nfs,
        mount_options: ['rw', 'vers=3', 'tcp', 'nolock']
      }
      end
  # Provisioning
#  config.vm.provision "shell" do |s|
#    s.inline = "yum -y localinstall https://yum.puppetlabs.com/puppetlabs-release-el-7.noarch.rpm && yum -y install puppet"
#  end
#    config.vm.provision "shell" do |bundle|
#      bundle.inline = "cd /vagrant && bundle install"
#      bundle.privileged = false
#    end
  end

end
