# create a new user
#setting up variable
Connect-AzureAD
$PasswordProfile = New-Object -TypeName Microsoft.Open.AzureAD.Model.PasswordProfile
$PasswordProfile.Password = "Luno7955"
#exmaple below worked. Usage locations use US AU etc, Mail nickname is required, on UPN remember to create user in right tenant.
New-AzureADUser -Displayname "az104-01a-aaduser2" -passwordprofile $PasswordProfile `
-userprincipalname "az104-01a-aaduser2@samuelreid01outlook.onmicrosoft.com" `
-mailnickname "az104-01a-aaduser2" `
-accountenabled $true `
-usagelocation "US" `
-department "IT"

New-AzureADUser -Displayname "az104-01a-aaduser2" -passwordprofile $PasswordProfile `
-userprincipalname "az104-01a-aaduser2@<Tenant>.onmicrosoft.com" `
-mailnickname "az104-01a-aaduser2" `
-accountenabled $true `
-usagelocation "US" `
-department "IT"