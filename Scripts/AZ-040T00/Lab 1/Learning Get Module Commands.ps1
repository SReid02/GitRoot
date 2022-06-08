Get-Module #will list the modules
get-command -module *microsoft.powershell.management* #shows all the commands under powershell module.

get-command *network*
get-command *ping*
get-command *active*

Get-Alias -name erase #gets the name of alias's related to that name
get-alias -Definition erase #gets the alias for specified item.
New-Alias -Name List -Value Get-ChildItem #creates new alias 