#!/bin/bash

# array for source and target file pairs :)
declare -A file_pairs=(
    ['/home/farzad/.atamanrc.config']='/home/farzad/.dotfiles/ataman/.atamanrc.config'
    ['/home/farzad/.ideavimrc']='/home/farzad/.dotfiles/intellij/.ideavimrc'
)

for SOURCE_FILE in "${!file_pairs[@]}"; do
    TARGET_FILE="${file_pairs[$SOURCE_FILE]}"

    if [ -f "$SOURCE_FILE" ]; then
        cp "$SOURCE_FILE" "$TARGET_FILE"
        echo "Updated $TARGET_FILE with content from $SOURCE_FILE."

        git add "$TARGET_FILE"
        echo "$TARGET_FILE staged for commit."
    else
        echo "Source file $SOURCE_FILE does not exist."
    fi
done

echo "All files processed."

