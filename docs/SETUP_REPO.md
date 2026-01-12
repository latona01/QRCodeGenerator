# 🚀 GitHubリポジトリ作成手順

## ✅ 準備完了

ローカルのファイルは既にコミット済みです。次にGitHubでリポジトリを作成します。

## 📝 手順

### ステップ1: GitHubでリポジトリを作成

1. **ブラウザで以下にアクセス**:
   ```
   https://github.com/new
   ```

2. **リポジトリ情報を入力**:
   - **Repository name**: `qr-code-generator` （またはお好みの名前）
   - **Description**: `無料で使えるQRコード生成ツール - インストール不要`
   - **Public** を選択 ✅（重要！GitHub Pagesを使うため）
   - **Initialize this repository with** のチェックは全て外す ✅
     - ✅ Add a README file（外す）
     - ✅ Add .gitignore（外す）
     - ✅ Choose a license（外す）

3. **「Create repository」ボタンをクリック**

### ステップ2: ローカルリポジトリを接続

GitHubでリポジトリを作成したら、以下のコマンドを実行してください：

```bash
cd C:\Users\ryo11\Desktop\Boost\QRCodeGenerator
git remote add origin https://github.com/latona01/qr-code-generator.git
git push -u origin main
```

**注意**: リポジトリ名が `qr-code-generator` 以外の場合は、URLを変更してください。

### ステップ3: GitHub Pagesを有効化

1. リポジトリのページで「**Settings**」タブをクリック
2. 左メニューから「**Pages**」を選択
3. **Source**: `Deploy from a branch` を選択
4. **Branch**: `main`、**Folder**: `/ (root)` を選択
5. 「**Save**」をクリック

### ステップ4: 公開URLを確認

数分待つと（最大10分程度）、以下のURLでアクセス可能になります：

```
https://latona01.github.io/qr-code-generator/
```

**注意**: リポジトリ名が異なる場合は、URLも変更されます。

## 🎉 完了！

これで、誰でもあなたのQRコード生成ツールを使えるようになりました！

noteで共有する場合は、`NOTE_TEMPLATE.md` を参考に記事を作成してください。
