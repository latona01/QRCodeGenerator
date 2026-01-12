@echo off
chcp 65001 >nul
echo ========================================
echo GitHub CLI インストールスクリプト
echo ========================================
echo.

REM wingetでインストールを試みる
echo [1/2] wingetでGitHub CLIをインストール中...
winget install --id GitHub.cli 2>nul
if errorlevel 1 (
    echo wingetでのインストールに失敗しました。
    echo.
    echo [2/2] 手動インストールが必要です。
    echo.
    echo 以下の手順でインストールしてください:
    echo 1. https://cli.github.com/ にアクセス
    echo 2. Windows用インストーラーをダウンロード
    echo 3. インストーラーを実行
    echo 4. インストール後、このスクリプトを再実行
    echo.
    pause
    exit /b 1
) else (
    echo [✓] GitHub CLIのインストールが完了しました！
    echo.
    echo 次に認証を行います...
    echo.
    gh auth login
    echo.
    echo 認証が完了したら、create_repo_auto.bat を実行してください。
    pause
)
