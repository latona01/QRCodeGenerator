# 🎉 GitHubリリース作成手順

## ✅ タグの作成が完了しました

タグ `v1.0.0` は既にGitHubにプッシュされています。

## 📝 リリースを作成する方法

### 方法1: GitHub Webインターフェース（推奨）

1. **リリース作成ページを開く**:
   ```
   https://github.com/latona01/QRCodeGenerator/releases/new
   ```

2. **リリース情報を入力**:
   - **Choose a tag**: `v1.0.0` を選択
   - **Release title**: `QRコード生成ツール v1.0.0`
   - **Describe this release**: 以下の内容をコピー&ペースト

   ```
   # 🎉 QRコード生成ツール v1.0.0

   ## ✨ 初回リリース

   無料で使えるQRコード生成ツールの初回リリースです。

   ## 🚀 主な機能

   - ✅ **簡単操作**: テキストを入力してボタンをクリックするだけ
   - ✅ **多様な入力形式に対応**: URL、テキスト、メールアドレス、Wi-Fi情報など
   - ✅ **カスタマイズ可能**: サイズ（100-1000px）と誤り訂正レベル（L/M/Q/H）を調整可能
   - ✅ **画像ダウンロード**: 生成したQRコードをPNG画像として保存
   - ✅ **レスポンシブデザイン**: PC・スマホ・タブレットで使用可能
   - ✅ **モバイル最適化**: タッチ操作に最適化されたUI
   - ✅ **デスクトップGUI版**: Python Tkinterベースのスタンドアロンアプリ（オフライン対応）

   ## 🔗 アクセス方法

   - **Web版**: https://latona01.github.io/QRCodeGenerator/
   - **リポジトリ**: https://github.com/latona01/QRCodeGenerator

   ## 📝 使い方

   1. テキストエリアにQRコード化したい内容を入力
   2. オプションを調整（サイズ、誤り訂正レベル）
   3. 「QRコードを生成」ボタンをクリック
   4. 必要に応じて画像として保存

   ## 💡 使用例

   - **URL**: `https://github.com`
   - **Wi-Fi情報**: `WIFI:T:WPA;S:ネットワーク名;P:パスワード;;`
   - **メール**: `mailto:example@email.com`
   - **テキスト**: `こんにちは、QRコード！`
   ```

3. **「Publish release」ボタンをクリック**

### 方法2: GitHub CLIを使用

GitHub CLIがインストールされている場合：

```bash
gh release create v1.0.0 --title "QRコード生成ツール v1.0.0" --notes-file RELEASE_NOTES.md
```

## 🔗 リリースURL

リリース作成後、以下のURLでアクセス可能になります：
```
https://github.com/latona01/QRCodeGenerator/releases/tag/v1.0.0
```

## 📦 今後のリリース

新しいバージョンをリリースする場合：

1. タグを作成:
   ```bash
   git tag -a v1.1.0 -m "バージョン 1.1.0"
   git push origin v1.1.0
   ```

2. リリースを作成（上記の手順を参照）
