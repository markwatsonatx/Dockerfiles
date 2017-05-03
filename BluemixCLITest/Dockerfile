apt-get update
apt-get install -y wget apt-transport-https
wget -q -O - https://packages.cloudfoundry.org/debian/cli.cloudfoundry.org.key | apt-key add -
echo "deb http://packages.cloudfoundry.org/debian stable main" | tee /etc/apt/sources.list.d/cloudfoundry-cli.list
apt-get update
apt-get install -y cf-cli
wget -q -O Bluemix_CLI.tar.gz http://public.dhe.ibm.com/cloud/bluemix/cli/bluemix-cli/Bluemix_CLI_0.5.2_amd64.tar.gz
tar -xvf Bluemix_CLI.tar.gz
cd Bluemix_CLI
./install_bluemix_cli
