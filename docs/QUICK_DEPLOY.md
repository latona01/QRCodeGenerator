# 🚀 クイックデプロイガイド

noteで共有するために、最短5分でオンライン公開する方法です。

## ステップ1: GitHubでリポジトリを作成（2分）

1. https://github.com/new にアクセス
2. リポジトリ名を入力（例: `qr-code-generator`）
3. **Public** を選択（重要！）
4. 「Create repository」をクリック

## ステップ2: ファイルをアップロード（2分）

### 方法A: GitHub Webインターフェース

1. 作成したリポジトリのページで「uploading an existing file」をクリック
2. 以下のファイルをドラッグ&ドロップ：
   - `index.html`
   - `.nojekyll`
3. 「Commit changes」をクリック

### 方法B: コマンドライン（推奨）

```bash
# このフォルダで実行
deploy_to_github.bat  # または deploy_to_github.ps1

# その後、表示される指示に従ってコマンドを実行
git commit -m "Initial commit: QR Code Generator"
git branch -M main
git remote add origin https://github.com/[ユーザー名]/[リポジトリ名].git
git push -u origin main
```

## ステップ3: GitHub Pagesを有効化（1分）

1. リポジトリの「Settings」タブをクリック
2. 左メニューから「Pages」を選択
3. Source: `Deploy from a branch` を選択
4. Branch: `main`、Folder: `/ (root)` を選択
5. 「Save」をクリック

## ステップ4: URLを確認

数分待つと、以下のURLでアクセス可能になります：

```
https://[ユーザー名].github.io/[リポジトリ名]/
```

例: `https://username.github.io/qr-code-generator/`

## ステップ5: noteで共有

1. `NOTE_TEMPLATE.md` を開く
2. 内容をコピー
3. noteの記事エディタに貼り付け
4. `[あなたのGitHub Pages URL]` の部分を実際のURLに置き換え
5. 公開！

## ✅ 完了！

これで、誰でもあなたのQRコード生成ツールを使えるようになりました！

---

## 💡 ヒント

- URLは数分かかる場合があります（最大10分程度）
- リポジトリを更新すると、自動的にサイトも更新されます
- カスタムドメインも設定可能です（Settings → Pages → Custom domain）
