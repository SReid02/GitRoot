Install-Module -Name PowerShellGet -Force -AllowClobber

Install-Module -Name MicrosoftTeams -Force -AllowClobber
#connects powershell to teams
Connect-MicrosoftTeams

#This gets all team members in the below group ID 
get-teamuser -GroupId c465995f-b0b6-4eb6-bc7d-f80941f5f0ad