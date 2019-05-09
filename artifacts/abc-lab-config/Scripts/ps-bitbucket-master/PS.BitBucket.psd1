﻿# Manifest for PS.BitBucket Module
@{

    # Script module or binary module file associated with this manifest.
    RootModule            = 'PS.BitBucket.psm1'

    # Version number of this module.
    ModuleVersion         = '1.1.3'

    # ID used to uniquely identify this module
    GUID                  = '9f735f6c-b57e-416f-8637-fdee31ef6759'
  
    # Author of this module
    Author                = 'i9shankar'

    # Company or vendor of this module
    CompanyName           = 'itsmeshankar1@gmail.com'

    # Copyright statement for this module
    Copyright             = 'Copyright © 2017. All rights reserved'

    # Description of the functionality provided by this module
    Description           = 'Bitbucket automation using powershell with rest api'

    # Minimum version of the Windows PowerShell engine required by this module
    PowerShellVersion     = '3.0'

    # Name of the Windows PowerShell host required by this module
    # PowerShellHostName = ''

    # Minimum version of the Windows PowerShell host required by this module
    # PowerShellHostVersion = ''

    # Minimum version of Microsoft .NET Framework required by this module
    # DotNetFrameworkVersion = ''

    # Minimum version of the common language runtime (CLR) required by this module
    # CLRVersion = ''

    # Processor architecture (None, X86, Amd64) required by this module
    ProcessorArchitecture = 'None'

    # Modules that must be imported into the global environment prior to importing this module
    RequiredModules       = @()

    # Assemblies that must be loaded prior to importing this module
    # RequiredAssemblies = @()

    # Script files (.ps1) that are run in the caller's environment prior to importing this module.
    # ScriptsToProcess = @()

    # Type files (.ps1xml) to be loaded when importing this module
    # TypesToProcess = @()

    # Format files (.ps1xml) to be loaded when importing this module
    # FormatsToProcess = @()

    # Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
    # NestedModules = @()

    # Functions to export from this module
    FunctionsToExport = @(
        'New-BitBucketRepo'
        'Set-BitBucketServer'
        'Get-BitBucketServer'
        'Get-BitBucketInfo'
        'Set-BitBucketInfo'
        'Set-BitBucketUsername'
        'Remove-BitBucketRepo'
        'Set-BitBucketCredential'
        'Get-BitBucketProjects'
        'Get-BitBucketRepoByProject'
        'Get-BitBucketAllRepo'
        'Get-BitBucketRepoSizeByProject'
        'Get-BitBucketAllRepoSize'
        'New-CreateBranch'
        'New-ForkRepo'
        'Set-UserFullNameAndEmail'
        'Set-BranchPermission'
        'Set-DefaultBranch'
    )
    # Cmdlets to export from this module
    CmdletsToExport       = '*'

    # Variables to export from this module
    # VariablesToExport = @()

    # Aliases to export from this module
    # AliasesToExport = @()

    # DSC resources to export from this module
    # DscResourcesToExport = @()

    # List of all modules packaged with this module
    # ModuleList = @()

    # List of all files packaged with this module
    # FileList = @()

    # Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
    PrivateData           = @{

        PSData = @{

            # Tags applied to this module. These help with module discovery in online galleries.
            Tags         = @("Bitbucket", "Powershell", "BitbucketAutomation", "Git", "Bitbucket-API")

            # A URL to the main website for this project.
            ProjectUri   = 'https://github.com/i9shankar/ps-bitbucket/'

            # A URL to an icon representing this module.
            # IconUri = ''

            # ReleaseNotes of this module
            ReleaseNotes = '
                [1.1.3] Add New-CreatBranch function
                [1.1.2] Manifest change
                [1.1.1] Moved functions to cmdlet
                [1.1.0] Changes to match psgallery creteria
                [1.0.0] Initial Version
            '

            # External dependent modules of this module
            # ExternalModuleDependencies = ''

        } # End of PSData hashtable

    } # End of PrivateData hashtable

    # HelpInfo URI of this module
    HelpInfoURI           = 'https://github.com/i9shankar/ps-bitbucket/'

    # Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
    # DefaultCommandPrefix = ''

}
