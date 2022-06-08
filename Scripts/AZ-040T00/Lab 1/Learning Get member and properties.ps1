Get-Service -Name Spooler | Get-Member #shows only what properties and methods can be run
Get-Process -name notepad | Select-Object -Property name,priorityboostenabled #shows everything including vlaues but you miss what type of value it is (ie bool(ture or false),int(whole number) etc)

(Get-Service -Name Spooler).StartType |Get-Member
(Get-Service -name Spooler).StartType.value__

get-verb |Sort-Object -Property verb |Format-Wide -Property verb -AutoSize

get-help get-aduser
Get-ADUser -Filter * | Measure-Object 

Get-Volume -DriveLetter C,E | Measure-Object -Property SizeRemaining -Minimum

