#EXERCISE 1
#TASK 1

Get-Alias 
get-help dir -ShowWindow
get-help New-Item -ShowWindow
New-Item -Path "\\lon-svr1\C$\" -ItemType Directory -Name "ScriptShare"

#TASK 2

New-PSDrive -PSProvider FileSystem -Root "\\lon-svr1\C$\ScriptShare" -Name ScriptShare

#TASK3

get-help Set-Location -ShowWindow
Set-Location -Path "\\lon-svr1\C$\ScriptShare"
New-Item -Path ".\" -ItemType File -name "script.txt"
Get-ChildItem #shows all DIR items under C$\ScriptShare
set-Item -Path ".\script.txt" -value "adfadsf"
"adfadsf" | Out-File .\script.txt
Get-Content .\script.txt


#EXERCISE 2
#we created a registary key

 Get-ChildItem -Path HKCU:\SOFTWARE
 Set-Location HKCU:\SOFTWARE
 New-Item -Path . -Name Scripts
 New-ItemProperty -Path HKCU:\SOFTWARE\Scripts -Name PSDriveName -Value ScriptShare
 Get-ChildItem -Path HKCU:\SOFTWARE\ #Shows all items and properties. Item properties Name:value under the properties value
 Get-ItemPropertyValue -Path HKCU:\SOFTWARE\Scripts -Name PSDriveName
 Get-ItemProperty -Path HKCU:\SOFTWARE\Scripts -Name PSDriveName


#EXERCISE 3

Import-Module ActiveDirectory
New-PSDrive -Name AdatumUsers -Root "CN=Users,DC=Adatum,DC=com" -PSProvider ActiveDirectory
Get-PSDrive #listed the aviable the drive lables that already to point to a path
Set-Location  AdatumUsers: #Ask why we have to use the : We created this a a lable to naviagete to the location of a PSDrive.
Get-ChildItem #Dir Listing

get-help Set-Location -ShowWindow