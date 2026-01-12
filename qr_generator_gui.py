"""
QRコード生成ツール - GUI版
Python Tkinterを使用したデスクトップアプリケーション
"""
import tkinter as tk
from tkinter import ttk, messagebox, filedialog
from PIL import Image, ImageTk
import qrcode
from qrcode.constants import ERROR_CORRECT_L, ERROR_CORRECT_M, ERROR_CORRECT_Q, ERROR_CORRECT_H
import io
import os
from pathlib import Path


class QRGeneratorGUI:
    """QRコード生成ツールのGUIアプリケーション"""

    def __init__(self, root):
        self.root = root
        self.root.title("QRコード生成ツール")
        self.root.geometry("600x750")
        self.root.resizable(True, True)

        # アイコン設定（可能な場合）
        try:
            self.root.iconbitmap(default="")
        except:
            pass

        # QRコード画像を保持
        self.current_qr_image = None
        self.current_qr_pil_image = None

        # スタイル設定
        self.setup_styles()

        # GUI構築
        self.create_widgets()

    def setup_styles(self):
        """スタイルを設定"""
        style = ttk.Style()
        style.theme_use('clam')

        # ボタンスタイル
        style.configure('Generate.TButton',
                       font=('Segoe UI', 11, 'bold'),
                       padding=10)
        style.configure('Download.TButton',
                       font=('Segoe UI', 10),
                       padding=8)

    def create_widgets(self):
        """GUIウィジェットを作成"""
        # メインフレーム
        main_frame = ttk.Frame(self.root, padding="20")
        main_frame.grid(row=0, column=0, sticky=(tk.W, tk.E, tk.N, tk.S))

        self.root.columnconfigure(0, weight=1)
        self.root.rowconfigure(0, weight=1)
        main_frame.columnconfigure(0, weight=1)

        # タイトル
        title_label = tk.Label(
            main_frame,
            text="🔲 QRコード生成ツール",
            font=('Segoe UI', 18, 'bold'),
            fg='#667eea'
        )
        title_label.grid(row=0, column=0, pady=(0, 20))

        # 入力エリア
        input_frame = ttk.LabelFrame(main_frame, text="テキスト・URL・メールアドレスなどを入力", padding="10")
        input_frame.grid(row=1, column=0, sticky=(tk.W, tk.E), pady=(0, 15))
        input_frame.columnconfigure(0, weight=1)

        self.content_text = tk.Text(
            input_frame,
            height=5,
            width=50,
            wrap=tk.WORD,
            font=('Segoe UI', 10),
            relief=tk.SOLID,
            borderwidth=1
        )
        self.content_text.grid(row=0, column=0, sticky=(tk.W, tk.E), pady=(0, 10))
        self.content_text.insert('1.0', 'https://github.com')

        # クイックアクションボタン
        quick_frame = ttk.Frame(input_frame)
        quick_frame.grid(row=1, column=0, sticky=(tk.W, tk.E))

        ttk.Button(quick_frame, text="URL例", command=lambda: self.set_example('url')).grid(row=0, column=0, padx=2, sticky=tk.W+tk.E)
        ttk.Button(quick_frame, text="テキスト例", command=lambda: self.set_example('text')).grid(row=0, column=1, padx=2, sticky=tk.W+tk.E)
        ttk.Button(quick_frame, text="メール例", command=lambda: self.set_example('email')).grid(row=0, column=2, padx=2, sticky=tk.W+tk.E)
        ttk.Button(quick_frame, text="クリア", command=self.clear_content).grid(row=0, column=3, padx=2, sticky=tk.W+tk.E)

        quick_frame.columnconfigure(0, weight=1)
        quick_frame.columnconfigure(1, weight=1)
        quick_frame.columnconfigure(2, weight=1)
        quick_frame.columnconfigure(3, weight=1)

        # オプション設定
        options_frame = ttk.LabelFrame(main_frame, text="オプション", padding="10")
        options_frame.grid(row=2, column=0, sticky=(tk.W, tk.E), pady=(0, 15))
        options_frame.columnconfigure(1, weight=1)

        # サイズ設定
        ttk.Label(options_frame, text="サイズ (px):").grid(row=0, column=0, sticky=tk.W, padx=(0, 10))
        self.size_var = tk.IntVar(value=256)
        size_spinbox = ttk.Spinbox(
            options_frame,
            from_=100,
            to=1000,
            increment=10,
            textvariable=self.size_var,
            width=10
        )
        size_spinbox.grid(row=0, column=1, sticky=tk.W)

        # 誤り訂正レベル
        ttk.Label(options_frame, text="誤り訂正レベル:").grid(row=1, column=0, sticky=tk.W, padx=(0, 10), pady=(10, 0))
        self.error_level_var = tk.StringVar(value="M")
        error_combo = ttk.Combobox(
            options_frame,
            textvariable=self.error_level_var,
            values=["L (約7%復元可能)", "M (約15%復元可能)", "Q (約25%復元可能)", "H (約30%復元可能)"],
            state="readonly",
            width=25
        )
        error_combo.grid(row=1, column=1, sticky=tk.W, pady=(10, 0))
        error_combo.current(1)  # Mをデフォルトに

        # 生成ボタン
        generate_btn = ttk.Button(
            main_frame,
            text="QRコードを生成",
            command=self.generate_qr,
            style='Generate.TButton'
        )
        generate_btn.grid(row=3, column=0, pady=(0, 15), sticky=(tk.W, tk.E))

        # QRコード表示エリア
        preview_frame = ttk.LabelFrame(main_frame, text="プレビュー", padding="10")
        preview_frame.grid(row=4, column=0, sticky=(tk.W, tk.E, tk.N, tk.S), pady=(0, 15))
        preview_frame.columnconfigure(0, weight=1)
        preview_frame.rowconfigure(0, weight=1)
        main_frame.rowconfigure(4, weight=1)

        self.preview_label = tk.Label(
            preview_frame,
            text="上記のボタンをクリックしてQRコードを生成してください",
            bg='#f8f9fa',
            fg='#999',
            font=('Segoe UI', 10),
            relief=tk.SOLID,
            borderwidth=1
        )
        self.preview_label.grid(row=0, column=0, sticky=(tk.W, tk.E, tk.N, tk.S), padx=10, pady=10)

        # ダウンロードボタン
        self.download_btn = ttk.Button(
            main_frame,
            text="PNG画像として保存",
            command=self.save_qr_code,
            style='Download.TButton',
            state=tk.DISABLED
        )
        self.download_btn.grid(row=5, column=0, sticky=(tk.W, tk.E))

        # Enterキーで生成
        self.root.bind('<Return>', lambda e: self.generate_qr())
        self.content_text.bind('<Control-Return>', lambda e: self.generate_qr())

    def set_example(self, example_type):
        """例を設定"""
        self.content_text.delete('1.0', tk.END)
        if example_type == 'url':
            self.content_text.insert('1.0', 'https://github.com')
        elif example_type == 'text':
            self.content_text.insert('1.0', 'Hello, QR Code! こんにちは、QRコード！')
        elif example_type == 'email':
            self.content_text.insert('1.0', 'mailto:example@email.com?subject=お問い合わせ&body=メッセージ本文')

    def clear_content(self):
        """内容をクリア"""
        self.content_text.delete('1.0', tk.END)
        self.preview_label.config(image='', text="上記のボタンをクリックしてQRコードを生成してください")
        self.download_btn.config(state=tk.DISABLED)
        self.current_qr_image = None
        self.current_qr_pil_image = None

    def generate_qr(self):
        """QRコードを生成"""
        content = self.content_text.get('1.0', tk.END).strip()

        if not content:
            messagebox.showwarning("警告", "テキストまたはURLを入力してください")
            return

        try:
            size = self.size_var.get()
            error_level_str = self.error_level_var.get()

            # 誤り訂正レベルの変換
            error_level_map = {
                "L (約7%復元可能)": ERROR_CORRECT_L,
                "M (約15%復元可能)": ERROR_CORRECT_M,
                "Q (約25%復元可能)": ERROR_CORRECT_Q,
                "H (約30%復元可能)": ERROR_CORRECT_H
            }
            error_level = error_level_map.get(error_level_str, ERROR_CORRECT_M)

            # QRコード生成
            qr = qrcode.QRCode(
                version=1,
                error_correction=error_level,
                box_size=10,
                border=4,
            )
            qr.add_data(content)
            qr.make(fit=True)

            # PIL Imageに変換
            img = qr.make_image(fill_color="black", back_color="white")

            # サイズ調整
            img = img.resize((size, size), Image.Resampling.LANCZOS)

            # Tkinter用に変換
            self.current_qr_pil_image = img
            photo = ImageTk.PhotoImage(img)

            # プレビューに表示
            self.preview_label.config(image=photo, text='')
            self.preview_label.image = photo  # 参照を保持
            self.current_qr_image = photo

            # ダウンロードボタンを有効化
            self.download_btn.config(state=tk.NORMAL)

        except Exception as e:
            messagebox.showerror("エラー", f"QRコードの生成に失敗しました:\n{str(e)}")
            self.preview_label.config(image='', text="エラーが発生しました")

    def save_qr_code(self):
        """QRコードを保存"""
        if not self.current_qr_pil_image:
            messagebox.showwarning("警告", "まずQRコードを生成してください")
            return

        try:
            # 保存先を選択
            file_path = filedialog.asksaveasfilename(
                defaultextension=".png",
                filetypes=[("PNG画像", "*.png"), ("すべてのファイル", "*.*")],
                initialfile=f"qrcode_{self.size_var.get()}px.png"
            )

            if file_path:
                self.current_qr_pil_image.save(file_path, "PNG")
                messagebox.showinfo("成功", f"QRコードを保存しました:\n{file_path}")
        except Exception as e:
            messagebox.showerror("エラー", f"保存に失敗しました:\n{str(e)}")


def main():
    """メイン関数"""
    root = tk.Tk()
    app = QRGeneratorGUI(root)
    root.mainloop()


if __name__ == "__main__":
    main()
