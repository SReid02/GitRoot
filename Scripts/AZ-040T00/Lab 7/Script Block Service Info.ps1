Param ([String]$servicename = (Read-Host -Prompt "enter a service Name"),
    [string[]]$computername = (Get-ADComputer -filter *).name

)

get-service -name $servicename -ComputerName $computername | Select-Object Status,name,Dispalyname,MachineName