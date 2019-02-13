az login
# You would not succeed plainly: az vm create -n MyLinuxVM  --image UbuntuLTS
#..We need to create a named (resource )group first:
az group create --name ciTestin --location westeurope
az vm create -n TestLinuxVM -g ciTestin --image UbuntuLTS # won't create it without supplying some SSH credentials.. Here I decided to try simple container creation for now:
#Just check we have the group:
az group list
#az group list |ag ci

DNS_NAME_LABEL=aci-demo
az container create   --resource-group ciTestin   --name hellocontainer   --image microsoft/aci-helloworld   --ports 80   --dns-name-label $DNS_NAME_LABEL   --location eastus # worried about DNS zone not existent..:
az container create   --resource-group ciTestin   --name hellocontainer   --image microsoft/aci-helloworld   --ports 80    --location eastus # Trying with no DNS label
    # ^Worked, yet was only available on the portal, it seems( no public endpoits generated).
#Try this to see if budgeting was set:
az consumption budget list
#az consumption budget create --budget-name experimental_budget --category cost --end-date 2050-12-23 --amount 3.0 --time-grain annually --start-date `date -I`
   #^Right syntax, but some amin-stuff answer given, nothing created
 
