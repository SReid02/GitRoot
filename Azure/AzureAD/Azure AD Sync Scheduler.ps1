#this is to be run from on prem ADAzure Connect. 
#views AD Sync information
Get-ADSyncScheduler
#sets the schedule time to 1 hour instead of default 30 mins
Set-ADSyncScheduler -CustomizedSyncCycleInterval 01:00:00 #Changes the Currently Effective Sync Cycle Interval
#forces the Scheudal to update instead of waiting until next sync
Start-ADSyncSyncCycle -PolicyType Delta #Delta is an incremental 
#this is to view changes have been made to the Currently Effective Sync Cycle Interval (wait 2-5 mins for change to occur)
Get-ADSyncScheduler 