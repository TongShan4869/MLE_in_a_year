#!/bin/bash

PRIVATE_VAULT="/Users/tongshan/Library/Mobile Documents/com~apple~CloudDocs/Obsidian/Knowledge"
PUBLIC_VAULT="/Users/tongshan/Library/Mobile Documents/com~apple~CloudDocs/Obsidian/MLE-Training"

echo "📂 Scanning for notes tagged with 'MLE' in:"
echo "$PRIVATE_VAULT"
echo ""

cd "$PUBLIC_VAULT" || { echo "❌ Failed to access public vault path."; exit 1; }

# 🧹 Clean up old .md files (only regular files)
echo "🧹 Cleaning old MLE files..."
find . -type f -name "*.md" -delete

# 🔍 Search and copy notes
found_any=false

find "$PRIVATE_VAULT" -type f -name "*.md" | while read -r filepath; do
    if grep -qE '(^|\s)-\s*MLE(\s|$)' "$filepath"; then
        found_any=true

        # Get relative path
        rel_path="${filepath#"$PRIVATE_VAULT/"}"
        target_path="$PUBLIC_VAULT/$rel_path"
        target_dir=$(dirname "$target_path")

        mkdir -p "$target_dir"
        cp "$filepath" "$target_path"
        echo "📄 Copied: $rel_path"
    fi
done

if [ "$found_any" = false ]; then
    echo "⚠️ No notes with tag 'MLE' found."
fi