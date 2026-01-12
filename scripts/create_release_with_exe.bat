@echo off
chcp 65001 >nul
echo ========================================
echo GitHubリリース作成スクリプト（EXE添付版）
echo ========================================
echo.

REM EXEファイルの存在確認
if not exist "dist\QRCodeGenerator.exe" (
    echo [警告] EXEファイルが見つかりません: dist\QRCodeGenerator.exe
    echo.
    echo 先にビルドを実行してください:
    echo   build_exe.bat
    echo.
    pause
    exit /b 1
)

REM GitHub CLIがインストールされているか確認
gh --version >nul 2>&1
if errorlevel 1 (
    echo [情報] GitHub CLIがインストールされていません。
    echo.
    echo 方法1: GitHub CLIを使用（推奨）
    echo   scripts\install_gh_cli.bat を実行してGitHub CLIをインストール
    echo   その後、このスクリプトを再実行
    echo.
    echo 方法2: 手動でリリースを作成
    echo   ブラウザで以下にアクセス:
    echo   https://github.com/latona01/QRCodeGenerator/releases/new
    echo   EXEファイル: dist\QRCodeGenerator.exe をアップロード
    echo.
    pause
    exit /b 0
)

echo リリースバージョンを入力してください（例: v1.0.1）
set /p VERSION="バージョン: "
if "%VERSION%"=="" set VERSION=v1.0.1

echo.
echo リリースタイトルを入力してください（Enterでデフォルト）
set /p TITLE="タイトル: "
if "%TITLE%"=="" set TITLE=QRコード生成ツール %VERSION%

echo.
echo リリースノートを入力してください（Enterでデフォルト）
set /p NOTES="リリースノート: "
if "%NOTES%"=="" (
    set NOTES=QRコード生成ツール %VERSION% リリース
    echo デフォルトのリリースノートを使用します
)

echo.
echo EXEファイルを添付してリリースを作成しています...
gh release create %VERSION% --title "%TITLE%" --notes "%NOTES%" "dist\QRCodeGenerator.exe"

if errorlevel 1 (
    echo.
    echo [エラー] リリースの作成に失敗しました。
    echo タグが既に存在する場合は、先に削除してください:
    echo   git tag -d %VERSION%
    echo   git push origin :refs/tags/%VERSION%
    pause
    exit /b 1
)

echo.
echo ========================================
echo [✓] リリースが作成されました！
echo ========================================
echo.
echo リリースURL: https://github.com/latona01/QRCodeGenerator/releases/tag/%VERSION%
echo.
echo EXEファイルがリリースに添付されました。
echo.
pause
