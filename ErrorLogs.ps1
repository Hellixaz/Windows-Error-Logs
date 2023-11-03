# System Logs
$systemEventLog = Get-WinEvent -LogName "System" -ErrorAction SilentlyContinue
if ($systemEventLog) {
    $filteredSystemEvents = $systemEventLog | Where-Object { $_.Level -eq 2 }
    $systemEventsJson = $filteredSystemEvents | Select-Object TimeCreated, Id, Message | ConvertTo-Json
    $systemEventsJson | Set-Content -Path "$env:USERPROFILE\Desktop\Errors.json"
} else {
    Write-Host "Sistem günlüklerinde hata bulunamadı."
}

# Security Logs
$securityEventLog = Get-WinEvent -LogName "Security" -ErrorAction SilentlyContinue
if ($securityEventLog) {
    $filteredSecurityEvents = $securityEventLog | Where-Object { $_.Level -eq 2 }
    $securityEventsJson = $filteredSecurityEvents | Select-Object TimeCreated, Id, Message | ConvertTo-Json
    $securityEventsJson | Set-Content -Path "$env:USERPROFILE\Desktop\Errors.json"
} else {
    Write-Host "Güvenlik günlüklerinde hata bulunamadı."
}
