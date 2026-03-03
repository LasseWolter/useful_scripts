#!/bin/sh
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

if [ "$(uname)" = "Darwin" ]; then
    CONFIG_DIR="$HOME/Library/Application Support/Code/User"
elif [ "$(uname)" = "Linux" ]; then
    CONFIG_DIR="$HOME/.config/Code/User"
else
    echo "Unsupported OS: $(uname)" >&2
    exit 1
fi

cp "$SCRIPT_DIR/settings.json" "$CONFIG_DIR/settings.json"
cp "$SCRIPT_DIR/keybindings.json" "$CONFIG_DIR/keybindings.json"

if [ "$(uname)" = "Darwin" ]; then
    sed -i '' 's/ctrl/cmd/g' "$CONFIG_DIR/keybindings.json"
    sed -i '' 's/ctrl/cmd/g' "$CONFIG_DIR/settings.json"
fi
echo "Updated settings and keybinds in $CONFIG_DIR"
