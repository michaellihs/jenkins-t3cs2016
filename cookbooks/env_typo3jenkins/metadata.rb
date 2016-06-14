name             'env_typo3jenkins'
maintainer       'Michael Lihs'
maintainer_email 'mimi@kaktusteam.de'
# TODO add proper license
license          'All rights reserved'
description      'Provisions a Jenkins master server.'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md')) rescue 'Provisions a TYPO3 Jenkins Master server'
version          IO.read(File.join(File.dirname(__FILE__), 'VERSION')) rescue '0.1.0'

supports         'ubuntu'

# Make sure to freeze all versions of community cookbooks here!
depends          'java',              '~> 1.35.0'
depends          'jenkins',           '~> 2.3.0'
depends          'apt',               '~> 2.7.0'
