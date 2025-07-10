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

# 3. Convert README with resolved GitHub-style links
echo "📄 Generating GitHub-compatible README with correct relative links..."
python3 - "$README_SOURCE" "$README_TARGET" "$PUBLIC_VAULT" << 'ENDPY'

import os
import re
import sys
import urllib.parse

readme_src, readme_dest, public_vault = sys.argv[1:4]

# Load README
with open(readme_src, "r", encoding="utf-8") as f:
    content = f.read()

# Remove YAML frontmatter
content = re.sub(r"^---.*?---\s*", "", content, flags=re.DOTALL)

# Build map from [[Note]] to relative path
note_map = {}
for root, _, files in os.walk(public_vault):
    for file in files:
        if file.endswith(".md"):
            title = os.path.splitext(file)[0]
            abs_path = os.path.join(root, file)
            rel_path = os.path.relpath(abs_path, os.path.dirname(readme_dest))
            url_path = urllib.parse.quote(rel_path)
            note_map[title] = url_path

# Replace [[Note]] with [Note](url)
def replacer(match):
    title = match.group(1).strip()
    return f"[{title}]({note_map.get(title, '#broken-link')})"

converted = re.sub(r"\[\[([^\]]+)\]\]", replacer, content)

# Save new README
with open(readme_dest, "w", encoding="utf-8") as f:
    f.write(converted)

print("✅ README updated with correct links.")

ENDPY

echo "✅ All done."
