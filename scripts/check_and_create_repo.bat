@echo off
chcp 65001 >nul
echo ========================================
echo GitHubリポジトリ確認・作成ガイド
echo ========================================
echo.

echo [重要] このエラーは、GitHub上にリポジトリが存在しないことを示しています。
echo.

echo ========================================
echo 解決方法
echo ========================================
echo.

echo 方法1: GitHubでリポジトリを作成（推奨）
echo.
echo 1. 以下のURLにアクセスしてリポジトリを作成してください:
echo    https://github.com/new
echo.
echo 2. リポジトリ情報を入力:
echo    - Repository name: qr-code-generator (または任意の名前)
echo    - Description: 無料で使えるQRコード生成ツール
echo    - Public を選択 ✅
echo    - 「Initialize this repository with」のチェックは全て外す ✅
echo.
echo 3. 「Create repository」をクリック
echo.
echo 4. リポジトリ作成後、このスクリプトを再実行してください
echo.

echo ========================================
echo 方法2: リポジトリ名を変更する場合
echo ========================================
echo.
echo 既に別の名前でリポジトリを作成した場合:
echo.
set /p REPO_NAME="作成したリポジトリ名を入力してください: "

if not "%REPO_NAME%"=="" (
    echo.
    echo リモートリポジトリを更新しています...
    git remote remove origin 2>nul
    git remote add origin https://github.com/latona01/%REPO_NAME%.git
    echo.
    echo ファイルをプッシュしています...
    git push -u origin main

    if errorlevel 1 (
        echo.
        echo [エラー] プッシュに失敗しました。
        echo GitHubでリポジトリが正しく作成されているか確認してください。
    ) else (
        echo.
        echo ========================================
        echo [✓] プッシュが完了しました！
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
    )
) else (
    echo.
    echo リポジトリ名が入力されませんでした。
    echo 方法1に従って、GitHubでリポジトリを作成してください。
)

echo.
pause
