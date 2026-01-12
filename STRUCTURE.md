# 📁 リポジトリ構造

このドキュメントでは、QRCodeGeneratorリポジトリの構造を説明します。

## 📂 ディレクトリ構造

```
QRCodeGenerator/
├── 📄 index.html              # Web版メインファイル
├── 🐍 qr_generator_gui.py     # GUI版メインファイル
├── 📋 requirements_gui.txt    # GUI版依存パッケージ
├── 📖 README.md               # メインREADME
├── 🚫 .gitignore              # Git除外設定
├── ⚙️ .nojekyll               # GitHub Pages設定
│
├── 🚀 起動スクリプト
│   ├── start.bat              # Web版起動（Windows）
│   ├── start.ps1              # Web版起動（PowerShell）
│   ├── start_gui.bat          # GUI版起動（Windows）
│   └── start_gui.ps1          # GUI版起動（PowerShell）
│
├── 📚 docs/                   # ドキュメント
│   ├── README.md              # ドキュメント一覧
│   ├── DEPLOY.md              # デプロイ手順
│   ├── QUICK_DEPLOY.md        # クイックデプロイ
│   ├── ENABLE_PAGES.md        # GitHub Pages有効化
│   ├── FIX_PAGES.md           # GitHub Pages修正
│   ├── SETUP_REPO.md          # リポジトリ設定
│   ├── CREATE_RELEASE.md      # リリース作成
│   ├── RELEASE_NOTES.md       # リリースノート
│   ├── NOTE_TEMPLATE.md        # note記事テンプレート
│   ├── DELETE_REPOS.md        # リポジトリ削除
│   └── WORDPRESS_GUIDE.md     # WordPress統合
│
└── 🛠️ scripts/                # 開発・管理スクリプト
    ├── README.md              # スクリプト一覧
    ├── organize_repo.ps1      # リポジトリ整理スクリプト
    ├── deploy_to_github.bat    # GitHub Pagesデプロイ
    ├── deploy_to_github.ps1   # GitHub Pagesデプロイ（PS）
    ├── connect_repo.bat       # リポジトリ接続
    ├── fix_pages.bat          # GitHub Pages修正
    ├── create_release.bat      # リリース作成
    ├── install_gh_cli.bat     # GitHub CLIインストール
    ├── list_repos.ps1         # リポジトリ一覧
    └── delete_repos.ps1       # リポジトリ削除
```

## 📝 ファイル説明

### ルートディレクトリ

- **index.html**: Web版QRコード生成ツールのメインファイル
- **qr_generator_gui.py**: GUI版QRコード生成ツールのメインファイル
- **requirements_gui.txt**: GUI版に必要なPythonパッケージ一覧
- **README.md**: プロジェクトのメインREADME
- **.gitignore**: Gitで除外するファイル・ディレクトリ
- **.nojekyll**: GitHub PagesでJekyllを無効化

### 起動スクリプト

通常の使用に必要なスクリプトです。ルートディレクトリに配置されています。

### docs/ ディレクトリ

各種ドキュメントが含まれています。詳細は `docs/README.md` を参照してください。

### scripts/ ディレクトリ

開発・デプロイ・管理用のスクリプトが含まれています。通常の使用には不要です。詳細は `scripts/README.md` を参照してください。

## 🎯 使い方

### 通常の使用

1. **Web版**: `start.bat` または `start.ps1` を実行
2. **GUI版**: `start_gui.bat` または `start_gui.ps1` を実行

### 開発・管理

- デプロイ: `scripts/deploy_to_github.bat`
- ドキュメント: `docs/` ディレクトリを参照

## 📚 関連リンク

- **GitHubリポジトリ**: https://github.com/latona01/QRCodeGenerator
- **GitHub Pages**: https://latona01.github.io/QRCodeGenerator/
