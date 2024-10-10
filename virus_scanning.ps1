
$foldersToScan = @{
    "Youthsafe"       = "D:\Youthsafe"
    "YouthesafeE"     = "E:\youthsafe"
    "ownerDocumentsC" = "C:\Users\Owner\Documents"
    "ownerDownloadsC" = "C:\Users\Owner\Downloads"
    "programFilesD"   = "D:\Program Files"
    "usersD"          = "D:\Users"
    "capstoneD"       = "D:\Capstone"
}

function Set-FolderName {
    $logFilePath = "D:\Secure\system_scripts_ps\Logs"
    $currentDate = Get-Date -Format "yyyy-MM-dd_HH-mm-ss"
    $logFileLocation = "{0}\{1}.txt" -f $logFilePath, $currentDate
    return $logFileLocation
}

function Test-Folders {
    param (
        [string]$folder
    )
    $logFile = Set-FolderName
    Start-Process -FilePath "C:\Program Files\ClamAV\clamscan.exe" -ArgumentList "-r $folder" -RedirectStandardOutput $logFile -NoNewWindow -Wait
}

function Invoke-ForEach {
    foreach ($folder in $foldersToScan.Values) {
        Test-Folders -folder $folder
    }
}

function Main {
    Invoke-ForEach
}

Main
