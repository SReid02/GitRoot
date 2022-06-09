get-command -showwindow *resolve*
Resolve-DnsName

get-command *adapter*
get-help set-netadapter -ShowWindow
Set-NetAdapter -MacAddress AA-OO-BB-57-1b-0D

Get-Command *scheduled*
get-help Get-ScheduledTask -ShowWindow
get-help Enable-ScheduledTask -ShowWindow
Get-ScheduledTask -TaskPath "\Microsoft\windows\Workplace Join\" | Enable-ScheduledTask

get-command *block*
get-help block-fileshareaccess -ShowWindow
Block-FileShareAccess

get-command *cache*
Clear-BCCache

get-command *firewall*
Get-NetFirewallRule

get-command *IP*
Get-NetIPAddress

get-command *print*
Suspend-PrintJob

get-command *content*
get-content