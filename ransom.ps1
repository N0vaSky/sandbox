# Install Fibratus
curl https://raw.githubusercontent.com/N0vaSky/Fibratus-Install/refs/heads/main/Install-Fibratus.ps1 | iex

# Start Fibratus Monitoring (file operations)
Write-Output "fibratus run \"kevt.category = 'file'\" --forward"


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
