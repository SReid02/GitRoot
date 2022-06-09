Get-Command *date*
Get-Date
Get-Date | Get-Member
get-date | Select-Object -Property DayOfYear
get-date | Select-Object -Property DayOfYear | Get-Member
get-date | Select-Object -Property DayOfYear | FL
get-help get-date 
(get-date).DayOfYear
(get-date).DayOfYear | Get-Member # here we are only getting the day of year and seeing just the contents of this property

$date1 = get-date | Select-Object -Property DayOfYear
$date2 = (get-date).DayOfYear

$date1 - 60 #as a date time OBJECT YOU CANNOT subtract -60
$date2 - 60 #as an INT you can take -60 as this is just a whole number

$date1.DayOfYear - 60 #here your just taking the property to subtract by 60 instead of whole OBJ

#TASK 2

Get-Command *hotfix*
Get-HotFix 
Get-HotFix | Get-Member
Get-HotFix | Select-Object -Property ID,Date,Installedby #I read this incorrectly below is correct solution
Get-HotFix | Select-Object -Property HotfixID,InstalledOn,Installedby

#VAR
$date = get-date
Get-HotFix | 
            Select-Object -Property HotfixID,InstalledOn,Installedby, #using the select object to filter the results we want to see/manulipate
            @{ n='DaysSinceInstalled';e={($date - $_.Installedon).Days }}  #HASH Table 

Get-HotFix | 
            Select-Object -Property HotfixID,InstalledOn,Installedby, 
            @{ n='DaysSinceInstalled';e={($date - $_.Installedon).Days }} | # we created the porperty as "DaysSinceInstalled" allowing use to use a where object to search for days greater then 300
            Where-Object {$_.DaysSinceInstalled -gt 300}

#TASK 3 DHCP

get-command *dhcp*

#TASK 4 Firewalls

#TASK 5

#TASk 6

#Exercise 2 FILTERING OBJECTS

#TASK 1

Get-Aduser -Filter * -Property * | Get-Member
get-aduser -Filter * -SearchBase "cn=Users,dc=adatum,dc=com" | Format-Table

#TASK 2

#TASK 3
#Display a directory listing of all the items on the CERT drive. Include subfolders in the list.

#Click for hint
#Click to see the answer
#Display the list again and display the name and issuer for only the certificates that don't have a private key. Display the results in one column.
#Click for hint
#Click to see the answer
#Display the list again and display only the current certificates. Those certificates have a NotBefore date that's before today and a NotAfter date that's after today. Include the NotBefore and NotAfter properties in the results and display the results in a format that allows you to easily compare dates. Also, make sure that no data is truncated.
#Click for hint
#Click to see the answer

Get-PSDrive
Get-ChildItem -Path cert: -Recurse |
Where-Object {$_.HasPrivateKey -eq $false}
Select-Object -Property Name,Issuer 

#TASK 4
#Create a report that displays the disk volumes that are running low on space

$free = 99
Get-Volume | 
Where-Object { $_.SizeRemaining -gt 0 -and $_.SizeRemaining / $_.Size -lt .99 }| 
Select-Object -Property DriveLetter, @{n='Size';e={[Math]::Round($PSItem.Size / 1MB,3)}}

#TASK5

Get-ChildItem -Path E:\ -Recurse | get-member 
Get-ChildItem -Path E:\ -Recurse -file | 
Select-Object -Property fullname 

#not to see DIR
Get-ChildItem -Path E:\ -Recurse -file | 
Select-Object -Property name 

1..20 | ForEach-Object {Get-Random} #gets an array (1..20) of objects an does something to them 1 by 1  