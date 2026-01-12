@echo off
chcp 65001 >nul
echo ========================================
echo QRコード生成ツール - EXEビルドスクリプト
echo ========================================
echo.

REM Pythonがインストールされているか確認
python --version >nul 2>&1
if errorlevel 1 (
    echo [エラー] Pythonがインストールされていません。
    echo Python 3.7以上をインストールしてください。
    pause
    exit /b 1
)

echo [1/4] 必要なパッケージをインストール中...
pip install -q -r requirements_gui.txt

if errorlevel 1 (
    echo [エラー] パッケージのインストールに失敗しました。
    pause
    exit /b 1
)

echo [✓] パッケージのインストールが完了しました
echo.

echo [2/4] ビルドディレクトリをクリーンアップ中...
if exist build rmdir /s /q build
if exist dist rmdir /s /q dist
echo [✓] クリーンアップ完了
echo.

echo [3/4] EXEファイルをビルド中...
pyinstaller QRCodeGenerator.spec --clean --noconfirm

if errorlevel 1 (
    echo [エラー] ビルドに失敗しました。
    pause
    exit /b 1
)

echo [✓] ビルドが完了しました
echo.

echo [4/4] ビルド結果を確認中...
if exist dist\QRCodeGenerator.exe (
    echo [✓] EXEファイルが正常に作成されました
    echo.
    echo ビルド結果:
    echo   - dist\QRCodeGenerator.exe
    echo.
    echo ファイルサイズ:
    dir dist\QRCodeGenerator.exe | findstr QRCodeGenerator.exe
) else (
    echo [警告] EXEファイルが見つかりません
)

echo.
echo ========================================
echo ビルド完了！
echo ========================================
echo.
echo 次のステップ:
echo 1. dist\QRCodeGenerator.exe を確認
echo 2. GitHub Releasesにアップロード
echo    - scripts\create_release.bat を実行
echo    - または GitHub Webインターフェースから
echo.
pause
