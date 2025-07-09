#!/bin/bash

# 设定源与目标 Vault 路径（带空格路径必须引号包裹）
PRIVATE_VAULT="/Users/tongshan/Library/Mobile Documents/com~apple~CloudDocs/Obsidian/Knowledge"
PUBLIC_VAULT="/Users/tongshan/Library/Mobile Documents/com~apple~CloudDocs/Obsidian/MLE-Training"

echo "📂 Scanning for notes tagged with 'MLE' in:"
echo "$PRIVATE_VAULT"
echo ""

cd "$PUBLIC_VAULT" || { echo "❌ Failed to access public vault path."; exit 1; }

# 🧹 清除旧的软链接（仅限 .md 且是 symlink）
echo "🧹 Cleaning up old symlinks..."
find . -type l -name "*.md" -exec rm {} +

# 🔍 搜索所有带 tag 的 md 文件（递归子文件夹）
echo "🔍 Searching for notes with tag MLE (recursive)..."

# 记录是否找到内容
found_any=false

# 搜索所有 .md 文件
find "$PRIVATE_VAULT" -type f -name "*.md" | while read -r filepath; do
    # 检查是否包含标签 - MLE
    if grep -qE '(^|\s)-\s*MLE(\s|$)' "$filepath"; then
        found_any=true

        # 去掉源路径前缀，保留相对路径
        rel_path="${filepath#"$PRIVATE_VAULT/"}"

        # 获取目标路径
        target_path="$PUBLIC_VAULT/$rel_path"
        target_dir=$(dirname "$target_path")

        # 创建目标子目录（如果不存在）
        mkdir -p "$target_dir"

        # 创建软链接
        ln -sf "$filepath" "$target_path"
        echo "🔗 Linked: $rel_path"
    fi
done

if [ "$found_any" = false ]; then
    echo "⚠️ No notes with tag 'MLE' found."
fi