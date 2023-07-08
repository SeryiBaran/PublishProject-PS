<#
 .Synopsis
  Creates git repo and publish to GitHub

 .Description
  Creates git repo and publish to GitHub
  A GitHub repository must be created.

 .Parameter UseSSH
  Use SSH or HTTPS (boolean)

 .Parameter CustomName
  Custom GitHub repository name (if repo name is not directory name)

 .Example
  Publish-Project -s 1

 .Example
  Publish-Project -s 1 -r RepoNameWhatNotEqualsDirectoryName
#>
function Publish-Project {
  [CmdletBinding()]
  param(
    [parameter(Mandatory = $true)]
    [alias("s")]
    [boolean]
    $UseSSH,

    [alias("r")]
    [string]
    $RepoName
  )

  if ($RepoName) {
    $DirectoryName = $RepoName
  }
  else {
    $DirectoryName = (Get-Item .).Name
  }

  $GithubUser = $(git config user.name)

  $HttpsRemote = "https://github.com/$GithubUser/$DirectoryName.git"
  $SSHRemote = "git@github.com:$GithubUser/$DirectoryName.git"

  if ($UseSSH) {
    $Remote = $SSHRemote
  }
  else {
    $Remote = $HttpsRemote
  }

  try {
    git init
    git add .
    git commit -m "Init commit"
    git branch -M main
    git remote add origin $Remote
    git push -u origin main
  }
  catch {
    Write-Error "🚨 Oh, error occurred:"
    Write-Error $_
    break
  }

  Write-Host "✨ Done!" -ForegroundColor green
}
