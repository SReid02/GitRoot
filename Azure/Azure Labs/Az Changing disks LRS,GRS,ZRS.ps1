#LRS = Local Redundent storage, GRS = Global, ZRS = Zone got Standard premium
#SKU is stock keeping unit used for billing.
(Get-AzDisk -ResourceGroupName $rgName -Name $diskName).Sku
#Variables can be changed to what you need (SKU is a term you will seen whenever identifying different products. It's the code linked to a barcode that allows the Point of Sale system to know exactly which product is being sold, allows inventory to be tracked, etc. In this case, it's the version of the azure resource you are subscribing to.)
New-AzDiskUpdateConfig -Sku Premium_LRS | Update-AzDisk -ResourceGroupName $rgName -DiskName $diskName