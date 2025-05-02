# powershell -ExecutionPolicy Bypass -File .\part-02-runner.ps1

Write-Host "🚀 Starting all workers..."

# Starta jobbet i bakgrunden
$job = Start-Job -ScriptBlock {
    python ../workers/model-uploading-online.py
}

# Hantera Ctrl+C för att stoppa jobbet
$cancelEvent = {
    Write-Host "🛑 Stopping all workers..."
    Stop-Job $job.Id
    Remove-Job $job.Id
    exit
}
Register-EngineEvent PowerShell.Exiting -Action $cancelEvent | Out-Null

# Vänta tills jobbet är klart
Wait-Job $job
Receive-Job $job