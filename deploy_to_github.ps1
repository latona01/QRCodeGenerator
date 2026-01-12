# GitHub Pages デプロイ支援スクリプト
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "GitHub Pages デプロイ支援スクリプト" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Gitがインストールされているか確認
try {
    $gitVersion = git --version 2>&1
    Write-Host "[✓] Git: $gitVersion" -ForegroundColor Green
} catch {
    Write-Host "[エラー] Gitがインストールされていません。" -ForegroundColor Red
    Write-Host "Gitをインストールしてください: https://git-scm.com/" -ForegroundColor Yellow
    Read-Host "Enterキーを押して終了"
    exit 1
}

Write-Host "[1/4] Gitリポジトリの初期化を確認..." -ForegroundColor Cyan
if (-not (Test-Path .git)) {
    Write-Host "Gitリポジトリを初期化しています..." -ForegroundColor Yellow
    git init | Out-Null
    Write-Host "[✓] Gitリポジトリを初期化しました。" -ForegroundColor Green
} else {
    Write-Host "[✓] Gitリポジトリは既に初期化されています。" -ForegroundColor Green
}

Write-Host ""
Write-Host "[2/4] 必要なファイルを確認..." -ForegroundColor Cyan
if (-not (Test-Path index.html)) {
    Write-Host "[エラー] index.html が見つかりません。" -ForegroundColor Red
    Read-Host "Enterキーを押して終了"
    exit 1
}

if (-not (Test-Path .nojekyll)) {
    Write-Host ".nojekyll ファイルを作成しています..." -ForegroundColor Yellow
    "" | Out-File -FilePath .nojekyll -Encoding UTF8
    Write-Host "[✓] .nojekyll ファイルを作成しました。" -ForegroundColor Green
}

Write-Host ""
Write-Host "[3/4] ファイルをステージング..." -ForegroundColor Cyan
git add index.html .nojekyll
Write-Host "[✓] ファイルをステージングしました。" -ForegroundColor Green

Write-Host ""
Write-Host "[4/4] 次のステップ:" -ForegroundColor Cyan
Write-Host ""
Write-Host "1. GitHubで新しいリポジトリを作成してください" -ForegroundColor Yellow
Write-Host "   例: https://github.com/new" -ForegroundColor Gray
Write-Host ""
Write-Host "2. 以下のコマンドを実行してください:" -ForegroundColor Yellow
Write-Host ""
Write-Host "   git commit -m 'Initial commit: QR Code Generator'" -ForegroundColor White
Write-Host "   git branch -M main" -ForegroundColor White
Write-Host "   git remote add origin https://github.com/[ユーザー名]/[リポジトリ名].git" -ForegroundColor White
Write-Host "   git push -u origin main" -ForegroundColor White
Write-Host ""
Write-Host "3. GitHubリポジトリの Settings → Pages で以下を設定:" -ForegroundColor Yellow
Write-Host "   - Source: Deploy from a branch" -ForegroundColor Gray
Write-Host "   - Branch: main, Folder: / (root)" -ForegroundColor Gray
Write-Host ""
Write-Host "4. 数分待つと、以下のURLでアクセス可能になります:" -ForegroundColor Yellow
Write-Host "   https://[ユーザー名].github.io/[リポジトリ名]/" -ForegroundColor White
Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "デプロイ準備が完了しました！" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Cyan
Read-Host "Enterキーを押して終了"
