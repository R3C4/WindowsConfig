





function GitDownloader($repo, $filenamePattern) {
    # $repo = "REPOURL"
    # $filenamePattern = "FILTER"
    ((Invoke-RestMethod -Method GET -Uri "https://api.github.com/repos/Mr30nama/30nama/releases")[0].assets | Where-Object name -like $filenamePattern ).browser_download_url
    
}

