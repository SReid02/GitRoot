#An example from MS labs on how to install Network watacher agent without needind to use GUI
$rgName = 'az104-06-rg1'
$location = (Get-AzResourceGroup -ResourceGroupName $rgName).location
$vmNames = (Get-AzVM -ResourceGroupName $rgName).Name

foreach ($vmName in $vmNames) {
 Set-AzVMExtension `
 -ResourceGroupName $rgName `
 -Location $location `
 -VMName $vmName `
 -Name 'networkWatcherAgent' `
 -Publisher 'Microsoft.Azure.NetworkWatcher' `
 -Type 'NetworkWatcherAgentWindows' `
 -TypeHandlerVersion '1.4'
}