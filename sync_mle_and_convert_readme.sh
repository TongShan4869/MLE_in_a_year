#!/bin/bash

# === CONFIGURATION ===
PRIVATE_VAULT="$HOME/Library/Mobile Documents/com~apple~CloudDocs/Obsidian/Knowledge"
PUBLIC_VAULT="$HOME/Library/Mobile Documents/com~apple~CloudDocs/Obsidian/MLE-Training"
README_SOURCE="$PRIVATE_VAULT/Train yourself to be a ML AI Engineer or Scientist in 1 year.md"
README_TARGET="$PUBLIC_VAULT/README.md"

echo "🔁 Syncing MLE-tagged notes from private vault to public vault..."

# 1. Remove all old .md files in public vault except README.md
find "$PUBLIC_VAULT" -type f -name "*.md" ! -name "README.md" -delete

# 2. Copy only MLE-tagged .md files
find "$PRIVATE_VAULT" -type f -name "*.md" | while read -r filepath; do
    if grep -qE '(^|\s)-\s*MLE(\s|$)' "$filepath"; then
        rel_path="${filepath#"$PRIVATE_VAULT/"}"
        target_path="$PUBLIC_VAULT/$rel_path"
        target_dir=$(dirname "$target_path")
        mkdir -p "$target_dir"
        cp "$filepath" "$target_path"
        echo "✅ Copied: $rel_path"
    fi
done

# 3. Convert README.md to GitHub-compatible format
echo "📄 Converting README for GitHub compatibility..."
perl -0777 -pe 's/\A---\n.*?\n---\n+//s' "$README_SOURCE" | perl -pe 's/\[\[([^\]]+?)\]\]/"[".$1."](".(join "%20", split(" ", $1)).".md)"/ge' > "$README_TARGET"

echo "✅ README.md converted and MLE notes synced."
