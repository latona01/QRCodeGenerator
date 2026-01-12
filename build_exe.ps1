# QRコード生成ツール - EXEビルドスクリプト (PowerShell)

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "QRコード生成ツール - EXEビルドスクリプト" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Pythonがインストールされているか確認
try {
    $pythonVersion = python --version 2>&1
    Write-Host "[✓] Python: $pythonVersion" -ForegroundColor Green
} catch {
    Write-Host "[エラー] Pythonがインストールされていません。" -ForegroundColor Red
    Write-Host "Python 3.7以上をインストールしてください。" -ForegroundColor Yellow
    Read-Host "Enterキーを押して終了"
    exit 1
}

Write-Host "[1/4] 必要なパッケージをインストール中..." -ForegroundColor Cyan
pip install -q -r requirements_gui.txt

if ($LASTEXITCODE -ne 0) {
    Write-Host "[エラー] パッケージのインストールに失敗しました。" -ForegroundColor Red
    Read-Host "Enterキーを押して終了"
    exit 1
}

Write-Host "[✓] パッケージのインストールが完了しました" -ForegroundColor Green
Write-Host ""

Write-Host "[2/4] ビルドディレクトリをクリーンアップ中..." -ForegroundColor Cyan
if (Test-Path "build") { Remove-Item -Recurse -Force "build" }
if (Test-Path "dist") { Remove-Item -Recurse -Force "dist" }
Write-Host "[✓] クリーンアップ完了" -ForegroundColor Green
Write-Host ""

Write-Host "[3/4] EXEファイルをビルド中..." -ForegroundColor Cyan
pyinstaller QRCodeGenerator.spec --clean --noconfirm

if ($LASTEXITCODE -ne 0) {
    Write-Host "[エラー] ビルドに失敗しました。" -ForegroundColor Red
    Read-Host "Enterキーを押して終了"
    exit 1
}

Write-Host "[✓] ビルドが完了しました" -ForegroundColor Green
Write-Host ""

Write-Host "[4/4] ビルド結果を確認中..." -ForegroundColor Cyan
if (Test-Path "dist\QRCodeGenerator.exe") {
    Write-Host "[✓] EXEファイルが正常に作成されました" -ForegroundColor Green
    Write-Host ""
    Write-Host "ビルド結果:" -ForegroundColor Yellow
    Write-Host "  - dist\QRCodeGenerator.exe" -ForegroundColor White
    Write-Host ""
    
    $fileInfo = Get-Item "dist\QRCodeGenerator.exe"
    $fileSizeMB = [math]::Round($fileInfo.Length / 1MB, 2)
    Write-Host "ファイルサイズ: $fileSizeMB MB" -ForegroundColor Cyan
} else {
    Write-Host "[警告] EXEファイルが見つかりません" -ForegroundColor Yellow
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "ビルド完了！" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "次のステップ:" -ForegroundColor Yellow
Write-Host "1. dist\QRCodeGenerator.exe を確認" -ForegroundColor White
Write-Host "2. GitHub Releasesにアップロード" -ForegroundColor White
Write-Host "   - scripts\create_release.bat を実行" -ForegroundColor Gray
Write-Host "   - または GitHub Webインターフェースから" -ForegroundColor Gray
Write-Host ""
Read-Host "Enterキーを押して終了"
