# 🔨 EXEファイルのビルドガイド

GUI版のQRコード生成ツールをWindows用の.exeファイルにビルドする方法です。

## 📋 必要な環境

- Python 3.7以上
- pip（Pythonパッケージマネージャー）
- Windows OS（ビルド環境）

## 🚀 ビルド手順

### 方法1: バッチファイルを使用（推奨）

```bash
build_exe.bat
```

### 方法2: PowerShellスクリプトを使用

```powershell
.\build_exe.ps1
```

### 方法3: 手動ビルド

```bash
# 1. パッケージをインストール
pip install -r requirements_gui.txt

# 2. ビルド
pyinstaller QRCodeGenerator.spec --clean --noconfirm
```

## 📦 ビルド結果

ビルドが成功すると、以下のファイルが生成されます：

```
dist/
  └── QRCodeGenerator.exe
```

## 📤 GitHub Releasesへのアップロード

### 方法1: GitHub Webインターフェース

1. **リリースページを開く**:
   ```
   https://github.com/latona01/QRCodeGenerator/releases/new
   ```

2. **リリース情報を入力**:
   - Choose a tag: 新しいバージョンタグ（例: `v1.0.1`）
   - Release title: `QRコード生成ツール v1.0.1`
   - Describe this release: リリースノートを記入

3. **EXEファイルをアップロード**:
   - 「Attach binaries」セクションで `dist\QRCodeGenerator.exe` をドラッグ&ドロップ
   - または「Browse your files」から選択

4. **「Publish release」をクリック**

### 方法2: GitHub CLIを使用

```bash
# タグを作成
git tag -a v1.0.1 -m "Release v1.0.1"
git push origin v1.0.1

# リリースを作成（EXEファイルを添付）
gh release create v1.0.1 --title "QRコード生成ツール v1.0.1" --notes "リリースノート" dist\QRCodeGenerator.exe
```

## 🔧 カスタマイズ

### アイコンの追加

1. `.ico` ファイルを準備（例: `icon.ico`）
2. `QRCodeGenerator.spec` の `icon=None` を `icon='icon.ico'` に変更
3. 再ビルド

### ファイルサイズの最適化

- `upx=True` を `upx=False` に変更すると、ビルド時間は短縮されますが、ファイルサイズが大きくなります
- UPXを使用する場合は、UPXをインストールする必要があります

### コンソールウィンドウの表示

デバッグ時は `console=False` を `console=True` に変更すると、エラーメッセージが表示されます。

## 🐛 トラブルシューティング

### ビルドエラー: "ModuleNotFoundError"

必要なパッケージがインストールされていない可能性があります：

```bash
pip install -r requirements_gui.txt
```

### ビルドエラー: "PyInstaller not found"

PyInstallerがインストールされていません：

```bash
pip install pyinstaller
```

### EXEファイルが起動しない

1. コンソールを有効にしてエラーを確認（`console=True`）
2. 依存関係を確認
3. Windows Defenderなどのセキュリティソフトがブロックしていないか確認

### ファイルサイズが大きい

- `upx=True` でUPX圧縮を使用（UPXのインストールが必要）
- 不要なパッケージを除外（`excludes` に追加）

## 📝 リリースノートのテンプレート

```markdown
# QRコード生成ツール v1.0.1

## 🆕 新機能
- （新機能の説明）

## 🐛 バグ修正
- （修正内容）

## 📦 ダウンロード

### Windows
- [QRCodeGenerator.exe](https://github.com/latona01/QRCodeGenerator/releases/download/v1.0.1/QRCodeGenerator.exe)

## 📋 システム要件
- Windows 7以上
- インストール不要（ポータブル版）

## 🔧 使い方
1. `QRCodeGenerator.exe` をダウンロード
2. ダブルクリックで起動
3. QRコードを生成して保存
```

## 🔗 関連リンク

- **GitHubリポジトリ**: https://github.com/latona01/QRCodeGenerator
- **リリース一覧**: https://github.com/latona01/QRCodeGenerator/releases
