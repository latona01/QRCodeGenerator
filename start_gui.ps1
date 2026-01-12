# QRコード生成ツール - GUI版起動スクリプト
Write-Host "QRコード生成ツール - GUI版を起動しています..." -ForegroundColor Cyan

# Pythonがインストールされているか確認
try {
    $pythonVersion = python --version 2>&1
    Write-Host "Python: $pythonVersion" -ForegroundColor Green
} catch {
    Write-Host "エラー: Pythonがインストールされていません。" -ForegroundColor Red
    Write-Host "Python 3.7以上をインストールしてください。" -ForegroundColor Yellow
    Read-Host "Enterキーを押して終了"
    exit 1
}

# 必要なパッケージをインストール
Write-Host "必要なパッケージを確認しています..." -ForegroundColor Cyan
pip install -q -r requirements_gui.txt

# GUIアプリを起動
Write-Host "GUIアプリを起動しています..." -ForegroundColor Cyan
python qr_generator_gui.py

if ($LASTEXITCODE -ne 0) {
    Write-Host "`nエラーが発生しました。" -ForegroundColor Red
    Read-Host "Enterキーを押して終了"
}
