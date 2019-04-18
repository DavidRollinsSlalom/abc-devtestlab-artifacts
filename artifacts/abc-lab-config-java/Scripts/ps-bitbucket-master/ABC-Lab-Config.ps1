Set-Location  $PSScriptRoot;
Write-Host "Working from $PSScriptRoot"
Import-Module $PSScriptRoot\PS.BitBucket.psm1 -force
$global:ErrorActionPreference = "Stop"
Set-BitBucketServer -Url "https://api.bitbucket.org"
$BitBucketCred = Get-Credential -Message "Please enter the username and password for your BitBucket Account provided by the lab instructor."
Set-BitBucketCredential -Credential $BitBucketCred

try {
    $BitBucketUsername = Set-BitBucketUsername
    Get-BitBucketServer | Out-Null
    Get-BitBucketAllRepo | Out-Null
    Write-Host "Success! Connected to BitBucket!" -ForegroundColor Green
}
catch {
    $ErrorMessage = $_.Exception.Message
    Write-Error "Error: $ErrorMessage"
    exit 1
}
try {
    Write-Host "Reseting C:\Dev Directory"
    #Removing old directory
    Remove-Item -Force -Path C:\Dev -Recurse -Confirm:$false -ErrorAction Ignore| Out-Null
    #Making a new directory
    New-Item -ItemType Directory -Force -Path C:\Dev -ErrorAction Ignore

    Write-Host "Removing old forks"
    #Removing old repositories (if any exist)
    Get-BitBucketAllRepo | ForEach-Object { Remove-BitBucketRepo -Repository $_.name }

}
catch {
    $ErrorMessage = $_.Exception.Message
    Write-Error "Error: $ErrorMessage"
    exit 1

}


try {
    Write-Host "Creating fork and cloning into C:\Dev"
    Set-Location -Path C:\Dev
    New-ForkRepo -Name $BitBucketUsername.ToLower() -SourceRepository abccicdworkshop/cicd-drugstore
    Write-Host "Success! Created new fork of CI/CD Lab Repo!" -ForegroundColor Green
}
catch {
    $ErrorMessage = $_.Exception.Message
    Write-Error "Error: $ErrorMessage"
    exit 1
}
try {
    Write-Host "Cloning new repository"
    $OldBitBucketAuthURL = "https://" + $BitBucketUsername + "@bitbucket.org"
    $BitBucketAuthURL = "https://" + $BitBucketUsername + ":" + $BitBucketCred.GetNetworkCredential().Password + "@bitbucket.org"
    Sleep -Seconds 10
    Get-BitBucketAllRepo | Select-Object -ExpandProperty links | Select-Object -ExpandProperty clone | Where-Object { $_.Name -eq 'https' } | Select-Object -ExpandProperty href | ForEach-Object { $url = $_;$url = $url.Replace($OldBitBucketAuthURL, $BitBucketAuthURL);git.exe clone $url -v}
    Write-Host "Success! Cloned CI/CD Lab Repo!" -ForegroundColor Green
}
catch {
    $ErrorMessage = $_.Exception.Message
    Write-Error "Error: $ErrorMessage"
    exit 1
}
try {
    Write-Host "Configuring Gradle Wrapper"
    $BatPath = "C:\Dev\" + $BitBucketUsername + "\gradlew.bat"
    $WorkingDir = "C:\Dev\" + $BitBucketUserName
    Start-Process -Wait $BatPath -ArgumentList "eclipse" -NoNewWindow -WorkingDirectory $WorkingDir
    Write-Host "Configured Gradle wrapper!" -ForegroundColor Green
    Write-Host "LAB SETUP COMPLETE!" -ForegroundColor Green
}
catch {
    $ErrorMessage = $_.Exception.Message
    Write-Error "Error: $ErrorMessage"
    exit 1
}
Read-Host "Press ENTER to exit..."
Get-Process -Name "powershell" | % {Stop-Process $_}








