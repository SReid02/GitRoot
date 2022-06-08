get-command *ipaddress*
get-help netipaddress -ShowWindow
Get-NetIPAddress -AddressFamily IPv4

get-command -noun service
get-service -Name BITS |Get-Member
set-service -Name BITS -StartupType Automatic

get-command *test*
Get-Help Test-Connection -ShowWindow
Test-Connection -ComputerName lon-dc1 
Test-Connection -ComputerName lon-dc1 -quite

get-command *event log*
get-help Get-EventLog -ShowWindow
get-eventlog -List
Get-EventLog -LogName Security -Newest 10

get-help *about* -ShowWindow
get-help about_Comparison_Operators -ShowWindow
'apple' -like 'orange'
get-help *about*
get-help *env* #$env are system enviornment variables which are set by default, and used by the system
get-help about_Environment_Variables -ShowWindow
$env:COMPUTERNAME

$Xbox = Get-Service -Name XblGameSave
$Xbox.Start()
$xbox.Stop()