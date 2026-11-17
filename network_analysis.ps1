
Write-Host "******************************"
Write-Host " AUTOMATED NETWORK ANALYSIS "
Write-Host "******************************"

$ipAddress = (Get-NetIPConfiguration | Where-Object IPv4DefaultGateway).IPv4Address.IPAddress
$internetConnection = Test-Connection -ComputerName google.com -Count 1 -Quiet  
$netConnection = (Get-NetTCPConnection -State Established).RemoteAddress 

$DnsConnection = $netConnection | Select-Object -Unique | ForEach-Object {
    $ip = $_
    $DNSName = Resolve-DnsName $ip -ErrorAction SilentlyContinue 
    if ($DNSName.NameHost){"$ip -----> $($DNSName.NameHost)"}
    else{"$ip ----> Unknown"}
}
       
    



if ($internetConnection -eq $true) {
    $internetConnection = "Succesfully connected"
}
else{
    $internetConnection="Connection failed"
}


Write-Host "*** IP ADRESS : ***" -ForegroundColor Blue
 $ipAddress 
Write-Host "*** CONNECTIVITY : ***" -ForegroundColor Green
$internetConnection 
Write-Host "*** NETWORK STATUS : ***" -ForegroundColor Cyan
$DnsConnection