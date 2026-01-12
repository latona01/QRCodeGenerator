# GitHub Repository Deletion Script using API
# This script uses GitHub API to delete repositories

Write-Host "========================================" -ForegroundColor Red
Write-Host "GitHub Repository Deletion (API Method)" -ForegroundColor Red
Write-Host "========================================" -ForegroundColor Red
Write-Host ""

$reposToDelete = @(
    "nextjs-boilerplate",
    "VEIL-ORANGE",
    "x001uw9w9"
)

Write-Host "Repositories to delete:" -ForegroundColor Yellow
foreach ($repo in $reposToDelete) {
    Write-Host "  - latona01/$repo" -ForegroundColor Red
}

Write-Host ""
Write-Host "This requires a GitHub Personal Access Token with 'delete_repo' scope." -ForegroundColor Yellow
Write-Host ""

# Get token
$token = Read-Host "Enter your GitHub Personal Access Token (or press Enter to skip)"

if ([string]::IsNullOrWhiteSpace($token)) {
    Write-Host ""
    Write-Host "Token not provided. Skipping API deletion." -ForegroundColor Yellow
    Write-Host ""
    Write-Host "To create a token:" -ForegroundColor Cyan
    Write-Host "  1. Go to: https://github.com/settings/tokens" -ForegroundColor White
    Write-Host "  2. Generate new token (classic)" -ForegroundColor White
    Write-Host "  3. Select 'delete_repo' scope" -ForegroundColor White
    Write-Host "  4. Copy the token and run this script again" -ForegroundColor White
    Write-Host ""
    Read-Host "Press Enter to exit"
    exit 0
}

Write-Host ""
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
Write-Host "Deleting repositories via API..." -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

$headers = @{
    "Authorization" = "token $token"
    "Accept" = "application/vnd.github.v3+json"
}

foreach ($repo in $reposToDelete) {
    Write-Host "Deleting latona01/$repo..." -ForegroundColor Yellow

    try {
        $response = Invoke-RestMethod -Uri "https://api.github.com/repos/latona01/$repo" `
            -Method Delete `
            -Headers $headers `
            -ErrorAction Stop

        Write-Host "  [✓] Successfully deleted latona01/$repo" -ForegroundColor Green
    } catch {
        if ($_.Exception.Response.StatusCode -eq 204) {
            Write-Host "  [✓] Successfully deleted latona01/$repo" -ForegroundColor Green
        } else {
            Write-Host "  [✗] Failed to delete latona01/$repo" -ForegroundColor Red
            Write-Host "      Error: $($_.Exception.Message)" -ForegroundColor Red
        }
    }
    Write-Host ""
}

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Deletion process completed" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Read-Host "Press Enter to exit"
