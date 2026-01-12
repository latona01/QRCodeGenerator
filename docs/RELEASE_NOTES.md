# 🎉 QRコード生成ツール v1.0.0 リリースノート

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

## 📱 対応環境

### Web版
- **ブラウザ**: Google Chrome, Microsoft Edge, Firefox, Safari
- **デバイス**: PC、スマートフォン、タブレット
- **OS**: Windows, macOS, Linux, iOS, Android

### GUI版
- **OS**: Windows, macOS, Linux
- **Python**: 3.7以上

## 🔗 アクセス方法

### Web版（オンライン）
- **GitHub Pages**: https://latona01.github.io/QRCodeGenerator/
- **リポジトリ**: https://github.com/latona01/QRCodeGenerator

### GUI版（デスクトップ）
```bash
pip install -r requirements_gui.txt
python qr_generator_gui.py
```

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

## 🎯 今後の予定

- [ ] カスタムカラー対応
- [ ] ロゴ画像の埋め込み
- [ ] バッチ生成機能
- [ ] 履歴機能

## 📄 ライセンス

このツールは自由に使用・改変・配布可能です。

---

**リリース日**: 2025年1月
