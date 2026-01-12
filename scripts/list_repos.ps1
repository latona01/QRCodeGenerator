# GitHub Repository List Script (excluding QRCodeGenerator)

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "GitHub Repository List (excluding QRCodeGenerator)" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

try {
    # Get repositories from GitHub API
    $repos = Invoke-RestMethod -Uri "https://api.github.com/users/latona01/repos?per_page=100&sort=updated"

    # Filter out QRCodeGenerator
    $filteredRepos = $repos | Where-Object { $_.name -ne "QRCodeGenerator" } | Sort-Object name

    if ($null -eq $filteredRepos -or $filteredRepos.Count -eq 0) {
        Write-Host "No repositories found (excluding QRCodeGenerator)." -ForegroundColor Yellow
    } else {
        Write-Host "Repository count: $($filteredRepos.Count)" -ForegroundColor Green
        Write-Host ""

        foreach ($repo in $filteredRepos) {
            $visibility = if ($repo.private) { "Private" } else { "Public" }
            $stars = if ($repo.stargazers_count) { $repo.stargazers_count } else { 0 }
            $updated = if ($repo.updated_at) {
                try {
                    ([DateTime]$repo.updated_at).ToString("yyyy-MM-dd")
                } catch {
                    $repo.updated_at
                }
            } else { "N/A" }

            Write-Host "Repository: $($repo.name)" -ForegroundColor Cyan
            Write-Host "  URL: https://github.com/latona01/$($repo.name)" -ForegroundColor Gray
            Write-Host "  Visibility: $visibility | Stars: $stars | Updated: $updated" -ForegroundColor Gray
            Write-Host ""
        }

        # Show names only
        Write-Host "----------------------------------------" -ForegroundColor Gray
        Write-Host "Repository names only:" -ForegroundColor Yellow
        $filteredRepos | ForEach-Object { Write-Host $_.name }
    }
} catch {
    Write-Host "[Error] Failed to get repositories: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
    Write-Host "You may have hit GitHub API rate limit." -ForegroundColor Yellow
    Write-Host "Please wait and try again later." -ForegroundColor Yellow
}

Write-Host ""
Read-Host "Press Enter to exit"
