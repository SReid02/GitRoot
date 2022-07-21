#Task1 Creating New OU
Get-Help New-ADOrganizationalUnit -ShowWindow
New-ADOrganizationalUnit -Name London

#create new Ad group
get-help New-ADGroup -ShowWindow
New-ADGroup -Name 'London Admins' -GroupScope Global

#creat new ad user
get-command *new-aduser* 
get-help new-aduser -ShowWindow
new-aduser -name 'Ty.Carlson' -DisplayName 'Ty Carlson' 
get-command get-aduser
get-help get-aduser -ShowWindow
get-aduser -Identity 'ty.carlson' | Get-Member
get-aduser -Identity 'Ty.carlson' | Select-Object -Property Name,Displayname
#adding to ad group
get-help add-adgroup -ShowWindow
Add-ADGroupMember -Identity 'London Admins' -members 'Ty.Carlson'
Get-ADGroupMember -Identity  'london admins'
#creating a computer accunt
get-help New-ADComputer -ShowWindow
New-ADComputer -Name 'Lon-Cl2'
Get-ADComputer -Filter * -Properties Name | Where-Object  {$_.Name -eq 'Lon-Cl2'} 