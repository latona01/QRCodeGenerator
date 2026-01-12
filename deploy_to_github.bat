@echo off
chcp 65001 >nul
echo ========================================
echo GitHub Pages デプロイ支援スクリプト
echo ========================================
echo.

REM Gitがインストールされているか確認
git --version >nul 2>&1
if errorlevel 1 (
    echo [エラー] Gitがインストールされていません。
    echo Gitをインストールしてください: https://git-scm.com/
    pause
    exit /b 1
)

echo [1/4] Gitリポジトリの初期化を確認...
if not exist .git (
    echo Gitリポジトリを初期化しています...
    git init
    echo .nojekyll ファイルを作成しました。
) else (
    echo Gitリポジトリは既に初期化されています。
)

echo.
echo [2/4] 必要なファイルを確認...
if not exist index.html (
    echo [エラー] index.html が見つかりません。
    pause
    exit /b 1
)

if not exist .nojekyll (
    echo .nojekyll ファイルを作成しています...
    echo. > .nojekyll
)

echo.
echo [3/4] ファイルをステージング...
git add index.html .nojekyll

echo.
echo [4/4] 次のステップ:
echo.
echo 1. GitHubで新しいリポジトリを作成してください
echo    例: https://github.com/new
echo.
echo 2. 以下のコマンドを実行してください:
echo.
echo    git commit -m "Initial commit: QR Code Generator"
echo    git branch -M main
echo    git remote add origin https://github.com/[ユーザー名]/[リポジトリ名].git
echo    git push -u origin main
echo.
echo 3. GitHubリポジトリの Settings → Pages で以下を設定:
echo    - Source: Deploy from a branch
echo    - Branch: main, Folder: / (root)
echo.
echo 4. 数分待つと、以下のURLでアクセス可能になります:
echo    https://[ユーザー名].github.io/[リポジトリ名]/
echo.
echo ========================================
echo デプロイ準備が完了しました！
echo ========================================
pause
