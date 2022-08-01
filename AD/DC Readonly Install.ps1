Invoke-Command -ComputerName LON-SVR1 {Install-ADDSDomainController 
    - NoGlobalCatalog:$true -Credential (Get-Credential) `
    -CriticalReplicationOnly:$false `
    - DatabasePath “C:\Windows\NTDS” `
    -DomainName “Adatum.com” -InstallDns:$false `
    -LogPath “C:\Windows\NTDS” `
    -NoRebootonCompletion:$false `
    -SiteName “Default-First-Site-Name” `
    - SysvolPath “C:\Windows\SYSVOL” `
    -Force:$true
 }