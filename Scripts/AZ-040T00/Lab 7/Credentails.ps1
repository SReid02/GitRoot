$cred = Get-Credential


Get-ADUser -Filter * |
            Out-GridView -OutputMode Single -Title "Select the user to reset their password" |
            ForEach-Object {
                $cred = Get-Credential -UserName $_.name -Message "Please enter new password"
                Set-ADAccountPassword -NewPassword $cred.password -Reset -identity $_
            }
            
Param (
[String]$servicename = 'spooler',
[pscredential]$cred = (Get-Credential -Message 'Please enter your logon Details'),
[String]$computername = 'lon-dc1'
)

Get-WmiObject -Class win32_service -Credential $cred -ComputerName $computername | Where-Object {$_.name -eq $servicename}