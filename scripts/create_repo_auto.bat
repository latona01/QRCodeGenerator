@echo off
chcp 65001 >nul
echo ========================================
echo GitHubリポジトリ自動作成スクリプト
echo ========================================
echo.

REM GitHub CLIがインストールされているか確認
gh --version >nul 2>&1
if errorlevel 1 (
    echo [エラー] GitHub CLIがインストールされていません。
    echo install_gh_cli.bat を実行してインストールしてください。
    pause
    exit /b 1
)

REM 認証状態を確認
gh auth status >nul 2>&1
if errorlevel 1 (
    echo [警告] GitHubにログインしていません。
    echo 認証を行います...
    gh auth login
)

echo.
echo リポジトリ名を入力してください（Enterでデフォルト: qr-code-generator）
set /p REPO_NAME="リポジトリ名: "
if "%REPO_NAME%"=="" set REPO_NAME=qr-code-generator

echo.
echo リポジトリを作成しています...
echo リポジトリ名: %REPO_NAME%
echo.

REM リポジトリを作成
gh repo create %REPO_NAME% --public --source=. --remote=origin --push

if errorlevel 1 (
    echo.
    echo [エラー] リポジトリの作成に失敗しました。
    echo 既に同名のリポジトリが存在する可能性があります。
    pause
    exit /b 1
)

echo.
echo ========================================
echo [✓] リポジトリの作成が完了しました！
echo ========================================
echo.
echo リポジトリURL: https://github.com/latona01/%REPO_NAME%
echo.
echo 次にGitHub Pagesを有効化してください:
echo 1. 上記のURLにアクセス
echo 2. Settings → Pages
echo 3. Source: Deploy from a branch
echo 4. Branch: main, Folder: / (root)
echo 5. Save をクリック
echo.
echo 数分後、以下のURLでアクセス可能になります:
echo https://latona01.github.io/%REPO_NAME%/
echo.
pause
