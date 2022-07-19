Param (
[String]$servicename = 'spooler',
[pscredential]$cred = (Get-Credential -Message 'Please enter your logon Details'),
[String]$computername = 'lon-dc1'
)

Get-WmiObject -Class win32_service -Credential $cred -ComputerName $computername | Where-Object {$_.name -eq $servicename}