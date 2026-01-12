@echo off
chcp 65001 >nul
echo QRコード生成ツール - GUI版を起動しています...

REM Pythonがインストールされているか確認
python --version >nul 2>&1
if errorlevel 1 (
    echo エラー: Pythonがインストールされていません。
    echo Python 3.7以上をインストールしてください。
    pause
    exit /b 1
)

REM 必要なパッケージをインストール
echo 必要なパッケージを確認しています...
pip install -q -r requirements_gui.txt

REM GUIアプリを起動
python qr_generator_gui.py

if errorlevel 1 (
    echo.
    echo エラーが発生しました。
    pause
)
