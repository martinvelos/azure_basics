#Setup for Fedora, worked on 29:
# Guided by https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-yum?view=azure-cli-latest , using dnf should work the same.
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[azure-cli]\nname=Azure CLI\nbaseurl=https://packages.microsoft.com/yumrepos/azure-cli\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/azure-cli.repo'
#vim /etc/yum.repos.d/azure-cli.repo #to check it there
sudo yum install azure-cli
#If you have no subscription access yet, at least this will show something:
az login --allow-no-subscriptions
az cloud list
az cloud list|less #Can be quite long
az logout

  
