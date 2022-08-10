Install-WindowsFeature -Name "adfs-federation" -includemanagementtools
#on the DC get the KDS root key
Get-KdsRootKey –EffectiveTime (Get-Date).AddHours(-10)
#if no output arrives 
Add-KdsRootKey –EffectiveTime (Get-Date).AddHours(-10)
#install the first server in ADFS farm.
#Install-AdfsFarm -CertificateThumbprint <certificate_thumbprint> -FederationServiceName <federation_service_name> -GroupServiceAccountIdentifier <domain>\<GMSA_Name>$
#exampled test in a lab
Install-AdfsFarm -CertificateThumbprint "8bd09be0A87c80a16f30f7429e9ca3e9f7903a71" -FederationServiceDisplayName "A. Datum Corporation" -FederationServiceName "adfs.adatum.com" -GroupServiceAccountIdentifier "adatum\ADFSService'$"
# Important
#You must have domain administrator permissions to create the first federation server in a new federation server farm.


#adding an additional Server to ADFS farm
Add-AdfsFarmNode -GroupServiceAccountIdentifier <domain>\<GMSA_name>$ -PrimaryComputerName <first_federation_server_hostname> -CertificateThumbprint <certificate_thumbprint>
#<domain>\<GMSA_name> is your AD domain and the name of your gMSA account in that domain.
#<first_federation_server_hostname> is the host name of the primary federation server in this existing farm.


#adding Relying Party TRUST
Add-ADFSRelyingPartyTrust -Name ‘A. Datum Corporation Test App’ -MetadataURL ‘https://lon-svr1.adatum.com/AdatumTestApp/federationmetadata/2007-06/federationmetadata.xml’

#adding a claim provider
Add-AdfsClaimsProviderTrust -Name ‘Trey Research’ -MetadataUrl ‘https://adfs.treyresearch.net/federationmetadata/2007-06/federationmetadata.xml’

#Disbale token binding in AD FS
Set-AdfsProperties -IgnoreTokenBinding $true