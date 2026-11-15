$name = "Soporte TI"

$error = Read-Host "Ingresa la solicitud"

$sistema = Read-Host "SELECCIONA : Password / Impresora / Red"

switch ($sistema) {
"Password" {$sugerencia = "Revisa Active Directory"}
"Red" {$sugerencia = "Ejecuta ipconfig /flushdns"}
"Impresora" {$sugerencia = "Reinicia el servicio Spooler de impresión"}
Default {$sugerencia = "Ticket derivado a Mesa de Ayuda"}
}


Write-Host "--NUEVO TICKET $name--"
Write-Host "Solicitud: $error" -ForegroundColor Green 
Write-Host "Sistema: $sugerencia" -ForegroundColor Blue