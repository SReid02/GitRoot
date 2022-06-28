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