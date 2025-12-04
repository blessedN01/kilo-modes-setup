#!/bin/bash

# Kilo Code Modes Installation Script
# This script installs the custom modes globally for kilo-code

set -e

echo "🚀 Installing Kilo Code Custom Modes..."

# Check if this is an update
if [ -f "$CONFIG_DIR/custom_modes.yaml" ]; then
    echo "🔄 Updating existing modes configuration..."
else
    echo "📦 Installing fresh modes configuration..."
fi

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

# Backup existing configuration if it exists
if [ -f "$CONFIG_DIR/custom_modes.yaml" ]; then
    BACKUP_FILE="$CONFIG_DIR/custom_modes.yaml.backup.$(date +%Y%m%d_%H%M%S)"
    cp "$CONFIG_DIR/custom_modes.yaml" "$BACKUP_FILE"
    echo "📦 Existing configuration backed up to: $BACKUP_FILE"
fi

# Validate YAML syntax
echo "🔍 Validating YAML syntax..."
if command -v yamllint &> /dev/null; then
    if yamllint custom_modes.yaml; then
        echo "✅ YAML syntax is valid"
    else
        echo "❌ YAML syntax validation failed"
        exit 1
    fi
else
    echo "⚠️  yamllint not found, skipping YAML validation"
fi

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

    # Check for required fields
    MISSING_SLUGS=$(grep -n "name:" "$CONFIG_DIR/custom_modes.yaml" | grep -v "slug:" | wc -l)
    if [ "$MISSING_SLUGS" -gt 0 ]; then
        echo "⚠️  Warning: $MISSING_SLUGS modes may be missing required 'slug' fields"
    fi

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