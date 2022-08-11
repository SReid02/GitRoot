#after windows backup is configured use this command to restart the DC in restore mode. Use local logon
bcdedit /set safeboot dsrepair
#choose where to get backup from and where to restore
wbadmin get versions -backuptarget:E: -machine:LON-DC1
#after getting the version you can choose it to beging backup
wbadmin start systemstaterecovery -version:<version> -backuptarget:E: -machine:LON-DC1