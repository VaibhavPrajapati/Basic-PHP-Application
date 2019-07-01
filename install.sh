#!/bin/bash

echo "Install php"
sudo apt-get install php7.0 -y
sudo apt-get install php7.0-xml -y
sudo apt-get install php7.0-mbstring -y
curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer
echo "soanrqube"
sudo apt-get install zip
sudo rm -rf sonar-scanner-*
wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-3.3.0.1492-linux.zip
sudo unzip sonar-scanner-*.zip 
sudo rm sonar-scanner-*.zip
sudo mv sonar-scanner* sonar

