# 🗑️ リポジトリ削除ガイド

QRCodeGenerator以外のリポジトリを削除する方法です。

## ⚠️ 警告

**この操作は取り消せません！** 削除する前に、必要なデータをバックアップしてください。

## 削除対象のリポジトリ

- `latona01/nextjs-boilerplate`
- `latona01/VEIL-ORANGE`
- `latona01/x001uw9w9`

## 削除方法

### 方法1: GitHub CLIを使用（推奨）

1. **GitHub CLIをインストール**（未インストールの場合）:
   ```bash
   install_gh_cli.bat
   ```

2. **認証**:
   ```bash
   gh auth login
   ```

3. **削除スクリプトを実行**:
   ```bash
   powershell -ExecutionPolicy Bypass -File delete_repos.ps1
   ```

4. **確認**: `DELETE` と入力して確認

### 方法2: GitHub Webインターフェース（手動）

各リポジトリの設定ページから削除：

1. **nextjs-boilerplate**:
   - https://github.com/latona01/nextjs-boilerplate/settings
   - Settings → Danger Zone → Delete this repository

2. **VEIL-ORANGE**:
   - https://github.com/latona01/VEIL-ORANGE/settings
   - Settings → Danger Zone → Delete this repository

3. **x001uw9w9**:
   - https://github.com/latona01/x001uw9w9/settings
   - Settings → Danger Zone → Delete this repository

### 方法3: GitHub APIを使用

1. **Personal Access Tokenを作成**:
   - https://github.com/settings/tokens
   - Generate new token (classic)
   - `delete_repo` スコープを選択

2. **スクリプトを実行**:
   ```bash
   powershell -ExecutionPolicy Bypass -File delete_repos_api.ps1
   ```

3. **トークンを入力**して確認

## ✅ 削除後の確認

削除後、以下のコマンドでリポジトリ一覧を確認：

```bash
powershell -ExecutionPolicy Bypass -File list_all_repos.ps1
```

残っているリポジトリは `latona01/QRCodeGenerator` のみであることを確認してください。

## 📝 注意事項

- 削除前に、必要なコードやデータをバックアップしてください
- フォークしたリポジトリの場合、元のリポジトリには影響しません
- 削除後、リポジトリ名は再利用可能になります（一定期間後）
