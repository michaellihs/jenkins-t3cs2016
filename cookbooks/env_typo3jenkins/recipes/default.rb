=begin
#<
Entry point cookbook that provides a Jenkins master server.
#>
=end

# This will run an `apt-get update` for us!


include_recipe 'apt'

include_recipe 'env_typo3jenkins::_ubuntu_base'

include_recipe 'java'
include_recipe 'jenkins::master'

include_recipe 'env_typo3jenkins::_jenkins_plugins'
include_recipe 'env_typo3jenkins::_php'
include_recipe 'env_typo3jenkins::_git'
include_recipe 'env_typo3jenkins::_composer'
