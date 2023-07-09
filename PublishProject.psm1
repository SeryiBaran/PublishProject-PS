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
  Publish-Project

 .Example
  Publish-Project -s 0 -r RepoNameWhatNotEqualsDirectoryName # Don't use SSH and use custom repo name
#>
function Publish-Project {
  [CmdletBinding()]
  param(
    [alias("s")]
    [boolean]
    $UseSSH = $True,

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
    Write-Host "Oh, error occurred:" -ForegroundColor red
    Write-Error $_
    break
  }

  Write-Host "Done!" -ForegroundColor green
}
