# GitHub Release Creation Script with EXE Attachment

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "GitHubリリース作成スクリプト（EXE添付版）" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# EXEファイルの存在確認
if (-not (Test-Path "dist\QRCodeGenerator.exe")) {
    Write-Host "[警告] EXEファイルが見つかりません: dist\QRCodeGenerator.exe" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "先にビルドを実行してください:" -ForegroundColor Yellow
    Write-Host "  build_exe.bat" -ForegroundColor White
    Write-Host ""
    Read-Host "Enterキーを押して終了"
    exit 1
}

# GitHub CLIがインストールされているか確認
try {
    $null = gh --version 2>&1
} catch {
    Write-Host "[情報] GitHub CLIがインストールされていません。" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "方法1: GitHub CLIを使用（推奨）" -ForegroundColor Cyan
    Write-Host "  scripts\install_gh_cli.bat を実行してGitHub CLIをインストール" -ForegroundColor White
    Write-Host "  その後、このスクリプトを再実行" -ForegroundColor White
    Write-Host ""
    Write-Host "方法2: 手動でリリースを作成" -ForegroundColor Cyan
    Write-Host "  ブラウザで以下にアクセス:" -ForegroundColor White
    Write-Host "  https://github.com/latona01/QRCodeGenerator/releases/new" -ForegroundColor Gray
    Write-Host "  EXEファイル: dist\QRCodeGenerator.exe をアップロード" -ForegroundColor Gray
    Write-Host ""
    Read-Host "Enterキーを押して終了"
    exit 0
}

$version = Read-Host "リリースバージョンを入力してください（例: v1.0.1）"
if ([string]::IsNullOrWhiteSpace($version)) {
    $version = "v1.0.1"
}

Write-Host ""
$title = Read-Host "リリースタイトルを入力してください（Enterでデフォルト）"
if ([string]::IsNullOrWhiteSpace($title)) {
    $title = "QRコード生成ツール $version"
}

Write-Host ""
$notes = Read-Host "リリースノートを入力してください（Enterでデフォルト）"
if ([string]::IsNullOrWhiteSpace($notes)) {
    $notes = "QRコード生成ツール $version リリース"
    Write-Host "デフォルトのリリースノートを使用します" -ForegroundColor Gray
}

Write-Host ""
Write-Host "EXEファイルを添付してリリースを作成しています..." -ForegroundColor Cyan
gh release create $version --title "$title" --notes "$notes" "dist\QRCodeGenerator.exe"

if ($LASTEXITCODE -ne 0) {
    Write-Host ""
    Write-Host "[エラー] リリースの作成に失敗しました。" -ForegroundColor Red
    Write-Host "タグが既に存在する場合は、先に削除してください:" -ForegroundColor Yellow
    Write-Host "  git tag -d $version" -ForegroundColor White
    Write-Host "  git push origin :refs/tags/$version" -ForegroundColor White
    Read-Host "Enterキーを押して終了"
    exit 1
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "[✓] リリースが作成されました！" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "リリースURL: https://github.com/latona01/QRCodeGenerator/releases/tag/$version" -ForegroundColor Cyan
Write-Host ""
Write-Host "EXEファイルがリリースに添付されました。" -ForegroundColor Green
Write-Host ""
Read-Host "Enterキーを押して終了"
