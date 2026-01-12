# GitHub Repository List Script (excluding QRCodeGenerator)

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "GitHub Repository List (excluding QRCodeGenerator)" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Repository list (excluding QRCodeGenerator)
$repos = @(
    "latona01/nextjs-boilerplate",
    "latona01/VEIL-ORANGE",
    "latona01/x001uw9w9"
)

Write-Host "Repository count: $($repos.Count)" -ForegroundColor Green
Write-Host ""

foreach ($repo in $repos) {
    $repoName = $repo -replace "latona01/", ""
    Write-Host "Repository: $repoName" -ForegroundColor Cyan
    Write-Host "  Full name: $repo" -ForegroundColor Gray
    Write-Host "  URL: https://github.com/$repo" -ForegroundColor Gray
    Write-Host ""
}

Write-Host "----------------------------------------" -ForegroundColor Gray
Write-Host "Repository names only (excluding QRCodeGenerator):" -ForegroundColor Yellow
$repos | ForEach-Object {
    $repoName = $_ -replace "latona01/", ""
    Write-Host $repoName
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Summary" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Total repositories (excluding QRCodeGenerator): $($repos.Count)" -ForegroundColor Green
Write-Host ""
Write-Host "Repositories:" -ForegroundColor Yellow
$repos | ForEach-Object {
    $repoName = $_ -replace "latona01/", ""
    Write-Host "  - $repoName" -ForegroundColor White
}

Write-Host ""
Read-Host "Press Enter to exit"
