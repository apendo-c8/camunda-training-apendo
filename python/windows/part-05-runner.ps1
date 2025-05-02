# powershell -ExecutionPolicy Bypass -File .\part-05-runner.ps1

Write-Host "🚀 Starting all workers..."

# Starta varje Python-script som bakgrundsjobb
$jobs = @()
$jobs += Start-Job -ScriptBlock { python ../workers/model-uploading-online.py }
$jobs += Start-Job -ScriptBlock { python ../workers/image-enhancement.py }
$jobs += Start-Job -ScriptBlock { python ../workers/thumbnails-production.py }
$jobs += Start-Job -ScriptBlock { python ../workers/asset-storage.py }

# Hantera Ctrl+C för att stoppa alla jobb
$cancelEvent = {
    Write-Host "🛑 Stopping all workers..."
    Get-Job | ForEach-Object {
        Stop-Job $_.Id -Force
        Remove-Job $_.Id
    }
    exit
}
Register-EngineEvent ConsoleCancelEventHandler -Action $cancelEvent | Out-Null

# Vänta på att alla jobb slutförs
Wait-Job -Job $jobs

# Hämta loggar (om något skrevs till output)
$jobs | ForEach-Object { Receive-Job $_ }