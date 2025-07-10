#!/bin/bash

# === CONFIGURATION ===
PRIVATE_VAULT="$HOME/Library/Mobile Documents/com~apple~CloudDocs/Obsidian/Knowledge"
PUBLIC_VAULT="$HOME/Library/Mobile Documents/com~apple~CloudDocs/Obsidian/MLE-Training"
README_SOURCE="$PRIVATE_VAULT/Train yourself to be a ML AI Engineer or Scientist in 1 year.md"
README_TARGET="$PUBLIC_VAULT/README.md"

echo "🔁 Syncing MLE notes from private vault to public GitHub repo..."

# 1. Clean existing .md files in public vault (except README)
echo "🧹 Removing old .md files in public vault..."
find "$PUBLIC_VAULT" -type f -name "*.md" ! -name "README.md" -delete

# 2. Copy notes with MLE tag
echo "📥 Copying #MLE-tagged notes..."
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

# 3. Convert main README file (remove frontmatter)
echo "📄 Converting README source file..."
perl -0777 -pe 's/\A---\n.*?\n---\n+//s' "$README_SOURCE" > "$README_TARGET"

# 4. Build a map of note titles to URL-encoded relative paths
declare -A NOTE_PATHS
while IFS= read -r -d '' file; do
    filename="$(basename "$file" .md)"
    relpath="${file#"$PUBLIC_VAULT/"}"
    encoded_path=$(python3 -c "import urllib.parse; print(urllib.parse.quote('''$relpath'''))")
    NOTE_PATHS["$filename"]="$encoded_path"
done < <(find "$PUBLIC_VAULT" -type f -name "*.md" -print0)

# 5. Rewrite all wikilinks in every Markdown file
echo "🔗 Resolving [[wikilinks]] in all public files..."
find "$PUBLIC_VAULT" -type f -name "*.md" | while read -r file; do
    temp_file="${file}.tmp"
    while IFS= read -r line; do
        converted="$line"
        while [[ "$converted" =~ \[\[([^\]]+)\]\] ]]; do
            title="${BASH_REMATCH[1]}"
            encoded_path="${NOTE_PATHS[$title]}"
            if [[ -n "$encoded_path" ]]; then
                converted="${converted//\[\[$title\]\]/[$title]($encoded_path)}"
            else
                break
            fi
        done
        echo "$converted" >> "$temp_file"
    done < "$file"
    mv "$temp_file" "$file"
    echo "🔄 Converted: $(basename "$file")"
done

echo "✅ All done. You can now git add and commit your changes."
