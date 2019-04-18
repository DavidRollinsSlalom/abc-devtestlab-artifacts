<#
.SYNOPSIS
    Gets the list of all repo hosted on BitBucket for a user.
.DESCRIPTION
   
.EXAMPLE
    Get-BitBucketAllRepo
#>
function Get-BitBucketAllRepo {
    [CmdletBinding()]param(
        [string]$Username = $script:BitBucketUsername
    )
    try{
        $Manifest = Invoke-BitBucketWebRequest -Resource "repositories/${Username}" | Select-Object -ExpandProperty Content | ConvertFrom-Json | Select-Object -ExpandProperty values

        }catch {
            if ($_.ErrorDetails) {
                Write-Error $_.ErrorDetails.Message
            } else {
                Write-Error $_
            }
        }
        return $Manifest
}

