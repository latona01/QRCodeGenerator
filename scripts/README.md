# 🛠️ スクリプト

このディレクトリには、開発・デプロイ・管理用のスクリプトが含まれています。

## 📋 スクリプト一覧

### 🚀 デプロイ関連

- **deploy_to_github.bat** / **deploy_to_github.ps1** - GitHub Pagesデプロイ支援スクリプト
- **connect_repo.bat** - GitHubリポジトリ接続スクリプト
- **fix_pages.bat** - GitHub Pages修正スクリプト

### 📦 リポジトリ管理

- **check_and_create_repo.bat** - リポジトリ確認・作成ガイド
- **create_repo_auto.bat** - リポジトリ自動作成スクリプト
- **create_release.bat** - GitHubリリース作成スクリプト

### 🔧 ツール・ユーティリティ

- **install_gh_cli.bat** - GitHub CLIインストールスクリプト
- **list_repos.ps1** / **list_all_repos.ps1** - リポジトリ一覧表示スクリプト
- **delete_repos.ps1** / **delete_repos_api.ps1** - リポジトリ削除スクリプト

## ⚠️ 注意事項

これらのスクリプトは開発・管理用です。通常の使用には不要です。

通常の使用には、ルートディレクトリの以下のスクリプトを使用してください：
- `start.bat` / `start.ps1` - Web版起動
- `start_gui.bat` / `start_gui.ps1` - GUI版起動
