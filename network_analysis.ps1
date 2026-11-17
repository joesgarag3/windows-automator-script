
Write-Host "******************************"
Write-Host " AUTOMATED NETWORK ANALYSIS "
Write-Host "******************************"

$ipAddress = (Get-NetIPConfiguration | Where-Object IPv4DefaultGateway).IPv4Address.IPAddress
$internetConnection = Test-Connection -ComputerName google.com -Count 1 -Quiet  
$netConnection = (Get-NetTCPConnection -State Established).RemoteAddress 

$DnsConnection = $netConnection | Select-Object -Unique | ForEach-Object {
    $DNSName = (Resolve-DnsName $_ -ErrorAction SilentlyContinue 2>$null).NameHost
    if ($DNSName){$DNSName}else{"Unknown"}
}
       
    



if ($internetConnection -eq $true) {
    $internetConnection = "Succesfully connected"
}
else{
    $internetConnection="Connection failed"
}


Write-Host "*** IP ADRESS : ***"
 $ipAddress 
Write-Host "*** CONNECTIVITY : ***"
$internetConnection 
Write-Host "*** NETWORK STATUS : ***"
$DnsConnection