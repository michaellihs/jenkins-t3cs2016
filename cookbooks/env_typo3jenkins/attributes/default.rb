#<> Sets the required Java version
override['java']['jdk_version'] = '7'

#<> Sets the Java installation distribution
default['java']['install_flavor'] = 'openjdk'

#<> Sets the installation method for the Jenkins server
default['jenkins']['master']['install_method'] = 'package'

#<> Sets the default shell for the jenkins system user
default['jenkins']['master']['shell'] = '/bin/bash'

#<> Sets the system user that is used to clone the repositories for the Jenkins jobs
default['jenkins']['master']['job_provisioning_user'] = 'jenkins'

#<> Sets the system group that is used to clone the repositories for the Jenkins jobs
default['jenkins']['master']['job_provisioning_group'] = 'jenkins'
