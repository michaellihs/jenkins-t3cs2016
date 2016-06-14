=begin
Configuration for a vagrant box that runs a Jenkins Master for TYPO3 projects.

Copyright (C) 2016 Michael Lihs

TODO add license

Written by Michael Lihs <mimi@kaktusteam.de>
=end

# FQDN for the Vagrant box
$hostname = 'typo3jenkins.dev.localhost'

# The path inside the Vagrant box where the Vagrant directory is mounted
$vagrant_mount_path = '/var/vagrant'

# The script that's run in the Vagrant box for provisioning the box
$inline_script = <<-EOSCRIPT
    command -v curl >/dev/null 2>&1 || sudo yum -y install curl
    command -v chef-client >/dev/null 2>&1 || curl -s  -L https://www.chef.io/chef/install.sh | sudo bash
    chef-client -v | grep -q ' 12\.' || curl -s -L https://www.chef.io/chef/install.sh | sudo bash
    sudo hostname #{$hostname}
    sudo /usr/bin/chef-client -z -o 'recipe[env_typo3jenkins]' -c #{$vagrant_mount_path}/solo.rb -F doc
EOSCRIPT



Vagrant.configure('2') do |config|

  config.vm.define :typo3_jenkins do |typo3_jenkins|

    # Box setup
    typo3_jenkins.vm.box = 'ubuntu/trusty64'

    # VM settings
    typo3_jenkins.vm.provider 'virtualbox' do |v|
      v.name = 'TYPO3-Jenkins'
      v.customize [
                    'modifyvm', :id,
                    '--memory', 2048,
                    '--cpus', 1
                  ]
    end

    # Disable default synced folder
    typo3_jenkins.vm.synced_folder '.', '/vagrant', id: 'vagrant-root', disabled: true
    typo3_jenkins.vm.synced_folder '.', $vagrant_mount_path, :nfs => true, :nfs_version => 3

    # Network settings
    typo3_jenkins.vm.hostname = $hostname
    typo3_jenkins.vm.network :private_network, ip: '10.20.30.50', netmask: '255.255.255.0'
    typo3_jenkins.vm.network :forwarded_port, guest: 8080, host: 8082

    # SSH settings
    typo3_jenkins.ssh.forward_agent = true

    # Run provisioning of chef server box using chef-solo
    typo3_jenkins.vm.provision :shell do |s|
      s.inline = $inline_script
    end

  end
end
