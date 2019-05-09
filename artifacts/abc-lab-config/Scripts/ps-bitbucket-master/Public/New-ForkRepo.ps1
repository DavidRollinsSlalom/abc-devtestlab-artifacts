##############################
#.SYNOPSIS
#Forks a repository
#
#.DESCRIPTION
#create a new repo on bitbucket from given source repo
#
#.PARAMETER SourceBranch
#source branch (one which exist already)
#
#.PARAMETER Name
#New Repository (To be created)
#s
#.EXAMPLE
#New-ForkRepo -SourceBranch "abccicdworkshop/cicd-drugstore" -Name "abc-fork1"
#
#.NOTES
#General notes
##############################
function New-ForkRepo {
    [CmdletBinding()]param(
        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string]$Name,
        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string]$SourceRepository
    )
    try
    {
        $NewRepoBody = @{
            name    = $Name
        } | ConvertTo-Json     

        Write-Verbose -Message "JsonBody - $NewRepoBody"
        $Manifest = Invoke-BitBucketWebRequest -Resource "repositories/${SourceRepository}/forks" -Method Post -Body $NewRepoBody
        Write-Verbose -Message "Response: $Manifest"
        Write-Output "[Info] Fork created: $Name"
    }
    catch [System.Exception] 
    {
        Write-Output "[Return Message:] $Manifest"
        Throw $_.Exception.Message;
    }
    finally
    {
    }
}
