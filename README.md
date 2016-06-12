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


