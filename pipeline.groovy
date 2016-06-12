node {

    stage 'Git Checkout'
    sh 'wget https://get.typo3.org/6.2.25 && tar xzf 6.2.25 && mv typo3_src-6.2.25/* . && rm 6.2.25 && rmdir typo3_src-6.2.25' 

    stage 'Composer install'
    sh '/usr/local/bin/composer install'

    stage 'TYPO3 Core Unit Tests'
    sh './bin/phpunit -c typo3/sysext/core/Build/UnitTests.xml typo3/sysext/core/Tests/Unit'

    stage 'Deploy'
    sh 'rsync -avr . proserver@217.29.41.21:/var/www/Web'

}