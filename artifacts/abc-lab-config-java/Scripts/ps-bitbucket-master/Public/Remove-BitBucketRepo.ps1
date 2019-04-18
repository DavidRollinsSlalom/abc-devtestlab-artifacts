<#
.SYNOPSIS
    Removes a repo
.DESCRIPTION

.PARAMETER Repository
    Mandatory - Repository name
.PARAMETER Username
    Optional - Username context that the repository is located in, will default to username from Set-BitBucketUsername if not passed   
.EXAMPLE
    Remove-BitBucketRepo -Repository "ABC"
.EXAMPLE
    Remove-BitBucketRepo -Repository "ABC" -Username "abc-lab-user-01"
#>
function Remove-BitBucketRepo {
    [CmdletBinding()]param(
        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string]$Repository,
        [string]$Username = $script:BitBucketUsername
        )
    try
    {
        # Check if .gitignore file exist
        if ([string]::IsNullOrEmpty($Repository))
        {
           Write-Output "[Error:] Repository name is empty"
            Break;
        }
 
        $Manifest = Invoke-BitBucketWebRequest -Resource "repositories/${Username}/${Repository}" -Method Delete
        if ($Manifest.StatusCode -eq "204")
        {
            Write-Output "[Info] $Repository Deleted"
        }
        else {
            Write-Output "[Error] failed to delete $Repository"
            Write-Output "[Reponse:] $Manifest"
            Break;
        }
    } 
    catch [System.Exception] 
    {
        Write-Output "[Return Message:] $Manifest"
        Throw $_.Exception.Message;
    }
    finally
    {
       #Set-Location  $PSScriptRoot;
    }
}
