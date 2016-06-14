Jenkins Hands-On Session TYPO3 Camp Stuttgart 2016
==================================================

This document contains some notes for the "Jenkins Hands-On Session" from the TYPO3 Camp Stuttgart 2016.

The ultimate goal of the session was to provide a Continuous Delivery pipeline that

1. clones a TYPO3 project from some Git repository
1. "builds" the project with Composer
1. runs (unit) tests
1. deploys the project to some web server

Due to the lack of time and slow Wifi the following compromise was made

* we didn't actually clone a TYPO3 project with Git, but rather downloaded a zipped package with `wget`
* due to an old Ubuntu version, we only had PHP 5.3 and could not use a recent version of TYPO3
* since we did not have access to a "real customer project" we ran the unit tests of the TYPO3 core
* due to the PHP version, we skipped using Surf and rather used `rsync` for "deploying" our project to the web server
* we did not set up a database and 

Preperation
===========

During the session we worked on a virtual machine run by Vagrant and VirtualBox. I'll try to provide this machine soonish as a Vagrant Box but have to do some tidy up before.

Vagrant Jenkins Box
-------------------

Here is the software that we installed inside the Vagrant Box:

* Java
* Jenkins
* Install the Pipeline Plugin
* Git
* PHP
* Composer
  * `/usr/local/bin/composer`
* PHPUnit in PATH setzen
* Add ssh key of Jenkins user to the deployment target server

Vagrant Box exportieren

    vagrant package

0. Install Prerequisites
========================

Here is the software that you need to follow the session:

1. Install VirtualBox
1. Install Vagrant
1. Copy vagrant box from stick


1. Install Jenkins as a Vagrant Box
===================================

- [ ] Provide Vagrant Box and a documentation how to start / configure it


2. Create a Pipeline Job
========================

1. Install dependencies with Composer

   ```composer install```

1. Run Unit Tests

    ```phpunit -d memory_limit=-1 -c
typo3/sysext/core/Build/UnitTests.xml```

1. Add the following script as pipeline (see [pipeline.groovy](pipeline.groovy))

    ```
    node {

        stage 'Git Checkout'
        sh 'wget https://get.typo3.org/6.2.25 && tar xzf 6.2.25 && mv typo3_src-6.2.25/* . && rm 6.2 && rmdir typo3_src-6.2.25' 

        stage 'Composer install'
        sh '/usr/local/bin/composer install'


        stage 'TYPO3 Core Unit Tests'
        sh './bin/phpunit -c typo3/sysext/core/Build/UnitTests.xml typo3/sysext/core/Tests/Unit'

        stage 'Deploy'
        
        
    }
    ```

3. Add a Git Hook
=================

Add a webhook to your Git server, e.g. http://localhost:8081/job/PIPELINE%20Test/build


4. Deployment URL
=================

[http://217.29.41.21/typo3/sysext/install/Start/Install.php](http://217.29.41.21/typo3/sysext/install/Start/Install.php)

Sketchnote
==========

![Sketchnote](doc/images/sketchnote.jpg)

by [Dani](https://twitter.com/dgrammlich)

TODOs Chef / Vagrant
====================

For Chef and Vagrant documentation, see [doc/vagrant-chef.md](doc/vagrant-chef.md)

- [ ] Write Chef recipe that provides a Jenkins Master for TYPO3 projects
      - [x] Based on Ubuntu 14.04
      - [x] Java
      - [x] Jenkins + Plugins
      - [x] Git
      - [ ] Composer
      - [ ] PHP + all required packages
- [ ] Export a TYPO3 Jenkins Vagrant Box with
- [ ] Upload the box to some typo3.org server
      - [ ] Ask server team for upload space
- [ ] Provide sample pipeline(s) for different TYPO3 versions
- [ ] Provide sample configuration(s) for Surf deployment
- [ ] we are currently using a patched version of the Jenkins community cookbook - fix this if [PR-471](https://github.com/chef-cookbooks/jenkins/pull/471/files) is merged
- [ ] Jenkins plugins are installed but are not available after provisioning --> restart Jenkins?

Resources
=========

* Helmut Hummel's TYPO3 Distribution: [https://github.com/helhum/TYPO3-Distribution](https://github.com/helhum/TYPO3-Distribution)
* [Jenkins Pipeline Plugin](https://github.com/jenkinsci/pipeline-plugin/blob/master/README.md#introduction)
