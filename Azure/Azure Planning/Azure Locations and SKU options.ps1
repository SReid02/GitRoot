#Lists aviable locations
(Get-AzLocation).Location 
#lists aviable SKU's with standard D2s sorting by name. Query can be changed for other options
az vm list-skus --location 'Australiaeast' -o table --query "[? contains(name,'Standard_D2s')].name"