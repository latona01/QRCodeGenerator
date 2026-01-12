@echo off
chcp 65001 >nul
echo ========================================
echo GitHubリポジトリ接続スクリプト
echo ========================================
echo.

echo リポジトリ名を入力してください（Enterでデフォルト: qr-code-generator）
set /p REPO_NAME="リポジトリ名: "
if "%REPO_NAME%"=="" set REPO_NAME=qr-code-generator

echo.
echo リモートリポジトリを追加しています...
git remote add origin https://github.com/latona01/%REPO_NAME%.git

if errorlevel 1 (
    echo.
    echo [警告] リモートが既に存在する可能性があります。
    echo 既存のリモートを削除して再追加しますか？ (Y/N)
    set /p CONFIRM="> "
    if /i "%CONFIRM%"=="Y" (
        git remote remove origin
        git remote add origin https://github.com/latona01/%REPO_NAME%.git
    ) else (
        echo キャンセルしました。
        pause
        exit /b 1
    )
)

echo.
echo ファイルをプッシュしています...
git push -u origin main

if errorlevel 1 (
    echo.
    echo [エラー] プッシュに失敗しました。
    echo GitHubでリポジトリが作成されているか確認してください。
    pause
    exit /b 1
)

echo.
echo ========================================
echo [✓] リポジトリへの接続が完了しました！
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
