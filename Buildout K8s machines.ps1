$vCenterName = "vcenter.42u.local"
$vCenterCredentials = Get-Credential
$k8sMaster = "VMUG-Master"
$k8sNode1 = "VMUG-Node1"
$k8sNode2 = "VMUG-Node2"

Connect-VIServer -server $vCenterName -Credential $vCenterCredentials

#Stop-VM -vm "VMUG-Master"
#Remove-VM -DeletePermanently -vm "VMUG-Master"

Get-Folder "K8s Lab - VMUG" | Get-VM | Stop-VM 
Get-Folder "K8s Lab - VMUG" | Get-VM | Remove-VM -DeletePermanently -Confirm:$false
Start-Sleep -Seconds 10


New-VM -Template "Ubuntu-1804-tmpl" -Name $k8sMaster -ResourcePool "Physical Servers" -Location "K8s Lab - VMUG" 
New-VM -Template "Ubuntu-1804-tmpl" -Name $k8sNode1 -ResourcePool "Physical Servers" -Location "K8s Lab - VMUG" 
New-VM -Template "Ubuntu-1804-tmpl" -Name $k8sNode2 -ResourcePool "Physical Servers" -Location "K8s Lab - VMUG"
start-sleep -Seconds 30
Get-Folder "K8s Lab - VMUG" | Get-VM | Start-VM
