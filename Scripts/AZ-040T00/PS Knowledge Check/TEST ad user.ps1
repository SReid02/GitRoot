Import-Csv C:\newuser.csv

$userfromCSV = Import-Csv C:\newuser.csv

foreach ($aduser in $userfromCSV){
$splat = @{
GivenName = $aduser.firstname 
surname = $aduser.Lastname
Department = $aduser.department 
City = $aduser.city
name = $aduser.firstname + ' ' + $aduser.lastname
}

if ($aduser.department -eq 'it'){}
if ($aduser.city -eq 'london')}