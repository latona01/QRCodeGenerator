# WordPress統合ガイド

このQRコード生成ツールをWordPressサイトに統合する方法を説明します。

## 📋 方法1: ショートコードプラグイン（推奨）⭐

最も簡単で再利用可能な方法です。

### 手順

1. **プラグインファイルをアップロード**
   - `wordpress-shortcode.php` をWordPressのプラグインディレクトリにアップロード
   - パス: `wp-content/plugins/qrcode-generator/wordpress-shortcode.php`

2. **プラグインを有効化**
   - WordPress管理画面 → プラグイン
   - 「QRコード生成ツール」を有効化

3. **ショートコードを使用**
   - 投稿やページのエディタで以下のショートコードを記述:
   ```
   [qrcode_generator]
   ```

4. **オプション属性（任意）**
   ```
   [qrcode_generator width="100%" max_width="600px"]
   ```

### 使用例

**投稿やページで:**
```
このページでQRコードを生成できます。

[qrcode_generator]
```

**サイズを指定:**
```
[qrcode_generator width="90%" max_width="500px"]
```

---

## 📋 方法2: テーマのfunctions.phpに追加

テーマを直接編集できる場合の方法です。

### 手順

1. **テーマファイルを編集**
   - WordPress管理画面 → 外観 → テーマエディタ
   - または、FTP経由で `wp-content/themes/あなたのテーマ名/functions.php` を編集

2. **コードを追加**
   - `wordpress-shortcode.php` の中身（プラグインヘッダーを除く）を `functions.php` の最後に追加
   - または、`wordpress-shortcode.php` の内容をコピー＆ペースト

3. **ショートコードを使用**
   - 投稿やページで `[qrcode_generator]` を使用

⚠️ **注意**: テーマを更新すると変更が消える可能性があります。子テーマを使用することを推奨します。

---

## 📋 方法3: カスタムHTMLブロックで埋め込み

Gutenbergエディタ（ブロックエディタ）を使用している場合の方法です。

### 手順

1. **HTMLファイルを準備**
   - `index.html` をWordPressのメディアライブラリまたはテーマフォルダにアップロード
   - または、外部のサーバーにアップロードしてURLを取得

2. **HTMLブロックを追加**
   - 投稿やページのエディタで「HTML」ブロックを追加
   - `index.html` の中身（`<!DOCTYPE html>` から `</html>` まで）をコピー
   - ただし、`<html>`, `<head>`, `<body>` タグは削除して、中身だけを貼り付け

3. **スタイルとスクリプトを調整**
   - `<style>` タグと `<script>` タグの内容だけを貼り付け
   - `<div class="container">` 以下のHTMLも貼り付け

### 埋め込み用のコード例

HTMLブロックに以下のように貼り付けます:

```html
<!-- QRCode.js ライブラリ -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/qrcodejs/1.0.0/qrcode.min.js"></script>

<!-- スタイル -->
<style>
/* index.html の <style> タグの中身をここに貼り付け */
/* body スタイルは削除して、コンテナのスタイルだけ残す */
</style>

<!-- HTMLコンテンツ -->
<div class="container">
  <!-- index.html の <body> タグの中身をここに貼り付け -->
</div>

<!-- スクリプト -->
<script>
/* index.html の <script> タグの中身をここに貼り付け */
</script>
```

---

## 📋 方法4: カスタムページテンプレートとして作成

完全に独立したページとして表示したい場合の方法です。

### 手順

1. **テーマフォルダにテンプレートファイルを作成**
   - パス: `wp-content/themes/あなたのテーマ名/page-qrcode.php`
   - ファイル名は任意ですが、`page-` で始めることでページテンプレートとして認識されます

2. **テンプレートファイルにコードを記述**
   ```php
   <?php
   /**
    * Template Name: QRコード生成
    */
   get_header();
   ?>

   <div class="page-content">
       <?php
       // index.html の <body> タグの中身をここに貼り付け
       // <style> と <script> も含める
       ?>
   </div>

   <?php get_footer(); ?>
   ```

3. **ページを作成**
   - WordPress管理画面 → ページ → 新規追加
   - ページテンプレートで「QRコード生成」を選択
   - 公開

---

## 📋 方法5: ウィジェットとして表示

サイドバーやフッターに表示したい場合の方法です。

### 手順

1. **カスタムHTMLウィジェットを使用**
   - WordPress管理画面 → 外観 → ウィジェット
   - 「カスタムHTML」ウィジェットを追加
   - ショートコード `[qrcode_generator]` を入力（方法1を使用している場合）

2. **または、テキストウィジェットに直接HTMLを記述**
   - 「テキスト」ウィジェットを使用
   - HTMLを直接記述

---

## 🎨 スタイルのカスタマイズ

WordPressテーマのスタイルと競合する場合、以下のように調整できます:

### CSSの優先度を上げる
```css
.qrcode-generator-container {
    /* !important を追加 */
    background: white !important;
}
```

### テーマのスタイルをリセット
```css
.qrcode-generator-wrapper * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}
```

---

## ✅ 推奨方法

**最も簡単で推奨される方法**: **方法1（ショートコードプラグイン）**

理由:
- ✅ インストールが簡単
- ✅ どこでも再利用可能（ショートコードで呼び出せる）
- ✅ テーマ更新の影響を受けない
- ✅ プラグインとして管理できる
- ✅ 他のページや投稿でも簡単に使用できる

---

## 🔧 トラブルシューティング

### QRコードが表示されない場合

1. **ブラウザのコンソールを確認**
   - F12キーを押して開発者ツールを開く
   - 「Console」タブでエラーを確認

2. **QRCode.jsが読み込まれているか確認**
   - 「Network」タブで `qrcode.min.js` が読み込まれているか確認

3. **JavaScriptエラーを確認**
   - コンソールにエラーメッセージが表示されていないか確認

### スタイルが崩れる場合

1. **テーマのCSSと競合していないか確認**
   - インスペクター（F12）で要素を確認
   - 必要に応じてCSSの優先度を上げる（`!important` を使用）

2. **コンテナの幅を調整**
   ```
   [qrcode_generator width="90%" max_width="500px"]
   ```

### ショートコードが動作しない場合

1. **プラグインが有効化されているか確認**
2. **ショートコードのスペルを確認**: `[qrcode_generator]`
3. **テキストエディタで確認**: ビジュアルエディタではなく、テキストエディタで確認

---

## 📞 サポート

問題が発生した場合は、WordPressのエラーログを確認するか、ブラウザのコンソールエラーを確認してください。



