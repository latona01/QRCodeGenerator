<?php
/**
 * Plugin Name: QRコード生成ツール
 * Plugin URI: https://your-site.com
 * Description: シンプルで実用的なQRコード生成ツールをWordPressサイトに追加します。ショートコード [qrcode_generator] で表示できます。
 * Version: 1.0.0
 * Author: Your Name
 * Author URI: https://your-site.com
 * License: GPL v2 or later
 * License URI: https://www.gnu.org/licenses/gpl-2.0.html
 */

// 直接アクセスを防ぐ
if (!defined('ABSPATH')) {
    exit;
}

// ショートコードを登録
add_shortcode('qrcode_generator', 'qrcode_generator_shortcode');

// ショートコード関数
function qrcode_generator_shortcode($atts) {
    // ショートコード属性
    $atts = shortcode_atts(array(
        'width' => '100%',
        'max_width' => '600px',
    ), $atts);

    ob_start();
    ?>
    <div class="qrcode-generator-wrapper" style="width: <?php echo esc_attr($atts['width']); ?>; max-width: <?php echo esc_attr($atts['max_width']); ?>; margin: 20px auto;">
        <!-- QRCode.js ライブラリを読み込む -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/qrcodejs/1.0.0/qrcode.min.js"></script>

        <style>
            .qrcode-generator-wrapper * {
                box-sizing: border-box;
            }

            .qrcode-generator-container {
                background: white;
                border-radius: 20px;
                box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
                padding: 40px;
                width: 100%;
                animation: qrcodeFadeIn 0.5s ease-in;
            }

            @keyframes qrcodeFadeIn {
                from {
                    opacity: 0;
                    transform: translateY(-20px);
                }
                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }

            .qrcode-generator-container h1 {
                color: #333;
                text-align: center;
                margin-bottom: 30px;
                font-size: 2em;
                background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                -webkit-background-clip: text;
                -webkit-text-fill-color: transparent;
                background-clip: text;
            }

            .qrcode-generator-input-group {
                margin-bottom: 25px;
            }

            .qrcode-generator-container label {
                display: block;
                margin-bottom: 8px;
                color: #555;
                font-weight: 600;
                font-size: 0.95em;
            }

            .qrcode-generator-container textarea,
            .qrcode-generator-container input[type="text"],
            .qrcode-generator-container input[type="number"],
            .qrcode-generator-container select {
                width: 100%;
                padding: 12px;
                border: 2px solid #e0e0e0;
                border-radius: 8px;
                font-size: 1em;
                transition: border-color 0.3s;
                font-family: inherit;
            }

            .qrcode-generator-container textarea {
                min-height: 120px;
                resize: vertical;
            }

            .qrcode-generator-container textarea:focus,
            .qrcode-generator-container input:focus,
            .qrcode-generator-container select:focus {
                outline: none;
                border-color: #667eea;
            }

            .qrcode-generator-options {
                display: grid;
                grid-template-columns: 1fr 1fr;
                gap: 15px;
                margin-bottom: 25px;
            }

            .qrcode-generator-option-group {
                display: flex;
                flex-direction: column;
            }

            .qrcode-generator-container button {
                background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                color: white;
                border: none;
                padding: 14px 28px;
                border-radius: 8px;
                font-size: 1.1em;
                font-weight: 600;
                cursor: pointer;
                width: 100%;
                transition: transform 0.2s, box-shadow 0.2s;
                margin-bottom: 20px;
            }

            .qrcode-generator-container button:hover {
                transform: translateY(-2px);
                box-shadow: 0 5px 15px rgba(102, 126, 234, 0.4);
            }

            .qrcode-generator-container button:active {
                transform: translateY(0);
            }

            .qrcode-generator-container button:disabled {
                opacity: 0.6;
                cursor: not-allowed;
                transform: none;
            }

            .qrcode-generator-download-btn {
                background: linear-gradient(135deg, #11998e 0%, #38ef7d 100%);
                margin-bottom: 10px;
            }

            .qrcode-generator-download-btn:hover {
                box-shadow: 0 5px 15px rgba(17, 153, 142, 0.4);
            }

            #qrcode-generator-output {
                display: flex;
                justify-content: center;
                align-items: center;
                min-height: 200px;
                margin: 25px 0;
                padding: 20px;
                background: #f8f9fa;
                border-radius: 12px;
                border: 2px dashed #e0e0e0;
            }

            #qrcode-generator-output canvas {
                border-radius: 8px;
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            }

            .qrcode-generator-preview-placeholder {
                color: #999;
                text-align: center;
                font-style: italic;
            }

            .qrcode-generator-tips {
                background: #f0f7ff;
                border-left: 4px solid #667eea;
                padding: 15px;
                border-radius: 4px;
                margin-top: 20px;
            }

            .qrcode-generator-tips h3 {
                color: #667eea;
                margin-bottom: 10px;
                font-size: 1em;
            }

            .qrcode-generator-tips ul {
                list-style-position: inside;
                color: #666;
                line-height: 1.8;
            }

            .qrcode-generator-tips li {
                margin-bottom: 5px;
            }

            .qrcode-generator-quick-actions {
                display: flex;
                gap: 10px;
                margin-bottom: 15px;
            }

            .qrcode-generator-quick-btn {
                flex: 1;
                padding: 8px 12px;
                font-size: 0.9em;
                background: #f0f0f0;
                color: #555;
                border: 1px solid #ddd;
                border-radius: 6px;
                cursor: pointer;
                transition: all 0.2s;
            }

            .qrcode-generator-quick-btn:hover {
                background: #e0e0e0;
                border-color: #667eea;
                color: #667eea;
            }

            @media (max-width: 600px) {
                .qrcode-generator-options {
                    grid-template-columns: 1fr;
                }

                .qrcode-generator-container {
                    padding: 25px;
                }

                .qrcode-generator-container h1 {
                    font-size: 1.5em;
                }
            }
        </style>

        <div class="qrcode-generator-container">
            <h1>🔲 QRコード生成ツール</h1>

            <div class="qrcode-generator-input-group">
                <label for="qrcode-generator-content">テキスト・URL・メールアドレスなどを入力</label>
                <textarea id="qrcode-generator-content" placeholder="例: https://example.com または テキストメッセージ または mailto:example@email.com"></textarea>
                <div class="qrcode-generator-quick-actions">
                    <button class="qrcode-generator-quick-btn" onclick="qrcodeGeneratorSetExample('url')">URL例</button>
                    <button class="qrcode-generator-quick-btn" onclick="qrcodeGeneratorSetExample('text')">テキスト例</button>
                    <button class="qrcode-generator-quick-btn" onclick="qrcodeGeneratorSetExample('email')">メール例</button>
                    <button class="qrcode-generator-quick-btn" onclick="qrcodeGeneratorClearContent()">クリア</button>
                </div>
            </div>

            <div class="qrcode-generator-options">
                <div class="qrcode-generator-option-group">
                    <label for="qrcode-generator-size">サイズ (px)</label>
                    <input type="number" id="qrcode-generator-size" value="256" min="100" max="1000" step="10">
                </div>
                <div class="qrcode-generator-option-group">
                    <label for="qrcode-generator-error-level">誤り訂正レベル <span style="color: #999; font-weight: normal; font-size: 0.85em;">(?)</span></label>
                    <select id="qrcode-generator-error-level" title="誤り訂正レベル: QRコードが汚れや欠損にどれだけ耐えられるかを示します。L=小さくて綺麗な環境向け、M=標準（推奨）、Q=多少汚れやすい環境向け、H=最も高耐性（屋外・劣化しやすい環境向け）">
                        <option value="L">L (約7%復元可能) - 小さく、綺麗な環境向け</option>
                        <option value="M" selected>M (約15%復元可能) - 標準（推奨）</option>
                        <option value="Q">Q (約25%復元可能) - 多少汚れやすい環境向け</option>
                        <option value="H">H (約30%復元可能) - 最高耐性（屋外向け）</option>
                    </select>
                </div>
            </div>

            <button onclick="qrcodeGeneratorGenerate()">QRコードを生成</button>

            <div id="qrcode-generator-output">
                <div class="qrcode-generator-preview-placeholder">上記のボタンをクリックしてQRコードを生成してください</div>
            </div>

            <button class="qrcode-generator-download-btn" id="qrcode-generator-download-btn" onclick="qrcodeGeneratorDownload()" disabled>PNG画像としてダウンロード</button>

            <div class="qrcode-generator-tips">
                <h3>💡 使い方のヒント</h3>
                <ul>
                    <li>URLを貼り付けて、スマホで簡単アクセス</li>
                    <li>Wi-Fiのパスワード情報（WIFI:T:WPA;S:ネットワーク名;P:パスワード;;）</li>
                    <li>連絡先情報（vCard形式）やメールアドレスも対応</li>
                    <li><strong>誤り訂正レベルについて:</strong> L=小さい・綺麗な環境向け、M=標準（推奨）、Q=多少汚れやすい、H=最高耐性・屋外向け</li>
                    <li>サイズや誤り訂正レベルを調整して最適なQRコードを作成</li>
                    <li>生成したQRコードは画像として保存可能</li>
                </ul>
            </div>
        </div>

        <script>
            (function() {
                let qrcodeGeneratorInstance = null;

                window.qrcodeGeneratorSetExample = function(type) {
                    const textarea = document.getElementById('qrcode-generator-content');
                    switch(type) {
                        case 'url':
                            textarea.value = 'https://github.com';
                            break;
                        case 'text':
                            textarea.value = 'Hello, QR Code! こんにちは、QRコード！';
                            break;
                        case 'email':
                            textarea.value = 'mailto:example@email.com?subject=お問い合わせ&body=メッセージ本文';
                            break;
                    }
                    qrcodeGeneratorGenerate();
                };

                window.qrcodeGeneratorClearContent = function() {
                    document.getElementById('qrcode-generator-content').value = '';
                    document.getElementById('qrcode-generator-output').innerHTML = '<div class="qrcode-generator-preview-placeholder">上記のボタンをクリックしてQRコードを生成してください</div>';
                    document.getElementById('qrcode-generator-download-btn').disabled = true;
                };

                window.qrcodeGeneratorGenerate = function() {
                    const content = document.getElementById('qrcode-generator-content').value.trim();

                    if (!content) {
                        alert('テキストまたはURLを入力してください');
                        return;
                    }

                    const size = parseInt(document.getElementById('qrcode-generator-size').value);
                    const errorLevel = document.getElementById('qrcode-generator-error-level').value;
                    const qrcodeDiv = document.getElementById('qrcode-generator-output');

                    qrcodeDiv.innerHTML = '';

                    try {
                        let correctLevel;
                        switch(errorLevel) {
                            case 'L':
                                correctLevel = QRCode.CorrectLevel.L;
                                break;
                            case 'M':
                                correctLevel = QRCode.CorrectLevel.M;
                                break;
                            case 'Q':
                                correctLevel = QRCode.CorrectLevel.Q;
                                break;
                            case 'H':
                                correctLevel = QRCode.CorrectLevel.H;
                                break;
                            default:
                                correctLevel = QRCode.CorrectLevel.M;
                        }

                        qrcodeGeneratorInstance = new QRCode(qrcodeDiv, {
                            text: content,
                            width: size,
                            height: size,
                            colorDark: "#000000",
                            colorLight: "#FFFFFF",
                            correctLevel: correctLevel
                        });

                        document.getElementById('qrcode-generator-download-btn').disabled = false;
                    } catch (error) {
                        alert('QRコードの生成に失敗しました: ' + error.message);
                        qrcodeDiv.innerHTML = '<div class="qrcode-generator-preview-placeholder">エラーが発生しました</div>';
                    }
                };

                window.qrcodeGeneratorDownload = function() {
                    if (!qrcodeGeneratorInstance) {
                        alert('まずQRコードを生成してください');
                        return;
                    }

                    const canvas = document.querySelector('#qrcode-generator-output canvas');
                    if (!canvas) {
                        alert('QRコードが見つかりません');
                        return;
                    }

                    const link = document.createElement('a');
                    link.download = 'qrcode-' + Date.now() + '.png';
                    link.href = canvas.toDataURL('image/png');
                    link.click();
                };

                // Enterキーで生成（Shift+Enterで改行）
                document.addEventListener('DOMContentLoaded', function() {
                    const contentEl = document.getElementById('qrcode-generator-content');
                    if (contentEl) {
                        contentEl.addEventListener('keydown', function(e) {
                            if (e.key === 'Enter' && !e.shiftKey) {
                                e.preventDefault();
                                qrcodeGeneratorGenerate();
                            }
                        });
                    }

                    const sizeEl = document.getElementById('qrcode-generator-size');
                    if (sizeEl) {
                        sizeEl.addEventListener('change', function() {
                            if (document.getElementById('qrcode-generator-content').value.trim()) {
                                qrcodeGeneratorGenerate();
                            }
                        });
                    }

                    const errorLevelEl = document.getElementById('qrcode-generator-error-level');
                    if (errorLevelEl) {
                        errorLevelEl.addEventListener('change', function() {
                            if (document.getElementById('qrcode-generator-content').value.trim()) {
                                qrcodeGeneratorGenerate();
                            }
                        });
                    }
                });
            })();
        </script>
    </div>
    <?php
    return ob_get_clean();
}



