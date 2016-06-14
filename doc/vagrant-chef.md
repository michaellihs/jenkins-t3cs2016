Vagrant and Chef Documentation
==============================

This document contains documentation about how to build a TYPO3 Jenkins Vagrantbox with Vagrant and the Chef cookbooks provided within the repository.


Prerequisites
-------------

In order to build the Vagrantbox, you have to install the following tools

* [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
* [Vagrant](https://www.vagrantup.com/downloads.html)
* [Chef Development Kit](https://downloads.chef.io/chef-dk) - there seems to be a bug with a dependency to `thor-scmversion`, therefore run

    ```chef gem install thor-scmversion```

  after installing the Chef Development Kit.

The Chef Development Kit brings a "self-contained" development environment for Chef Cookbooks. It contains its own Ruby version which will not affect any of the Ruby versions or tools that you have installed on your machine. The commands can be run with the `chef` command from your command line.


Install Cookbook Dependencies with Berkshelf
--------------------------------------------

In order to download and install the Chef cookbook dependencies, run the following command:

    ```chef exec berks vendor -b cookbooks/env_typo3jenkins/Berksfile berks-cookbooks```


Start the Box with Vagrant
--------------------------

Well - that's simple

    ```vagrant up```


Re-Provision the Box after Cookbook Changes
-------------------------------------------

Since the cookbooks have to be vendored to `berks-cookbooks`, you have to run

    ```chef exec berks vendor -b cookbooks/env_typo3jenkins/Berksfile berks-cookbooks```

every time you changed the Chef cookbooks in `cookbooks`.


Export the provisioned Box
--------------------------

In order to export the provisioned box, run

    ```vagrant package```
