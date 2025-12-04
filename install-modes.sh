#!/bin/bash

# Kilo Code Modes Installation Script
# This script installs the custom modes globally for kilo-code

set -e

echo "🚀 Installing Kilo Code Custom Modes..."

# Determine OS and set config path
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    CONFIG_DIR="$HOME/.config/Code/User/globalStorage/kilocode.kilo-code/settings"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    CONFIG_DIR="$HOME/Library/Application Support/Code/User/globalStorage/kilocode.kilo-code/settings"
elif [[ "$OSTYPE" == "msys" ]] || [[ "$OSTYPE" == "win32" ]]; then
    CONFIG_DIR="$APPDATA/Code/User/globalStorage/kilocode.kilo-code/settings"
else
    echo "❌ Unsupported OS: $OSTYPE"
    exit 1
fi

echo "📁 Config directory: $CONFIG_DIR"

# Create directory if it doesn't exist
mkdir -p "$CONFIG_DIR"

# Copy the modes configuration
if [ -f "custom_modes.yaml" ]; then
    cp custom_modes.yaml "$CONFIG_DIR/"
    echo "✅ Modes configuration installed successfully!"
else
    echo "❌ Error: custom_modes.yaml not found in current directory"
    exit 1
fi

# Verify installation
if [ -f "$CONFIG_DIR/custom_modes.yaml" ]; then
    MODE_COUNT=$(grep -c "slug:" "$CONFIG_DIR/custom_modes.yaml")
    echo "✅ Installation verified: $MODE_COUNT modes configured"
    echo ""
    echo "📋 Installed modes:"
    grep "name:" "$CONFIG_DIR/custom_modes.yaml" | sed 's/.*name: //' | sed 's/^/- /'
    echo ""
    echo "🔄 Please restart VSCode completely to load the new modes."
    echo "💡 Tip: Use Ctrl+Shift+P → 'Developer: Reload Window' or restart VSCode"
else
    echo "❌ Installation failed: Configuration file not found after copy"
    exit 1
fi

echo ""
echo "🎉 Installation complete! Happy coding with your custom modes."