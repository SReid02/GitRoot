az vm create \
  --resource-group learn-a3ec008f-1ea8-450d-8351-7415b86ea3ed \
  --name my-vm \
  --image UbuntuLTS \
  --admin-username azureuser \
  --generate-ssh-keys

  az vm extension set \
  --resource-group learn-a3ec008f-1ea8-450d-8351-7415b86ea3ed \
  --vm-name my-vm \
  --name customScript \
  --publisher Microsoft.Azure.Extensions \
  --version 2.1 \
  --settings '{"fileUris":["https://raw.githubusercontent.com/MicrosoftDocs/mslearn-welcome-to-azure/master/configure-nginx.sh"]}' \
  --protected-settings '{"commandToExecute": "./configure-nginx.sh"}'

