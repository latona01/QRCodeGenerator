# Repository Organization Script

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "QRCodeGenerator Repository Organization" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Create directories
Write-Host "Creating directories..." -ForegroundColor Yellow
New-Item -ItemType Directory -Force -Path "scripts" | Out-Null
New-Item -ItemType Directory -Force -Path "docs" | Out-Null
Write-Host "[✓] Directories created" -ForegroundColor Green
Write-Host ""

# Move scripts
Write-Host "Moving scripts..." -ForegroundColor Yellow
$scripts = @(
    "check_and_create_repo.bat",
    "connect_repo.bat",
    "create_release.bat",
    "create_repo_auto.bat",
    "delete_repos.ps1",
    "delete_repos_api.ps1",
    "deploy_to_github.bat",
    "deploy_to_github.ps1",
    "fix_pages.bat",
    "install_gh_cli.bat",
    "list_all_repos.ps1",
    "list_repos.ps1"
)

foreach ($script in $scripts) {
    if (Test-Path $script) {
        Move-Item -Path $script -Destination "scripts\" -Force
        Write-Host "  [✓] Moved $script" -ForegroundColor Gray
    }
}
Write-Host "[✓] Scripts moved" -ForegroundColor Green
Write-Host ""

# Move documentation
Write-Host "Moving documentation..." -ForegroundColor Yellow
$docs = @(
    "CREATE_RELEASE.md",
    "DELETE_REPOS.md",
    "DEPLOY.md",
    "ENABLE_PAGES.md",
    "FIX_PAGES.md",
    "SETUP_REPO.md",
    "create_repo.md",
    "NOTE_TEMPLATE.md",
    "QUICK_DEPLOY.md",
    "RELEASE_NOTES.md"
)

foreach ($doc in $docs) {
    if (Test-Path $doc) {
        Move-Item -Path $doc -Destination "docs\" -Force
        Write-Host "  [✓] Moved $doc" -ForegroundColor Gray
    }
}
Write-Host "[✓] Documentation moved" -ForegroundColor Green
Write-Host ""

# Update README references
Write-Host "Updating README..." -ForegroundColor Yellow
$readmeContent = Get-Content "README.md" -Raw -Encoding UTF8
$readmeContent = $readmeContent -replace "deploy_to_github\.bat", "scripts/deploy_to_github.bat"
$readmeContent = $readmeContent -replace '`DEPLOY\.md`', '`docs/DEPLOY.md`'
$readmeContent = $readmeContent -replace '`NOTE_TEMPLATE\.md`', '`docs/NOTE_TEMPLATE.md`'
Set-Content -Path "README.md" -Value $readmeContent -Encoding UTF8
Write-Host "[✓] README updated" -ForegroundColor Green
Write-Host ""

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Organization completed!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "New structure:" -ForegroundColor Yellow
Write-Host "  / (root)" -ForegroundColor White
Write-Host "    - index.html (Web version)" -ForegroundColor Gray
Write-Host "    - qr_generator_gui.py (GUI version)" -ForegroundColor Gray
Write-Host "    - start.bat, start.ps1 (Web launchers)" -ForegroundColor Gray
Write-Host "    - start_gui.bat, start_gui.ps1 (GUI launchers)" -ForegroundColor Gray
Write-Host "    - README.md" -ForegroundColor Gray
Write-Host "    - requirements_gui.txt" -ForegroundColor Gray
Write-Host "    - .gitignore" -ForegroundColor Gray
Write-Host "    - .nojekyll" -ForegroundColor Gray
Write-Host "  /scripts (Development scripts)" -ForegroundColor White
Write-Host "  /docs (Documentation)" -ForegroundColor White
Write-Host ""
Read-Host "Press Enter to exit"
