#User express:
# I can't reach te company server/external websites.
# I can't bowser the internet

Write-Host "Cheking external connectivity" -ForegroundColor Cyan

if (Test-Connection 8.8.8.8 -Count 2 -Quiet) {
Write-Host "Internet connection is active" -ForegroundColor Green
}
else {
Write-Hsot "[ERROR] No internet connection detected. Check physical cable or router" -ForegroundColor Red
}

Resolve-DNSName google.com

