get-command enable*
enable-psremoting
get-pssessionconfiguration
Enter-PSSession -ComputerName lon-dc1

Enter-PSSession -ComputerName lon-cl1
Enter-PSSession -ComputerName lon-svr1
Get-WindowsFeature -name * 
Add-WindowsFeature -name NLB -IncludeManagementTools -IncludeAllSubFeature
exit
Get-Command -Name *adapter*
get-netadapter -Physical
Invoke-Command -ComputerName lon-dc1,lon-svr1 -ScriptBlock {Get-NetAdapter -Physical}

$computers = new-pssession -ComputerName lon-svr1,lon-dc1
Get-Module -ListAvailable #net security
Get-NetFirewallRule

Invoke-Command -Session $computers -ScriptBlock {Get-NetFirewallRule -Enabled True}
Invoke-Command -Session $computers -ScriptBlock {  Get-NetFirewallRule -Enabled True } |Select-Object Name,PSComputername

$session = new-pssession -ComputerName lon-svr1,lon-dc1
Invoke-Command -Session $session -ScriptBlock {
  Get-CimInstance -ClassName Win32_LogicalDisk | 
  Where-Object {$_.DriveType -eq 3} | 
  Select-Object -Property DeviceID,Size,FreeSpace,pscomputername
}
ConvertTo-Html | 
Out-File 'E:\Mod08\Drive Report.html'