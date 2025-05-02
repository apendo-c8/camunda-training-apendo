# powershell -ExecutionPolicy Bypass -File .\part-03-runner.ps1

Write-Host "🚀 Starting all workers..."

# Starta båda jobben i bakgrunden
$job1 = Start-Job -ScriptBlock {
    python ../workers/model-uploading-online.py
}
$job2 = Start-Job -ScriptBlock {
    python ../workers/image-enhancement.py
}

# Hantera Ctrl+C för att stoppa båda jobben
$cancelEvent = {
    Write-Host "🛑 Stopping all workers..."
    Get-Job | ForEach-Object {
        Stop-Job $_.Id
        Remove-Job $_.Id
    }
    exit
}
Register-EngineEvent PowerShell.Exiting -Action $cancelEvent | Out-Null

# Vänta på att båda jobben ska slutföras
Wait-Job -Job $job1, $job2

# Hämta utdata
Receive-Job -Job $job1
Receive-Job -Job $job2