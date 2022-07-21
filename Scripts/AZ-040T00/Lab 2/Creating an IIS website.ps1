
Enter-PSSession -ComputerName lon-svr1

Add-WindowsFeature Web-Server -IncludeManagementTools
new-item  'C:\inetpub\wwwroot\london' -ItemType Directory

get-command *IIS*
new-iissite -name 'London' -bindinginformation '172.16.0.15:8080:' -Physicalpath 'C:\inetpub\wwwroot\london'