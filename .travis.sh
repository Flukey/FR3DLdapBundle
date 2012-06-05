#!/bin/sh
# Travis don't has the ldap extension
sed -i'.tmp' '/ext-ldap/d' composer.json

# Adapt dependencies to the matrix build
sed -i'.tmp' 's!"symfony/\(.*\)": "[<>=0-9\.\*,]*"!"symfony/\1": "'$SYMFONY_VERSION'"!' composer.json

# Composer dependencies
curl -s http://getcomposer.org/installer | php
php composer.phar install --dev