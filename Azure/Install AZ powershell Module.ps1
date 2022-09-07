#need powershell get installed on your PC. 
Install-Module -Name Az -Scope CurrentUser -Repository PSGallery -Force
#connect to AZ to begin working
Connect-AzAccount
#install modual for AD
Install-Module -name AzureAD