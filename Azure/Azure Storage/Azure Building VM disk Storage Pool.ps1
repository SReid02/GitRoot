#commands can be the same as normal powershell on windows. Below build a pool from avaibale disks

New-StoragePool -FriendlyName storagepool1 -StorageSubsystemFriendlyName "Windows Storage*" -PhysicalDisks (Get-PhysicalDisk -CanPool $true)

New-VirtualDisk -StoragePoolFriendlyName storagepool1 -FriendlyName virtualdisk1 -Size 2046GB -ResiliencySettingName Simple -ProvisioningType Fixed

Initialize-Disk -VirtualDisk (Get-VirtualDisk -FriendlyName virtualdisk1)

New-Partition -DiskNumber 4 -UseMaximumSize -DriveLetter Z