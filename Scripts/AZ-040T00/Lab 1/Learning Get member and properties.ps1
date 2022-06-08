Get-Service -Name Spooler | Get-Member
Get-Process -name notepad | Select-Object -Property name,priorityboostenabled

(Get-Service -Name Spooler).StartType |Get-Member
(Get-Service -name Spooler).StartType.value__