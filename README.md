Jenkins Hands-On Session TYPO3 Camp Stuttgart 2016
==================================================

Preperation
===========

Vagrant Jenkins Box
-------------------

* Java
* Jenkins
* Install the Pipeline Plugin
* Git
* PHP
* Composer
  * `/usr/local/bin/composer`
* PHPUnit in PATH setzen

Vagrant Box exportieren

    vagrant package

0. Install Prerequisites
========================

1. Install VirtualBox
1. Install Vagrant
1. Copy vagrant box from stick



1. Install Jenkins as a Vagrant Box
===================================

    vagrant box add t3cs_jenkins PATH_TO_FILE

Jenkins should now be available at
[http://10.0.2.15:8080](http://10.0.2.15:8080)



2. Create a Pipeline Job
========================

1. Install dependencies with Composer

   ```composer install```

1. Run Unit Tests

    ```phpunit -d memory_limit=-1 -c
typo3/sysext/core/Build/UnitTests.xml```

1. Add the following script as pipeline

```
node {

    stage 'Git Checkout'
    sh 'wget https://get.typo3.org/6.2.25 && tar xzf 6.2.25 && mv
typo3_src-6.2.25/* . && rm 6.2 && rmdir typo3_src-6.2.25' 

    stage 'Composer install'
    sh '/usr/local/bin/composer install'


    stage 'TYPO3 Core Unit Tests'
    sh './bin/phpunit -c typo3/sysext/core/Build/UnitTests.xml
typo3/sysext/core/Tests/Unit'

    stage 'Deploy'



}
```

3. Add a Git Hook
=================

Add post-update hook in Git (`.git/hooks/post-update`) 

```
#!/bin/sh
#
# An example hook script to prepare a packed repository for use over
# dumb transports.
#
# To enable this hook, rename this file to "post-update".

exec git update-server-info
curl http://localhost:8081/job/PIPELINE%20Test/build
```


4. Deployment URL
=================

[http://217.29.41.21/typo3/sysext/install/Start/Install.php](http://217.29.41.21/typo3/sysext/install/Start/Install.php)
