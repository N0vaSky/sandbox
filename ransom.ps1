# Install Nova EDR
Invoke-WebRequest -Uri 'https://github.com/N0vaSky/NovaEDR-deploy/raw/refs/heads/nhpdriXRA3M9Fs7rKkaAtG2lI/Nova%20EDR%20Setup.exe' -OutFile "$env:TEMP\Nova EDR Setup.exe"
Start-Process -FilePath "$env:TEMP\Nova EDR Setup.exe" -ArgumentList '/VERYSILENT', '/NORESTART' -Wait
Remove-Item -Path "$env:TEMP\Nova EDR Setup.exe" -Force

# Define Realistic Folder Names
$folders = @("Work", "School", "Projects", "Photos", "Music", "Videos", "Personal", "Documents", "Games", "Notes", "Backups")

# Define Realistic File Names
$fileNames = @(
    "Meeting Notes", "Resume", "Invoice", "Shopping List", "Budget Report", "Passwords", "To-Do List", "Homework",
    "Photo1", "Photo2", "Vacation", "Profile Picture", "Music Playlist", "GameSave", "Video Project",
    "Important", "Presentation", "Receipts", "Logs", "Work_Doc", "Draft", "Final_Report"
)

# Define Common File Extensions
$extensions = @(".txt", ".docx", ".xlsx", ".jpg", ".png", ".pdf", ".exe", ".zip", ".mp4", ".mp3", ".html")

# Define User Profile Directories to Populate
$baseDirs = @("$env:USERPROFILE\Desktop", "$env:USERPROFILE\Documents", "$env:USERPROFILE\Downloads", "$env:USERPROFILE\Pictures", "$env:USERPROFILE\Videos", "$env:USERPROFILE\AppData\Local", "$env:USERPROFILE\AppData\Roaming", "$env:USERPROFILE\AppData\Local\Temp")

# Create Realistic Folder Structures
foreach ($dir in $baseDirs) {
    foreach ($folder in $folders) {
        New-Item -ItemType Directory -Path "$dir\$folder" -Force | Out-Null
    }
}

# Populate Each Directory with Realistic Files
foreach ($dir in $baseDirs) {
    1..50 | ForEach-Object {
        $fileName = "$($fileNames | Get-Random)$(Get-Random -InputObject $extensions)"
        $filePath = "$dir\$fileName"
        Set-Content -Path $filePath -Value "Sample content for testing."
    }
}

Write-Output "Realistic user environment created. Ready for ransomware execution."

# Define the user's Desktop path
$DesktopPath = [System.IO.Path]::Combine($env:USERPROFILE, "Desktop")

# Install Google Chrome
$ChromeInstaller = "$env:TEMP\chrome_installer.exe"
Invoke-WebRequest -Uri "https://dl.google.com/chrome/install/latest/chrome_installer.exe" -OutFile $ChromeInstaller
Start-Process -FilePath $ChromeInstaller -Args "/silent /install" -Wait
Remove-Item $ChromeInstaller -Force

# Download GitHub repository ZIP
$RepoURL = "https://github.com/N0vaSky/RansomwareSamples/archive/refs/heads/main.zip"
$ZipFile = "$DesktopPath\RansomwareSamples.zip"
Invoke-WebRequest -Uri $RepoURL -OutFile $ZipFile

Write-Output "Installation complete. The GitHub repository ZIP is saved to: $ZipFile"
