#example on how to run a template to build a VM. the (`) at the end allows you to hit enter on each line without running the command.
New-AzResourceGroupDeployment `
  -ResourceGroupName $rgName `
  -TemplateFile $HOME/az104-07-vm-template.json `
  -TemplateParameterFile $HOME/az104-07-vm-parameters.json `
  -AsJob