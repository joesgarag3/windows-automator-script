
Write-Host "******************************"
Write-Host " AUTOMATED NETWORK ANALYSIS "
Write-Host "******************************"

$ipAdress = whoami
$internetConnection = ping google.com
$netConnection = netstat -ano

Write-Host = "IP ADRESS : "
 $ipAdress
Write-Host = "CONNECTIVITY : "
$internetConnection
Write-Host = "NETWORK STATUS : "
$netConnection