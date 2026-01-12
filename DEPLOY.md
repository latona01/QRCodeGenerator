# 🌐 オンライン公開ガイド

このQRコード生成ツールをnoteやその他のプラットフォームで共有できるように、オンラインで公開する方法を説明します。

## 🚀 方法1: GitHub Pages（推奨・無料）

GitHub Pagesを使えば、無料でオンライン公開できます。

### 手順

1. **GitHubリポジトリを作成**
   - GitHubにログイン
   - 新しいリポジトリを作成（例: `qr-code-generator`）
   - リポジトリを公開（Public）にする

2. **ファイルをアップロード**
   - このフォルダ内の以下のファイルをアップロード：
     - `index.html`
     - `.nojekyll`（Jekyllを無効化するため）

3. **GitHub Pagesを有効化**
   - リポジトリの「Settings」→「Pages」
   - Source: `Deploy from a branch` を選択
   - Branch: `main`（または`master`）、フォルダ: `/ (root)` を選択
   - 「Save」をクリック

4. **URLを取得**
   - 数分待つと、以下のURLでアクセス可能になります：
     ```
     https://[ユーザー名].github.io/[リポジトリ名]/
     ```
   - 例: `https://username.github.io/qr-code-generator/`

5. **noteで共有**
   - noteの記事内で、上記のURLをリンクとして貼り付け
   - または、埋め込みコードを使用（後述）

### 埋め込みコード（note用）

noteの記事内に以下のコードを貼り付けると、ツールへのリンクボタンが表示されます：

```html
<div style="text-align: center; margin: 30px 0;">
  <a href="https://[あなたのGitHub Pages URL]"
     target="_blank"
     style="display: inline-block;
            padding: 15px 30px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-weight: bold;
            font-size: 18px;">
    🔲 QRコード生成ツールを使う
  </a>
</div>
```

## 🌐 方法2: Netlify（簡単・無料）

Netlifyはドラッグ&ドロップで簡単にデプロイできます。

### 手順

1. **Netlifyにアクセス**
   - https://www.netlify.com/ にアクセス
   - 無料アカウントを作成

2. **デプロイ**
   - ダッシュボードで「Add new site」→「Deploy manually」
   - `index.html` を含むフォルダをドラッグ&ドロップ
   - 自動的にURLが生成されます

3. **カスタムドメイン（任意）**
   - 無料でカスタムドメインも設定可能

## 📝 note記事のテンプレート

以下を参考にnoteの記事を作成してください：

---

# 🔲 無料で使えるQRコード生成ツール

## このツールについて

誰でも簡単にQRコードを作成できる無料ツールです。インストール不要で、ブラウザからすぐに使えます。

## 主な機能

- ✅ URL、テキスト、メールアドレスなどをQRコード化
- ✅ サイズと誤り訂正レベルをカスタマイズ可能
- ✅ PNG画像としてダウンロード可能
- ✅ スマートフォン・タブレット対応

## 使い方

1. 下のボタンをクリックしてツールを開く
2. テキストエリアにQRコード化したい内容を入力
3. 「QRコードを生成」ボタンをクリック
4. 必要に応じて画像として保存

**[🔲 QRコード生成ツールを使う](https://[あなたのURL])**

## 使用例

- **URL**: `https://example.com`
- **Wi-Fi情報**: `WIFI:T:WPA;S:ネットワーク名;P:パスワード;;`
- **メール**: `mailto:example@email.com`

## 注意事項

- このツールは完全に無料です
- データはブラウザ内で処理され、サーバーに送信されません
- プライバシーを保護した設計です

---

## 🔗 その他のホスティングサービス

- **Vercel**: https://vercel.com/ （無料、簡単）
- **GitHub Pages**: https://pages.github.com/ （無料、推奨）
- **Netlify**: https://www.netlify.com/ （無料、簡単）
- **Firebase Hosting**: https://firebase.google.com/ （無料枠あり）

## 📱 モバイル対応

このツールはスマートフォンやタブレットでも快適に使用できます。ブラウザからアクセスするだけでOKです。

---

**質問やフィードバックがあれば、コメント欄でお知らせください！**
