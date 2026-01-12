# GitHub Repository Deletion Script
# This script will delete all repositories except QRCodeGenerator

Write-Host "========================================" -ForegroundColor Red
Write-Host "GitHub Repository Deletion Script" -ForegroundColor Red
Write-Host "========================================" -ForegroundColor Red
Write-Host ""
Write-Host "WARNING: This will DELETE the following repositories:" -ForegroundColor Yellow
Write-Host ""

$reposToDelete = @(
    "latona01/nextjs-boilerplate",
    "latona01/VEIL-ORANGE",
    "latona01/x001uw9w9"
)

foreach ($repo in $reposToDelete) {
    Write-Host "  - $repo" -ForegroundColor Red
}

Write-Host ""
Write-Host "The following repository will be KEPT:" -ForegroundColor Green
Write-Host "  - latona01/QRCodeGenerator" -ForegroundColor Green
Write-Host ""

# Confirmation
Write-Host "Are you sure you want to delete these repositories?" -ForegroundColor Yellow
Write-Host "This action CANNOT be undone!" -ForegroundColor Red
Write-Host ""
$confirm = Read-Host "Type 'DELETE' to confirm"

if ($confirm -ne "DELETE") {
    Write-Host ""
    Write-Host "Deletion cancelled." -ForegroundColor Green
    Read-Host "Press Enter to exit"
    exit 0
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Deleting repositories..." -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Check if GitHub CLI is available
$ghAvailable = $false
try {
    $null = gh --version 2>&1
    $ghAvailable = $true
} catch {
    $ghAvailable = $false
}

if ($ghAvailable) {
    Write-Host "Using GitHub CLI..." -ForegroundColor Cyan
    Write-Host ""

    foreach ($repo in $reposToDelete) {
        Write-Host "Deleting $repo..." -ForegroundColor Yellow
        gh repo delete $repo --yes

        if ($LASTEXITCODE -eq 0) {
            Write-Host "  [✓] Successfully deleted $repo" -ForegroundColor Green
        } else {
            Write-Host "  [✗] Failed to delete $repo" -ForegroundColor Red
        }
        Write-Host ""
    }
} else {
    Write-Host "GitHub CLI is not available." -ForegroundColor Yellow
    Write-Host ""
    Write-Host "Please use one of the following methods:" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "Method 1: GitHub CLI (Recommended)" -ForegroundColor Yellow
    Write-Host "  1. Install GitHub CLI: https://cli.github.com/" -ForegroundColor White
    Write-Host "  2. Run: gh auth login" -ForegroundColor White
    Write-Host "  3. Run this script again" -ForegroundColor White
    Write-Host ""
    Write-Host "Method 2: Manual deletion via GitHub Web" -ForegroundColor Yellow
    foreach ($repo in $reposToDelete) {
        $repoName = $repo -replace "latona01/", ""
        Write-Host "  - $repo" -ForegroundColor White
        Write-Host "    URL: https://github.com/$repo/settings" -ForegroundColor Gray
        Write-Host "    Go to Settings → Danger Zone → Delete this repository" -ForegroundColor Gray
        Write-Host ""
    }
    Write-Host ""
    Write-Host "Method 3: GitHub API (requires personal access token)" -ForegroundColor Yellow
    Write-Host "  See delete_repos_api.ps1 for API-based deletion" -ForegroundColor White
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Deletion process completed" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Read-Host "Press Enter to exit"
