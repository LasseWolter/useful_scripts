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

cp "$CONFIG_DIR/settings.json" "$SCRIPT_DIR/settings.json"
cp "$CONFIG_DIR/keybindings.json" "$SCRIPT_DIR/keybindings.json"

if [ "$(uname)" = "Darwin" ]; then
    sed -i '' 's/cmd/ctrl/g' "$SCRIPT_DIR/keybindings.json"
    sed -i '' 's/cmd/ctrl/g' "$SCRIPT_DIR/settings.json"
fi
echo "Exported settings and keybinds from $CONFIG_DIR to $SCRIPT_DIR"
