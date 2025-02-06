# Install Fibratus
curl https://raw.githubusercontent.com/N0vaSky/Fibratus-Install/refs/heads/main/Install-Fibratus.ps1 | iex

# Print Ransomware Samples Archive Link
Write-Output "https://github.com/N0vaSky/Ransomware-Samples/archive/refs/heads/main.zip"

# Start Fibratus Monitoring (file operations)
Write-Output "fibratus run \"kevt.category = 'file'\" --forward"

# Print Sublime Text Download Link
Write-Output "https://www.sublimetext.com/download_thanks?target=win-x64"

# Populate User Directories with Realistic Files
$baseDirs = @("$env:USERPROFILE\Desktop", "$env:USERPROFILE\Documents", "$env:USERPROFILE\Downloads", "$env:USERPROFILE\Pictures", "$env:USERPROFILE\Videos", "$env:USERPROFILE\AppData\Local", "$env:USERPROFILE\AppData\Roaming", "$env:USERPROFILE\AppData\Local\Temp")
foreach ($dir in $baseDirs) { New-Item -ItemType Directory -Path $dir -Force | Out-Null }

$extensions = @(".txt", ".docx", ".xlsx", ".jpg", ".png", ".pdf", ".exe", ".zip", ".mp4", ".mp3", ".html")
foreach ($dir in $baseDirs) {
    1..50 | ForEach-Object {
        $file = "$dir\$(-join ((65..90) + (97..122) | Get-Random -Count 8 | ForEach-Object { [char]$_ }))$(Get-Random -InputObject $extensions)"
        Set-Content -Path $file -Value "Sample content for testing."
    }
}

Write-Output "Fake user environment created. Ready for ransomware execution."
