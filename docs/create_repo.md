# GitHubリポジトリ作成ガイド

## 方法1: Webブラウザで作成（推奨・簡単）

### ステップ1: GitHubにアクセス
1. https://github.com/new を開く
2. GitHubにログイン（latona01 アカウント）

### ステップ2: リポジトリ情報を入力
- **Repository name**: `qr-code-generator` （またはお好みの名前）
- **Description**: `無料で使えるQRコード生成ツール - インストール不要`
- **Public** を選択（重要！GitHub Pagesを使うため）
- **Initialize this repository with** のチェックは全て外す（既にローカルにファイルがあるため）

### ステップ3: リポジトリを作成
「Create repository」ボタンをクリック

### ステップ4: ローカルリポジトリを接続
GitHubで表示されるコマンドの代わりに、以下を実行：

```bash
cd C:\Users\ryo11\Desktop\Boost\QRCodeGenerator
git remote add origin https://github.com/latona01/qr-code-generator.git
git branch -M main
git push -u origin main
```

## 方法2: GitHub CLIで作成（自動化）

GitHub CLIをインストールすれば、コマンドで作成できます。

### GitHub CLIのインストール
1. https://cli.github.com/ にアクセス
2. Windows用インストーラーをダウンロード
3. インストール後、以下で認証：
   ```bash
   gh auth login
   ```

### リポジトリ作成コマンド
```bash
cd C:\Users\ryo11\Desktop\Boost\QRCodeGenerator
gh repo create qr-code-generator --public --source=. --remote=origin --push
```

## リポジトリ作成後の設定

### GitHub Pagesを有効化
1. リポジトリの「Settings」タブ
2. 左メニューから「Pages」
3. Source: `Deploy from a branch`
4. Branch: `main`、Folder: `/ (root)`
5. 「Save」をクリック

### 公開URL
数分後、以下のURLでアクセス可能になります：
```
https://latona01.github.io/qr-code-generator/
```
