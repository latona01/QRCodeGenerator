# 🔧 GitHub Pages エラー修正ガイド

「There isn't a GitHub Pages site here.」というエラーが表示される場合の対処法です。

## ✅ 確認事項

### 1. リポジトリがPublicか確認
- GitHub Pagesは**Publicリポジトリ**でのみ無料で利用できます
- Privateリポジトリの場合は有料プランが必要です

### 2. GitHub Pagesの設定を確認

1. リポジトリのページで「**Settings**」タブをクリック
2. 左メニューから「**Pages**」を選択
3. 以下の設定を確認：

   **Source**: `Deploy from a branch` を選択
   - **Branch**: `main`（または`master`）を選択
   - **Folder**: `/ (root)` を選択
   - 「**Save**」をクリック

### 3. ブランチ名を確認

ローカルのブランチ名が `main` か `master` か確認：

```bash
cd C:\Users\ryo11\Desktop\Boost\QRCodeGenerator
git branch
```

- `main` ブランチの場合: GitHub Pagesの設定で `main` を選択
- `master` ブランチの場合: GitHub Pagesの設定で `master` を選択

### 4. ファイルが正しくプッシュされているか確認

リポジトリのページで以下を確認：
- `index.html` が存在するか
- `.nojekyll` ファイルが存在するか（重要！）

### 5. 数分待つ

GitHub Pagesのデプロイには**数分から最大10分**かかることがあります。
- 設定後、5-10分待ってから再度アクセス
- リポジトリの「Actions」タブでデプロイの進行状況を確認可能

## 🔄 再設定手順

### ステップ1: ブランチ名を確認・統一

```bash
cd C:\Users\ryo11\Desktop\Boost\QRCodeGenerator
git branch
```

`master` ブランチの場合は `main` に変更：

```bash
git branch -M main
git push -u origin main
```

### ステップ2: 必要なファイルを確認

`.nojekyll` ファイルが存在するか確認：

```bash
dir .nojekyll
```

存在しない場合は作成：

```bash
echo. > .nojekyll
git add .nojekyll
git commit -m "Add .nojekyll for GitHub Pages"
git push
```

### ステップ3: GitHub Pagesを再設定

1. リポジトリの「Settings」→「Pages」
2. Source を一度「None」に変更して「Save」
3. 再度「Deploy from a branch」を選択
4. Branch: `main`（または`master`）、Folder: `/ (root)`
5. 「Save」をクリック

### ステップ4: デプロイを待つ

- 5-10分待つ
- 「Actions」タブでデプロイの進行状況を確認

## 🐛 よくある問題

### 問題1: 404エラーが表示される

**原因**: `index.html` がルートディレクトリにない

**解決策**:
```bash
# index.htmlが正しい場所にあるか確認
git ls-files | grep index.html
```

### 問題2: Jekyllのエラーが表示される

**原因**: `.nojekyll` ファイルがない

**解決策**:
```bash
echo. > .nojekyll
git add .nojekyll
git commit -m "Add .nojekyll"
git push
```

### 問題3: ブランチが見つからない

**原因**: ブランチ名が一致していない

**解決策**:
- ローカルのブランチ名を確認: `git branch`
- GitHub Pagesの設定で同じブランチ名を選択

## 📞 それでも解決しない場合

1. **リポジトリのURLを確認**:
   ```
   https://github.com/latona01/[リポジトリ名]
   ```

2. **GitHub PagesのURLを確認**:
   ```
   https://latona01.github.io/[リポジトリ名]/
   ```
   注意: リポジトリ名に大文字が含まれる場合は小文字になります

3. **GitHubのドキュメントを確認**:
   https://docs.github.com/ja/pages/getting-started-with-github-pages

4. **リポジトリを再作成**:
   - 新しいリポジトリを作成
   - ファイルを再度プッシュ
