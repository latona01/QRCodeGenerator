@echo off
chcp 65001 >nul
echo ========================================
echo GitHub Pages 修正スクリプト
echo ========================================
echo.

echo [1/4] ブランチ名を確認...
git branch
echo.

echo [2/4] リモートリポジトリを確認...
git remote -v
echo.

echo [3/4] .nojekyllファイルを確認...
if exist .nojekyll (
    echo [✓] .nojekyllファイルは存在します
) else (
    echo [警告] .nojekyllファイルが見つかりません。作成します...
    echo. > .nojekyll
    git add .nojekyll
    git commit -m "Add .nojekyll for GitHub Pages"
    echo [✓] .nojekyllファイルを作成しました
)
echo.

echo [4/4] index.htmlを確認...
if exist index.html (
    echo [✓] index.htmlは存在します
) else (
    echo [エラー] index.htmlが見つかりません！
    pause
    exit /b 1
)
echo.

echo ========================================
echo 確認完了
echo ========================================
echo.
echo 次のステップ:
echo.
echo 1. GitHubでリポジトリの Settings → Pages を開く
echo 2. Source: Deploy from a branch を選択
echo 3. Branch: main (または master) を選択
echo 4. Folder: / (root) を選択
echo 5. Save をクリック
echo.
echo 数分待つと、以下のURLでアクセス可能になります:
echo https://latona01.github.io/[リポジトリ名]/
echo.
echo 詳細は FIX_PAGES.md を参照してください。
echo.
pause
