# PublishProject-PS

Tiny PowerShell module for initializing git repository and push it to GitHub.

## Installing

```powershell
Install-Module PublishProject
```

## Usage

### `Publish-Project`

```
NAME
    Publish-Project

SYNOPSIS
    Creates git repo and publish to GitHub


SYNTAX
    Publish-Project [-UseSSH] <Boolean> [[-RepoName] <String>] [<CommonParameters>]


DESCRIPTION
    Creates git repo and publish to GitHub
    A GitHub repository must be created.


PARAMETERS
    -UseSSH <Boolean>
        Use SSH or HTTPS (boolean)

        Required?                    true
        Position?                    1
        Default value                False
        Accept pipeline input?       false
        Accept wildcard characters?  false

    -RepoName <String>

        Required?                    false
        Position?                    2
        Default value
        Accept pipeline input?       false
        Accept wildcard characters?  false

    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216).

INPUTS

OUTPUTS

    -------------------------- EXAMPLE 1 --------------------------

    PS > Publish-Project -s 1






    -------------------------- EXAMPLE 2 --------------------------

    PS > Publish-Project -s 1 -n NameWhatNotEqualsDirectoryName







RELATED LINKS

```
