<#
.SYNOPSIS
    Sets the target BitBucket User
.DESCRIPTION
    All further cmdlets from Ps.BitBucket will be executed against the username specified by this cmdlet..
.EXAMPLE
    Set-BitBucketServer
#>
function Set-BitBucketUsername {
    try {
        $Response = Invoke-BitBucketWebRequest -Resource "user"
        $Manifest = $Response | ConvertFrom-Json
    }
    catch {
        if ($_.ErrorDetails) {
            Write-Error $_.ErrorDetails.Message
        }
        else {
            Write-Error $_
        }
    }
    $script:BitBucketUsername = $Manifest.nickname
    Write-Host "User nickname is $script:BitBucketUsername"
    return $script:BitBucketUsername
}
