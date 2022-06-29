get-command *cim* #lists avaible CIM commands

Get-CimInstance -ClassName *| Get-Member #wont work


get-help get-cim-instance -ShowWindow

get-cimclass -ClassName win32_bios | Select-Object -Property CimClassMethods

Get-CimClass -Namespace root\cimv2 | Select-Object -Property CimClassMethods


cim_enable #Enables CIM service
$CimSessions = New-CimSession -ComputerName lon-dc1

get-ciminstance -ClassName win32_product | Select-Object name

#EXERCISE 1
#Line 20 is a way to find a cim class name
Get-Cimclass -NameSpace root\cimv2 | Where-Object {$_.CimClassName -like "*Configuration*"} #dont forget the * before configuration 

Get-CimInstance -ClassName Win32_NetworkAdapterConfiguration | Select-Object InterfaceIndex,Ipaddress

Get-CimInstance -ClassName Win32_OperatingSystem | Get-Member
Get-CimInstance -ClassName Win32_OperatingSystem | Select-Object -Property Buildnumber,ServicePackMajorVersion,Version

#Task 3

Get-Cimclass -NameSpace root\cimv2 | Where-Object {$_.CimClassName -like "Win32*system*"} |Sort-Object -Property Name
Get-CimInstance -ClassName Win32_ComputerSystem | 
        Select-Object -Property Manufacturer,Model,
        @{n= 'RAM';e={$_.TotalPhysicalMemory}} #creating a Hash Table

#Task 4
Get-Cimclass -NameSpace root\cimv2 | Where-Object {$_.CimClassName -like "win32*service*"}
Get-CimInstance -ClassName Win32_Service | Get-Member
Get-CimInstance -ClassName Win32_Service | Select-Object -Property *
Get-CimInstance -ClassName Win32_Service | 
    where-Object {$_.Name -like "S*"} | 
    Select-Object -Property Name,State,startname

#TASK 5
Get-Cimclass -NameSpace root\cimv2 | Where-Object {$_.CimClassName -like "*user*"}
Get-CimInstance -ClassName Win32_UserAccount | 
      Select-Object -Property Caption,Domain,SID,FullName,Name | 
      ft

#TASK 4 GROUP INFO
Get-Cimclass -NameSpace root\cimv2 | Where-Object {$_.CimClassName -like "*group*"}
Get-CimInstance -ClassName Win32_GroupUser | Get-Member
Get-CimInstance -ClassName Win32_GroupUser -ComputerName LON-DC1

#EXERCISE 3 Invoking Methods

(Get-CimClass -ClassName Win32_Service).CimClassMethods
Get-CimInstance -ClassName Win32_Service -ComputerName LON-DC1 | 
        Where-Object {$_.Name -eq 'spooler'} |
        Invoke-CimMethod  -ComputerName LON-DC1 -MethodName stopservice

Enter-PSSession -ComputerName Lon-DC1 
 Start-Service -name Spooler
 get-service -Name Spooler
 Exit-PSSession

#TASK 2 (Used Answers)

Get-WmiObject -Class Win32_Service -Filter "Name='WinRM'" | 
        Invoke-WmiMethod -Name ChangeStartMode -Argument 'Automatic' 