#setting location value from a previous resource group
$location = (Get-AzResourceGroup -Name az104-03b-rg1).Location
#setting RG name as a variable to be used later
$rgName = 'az104-03c-rg1'
#creates the RG 
New-AzResourceGroup -Name $rgName -Location $location
