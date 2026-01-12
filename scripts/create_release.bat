@echo off
chcp 65001 >nul
echo ========================================
echo GitHubリリース作成スクリプト
echo ========================================
echo.

REM GitHub CLIがインストールされているか確認
gh --version >nul 2>&1
if errorlevel 1 (
    echo [情報] GitHub CLIがインストールされていません。
    echo.
    echo 方法1: GitHub CLIを使用（推奨）
    echo   install_gh_cli.bat を実行してGitHub CLIをインストール
    echo   その後、このスクリプトを再実行
    echo.
    echo 方法2: 手動でリリースを作成
    echo   ブラウザで以下にアクセス:
    echo   https://github.com/latona01/QRCodeGenerator/releases/new
    echo.
    pause
    exit /b 0
)

echo リリースバージョンを入力してください（例: v1.0.0）
set /p VERSION="バージョン: "
if "%VERSION%"=="" set VERSION=v1.0.0

echo.
echo リリースタイトルを入力してください（Enterでデフォルト）
set /p TITLE="タイトル: "
if "%TITLE%"=="" set TITLE=QRコード生成ツール %VERSION%

echo.
echo リリースノートを入力してください（Enterでデフォルト）
set /p NOTES="リリースノート: "
if "%NOTES%"=="" (
    set NOTES=初回リリース: QRコード生成ツール
    echo デフォルトのリリースノートを使用します
)

echo.
echo リリースを作成しています...
gh release create %VERSION% --title "%TITLE%" --notes "%NOTES%"

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
pause
