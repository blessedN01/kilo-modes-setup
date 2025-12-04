# Kilo Code Modes Setup Guide

This guide explains how to replicate the process of turning markdown files into kilo code modes on another machine.

## Overview

This setup creates 9 specialized kilo code modes based on design and development guidelines from markdown files. The modes are configured globally for use across all VSCode instances.

## Prerequisites

- VSCode with kilo-code extension installed
- Access to terminal/command line
- Markdown files containing mode specifications (see source-files/ directory)

## Quick Setup (Automated)

1. **Clone or copy this setup folder** to your target machine
2. **Run the installation script**:
   ```bash
   cd kilo-modes-setup
   chmod +x install-modes.sh
   ./install-modes.sh
   ```
3. **Restart VSCode** to load the new modes

## Manual Setup Steps

### Step 1: Prepare Source Files

Ensure you have the following markdown files (included in source-files/):
- aria-implementation.md
- css-architecture.md
- micro-interactions.md
- react-component-generator.md
- user-persona-generator.md
- Aceternity UI — Concrete Design Brief for Figma.md
- Aceternity_UI_Design_Brief.md
- Principles_Of_Good_Design.md
- SF_Pro_Text_in_Figma.md
- shadcn Figma Guidelines.md
- Shadcn_aesthetics_instructions.md
- shadcn_Design_Aesthetics.md
- Shadcn_design_principles_and_aesthetics.md
- Shadcn_UI_Aesthetic_Principles.md

### Step 2: Create Global Configuration Directory

```bash
mkdir -p ~/.config/Code/User/globalStorage/kilocode.kilo-code/settings
```

### Step 3: Generate Modes Configuration

Copy the provided `custom_modes.yaml` to the global settings directory:

```bash
cp custom_modes.yaml ~/.config/Code/User/globalStorage/kilocode.kilo-code/settings/
```

### Step 4: Verify Installation

Check that the file exists and has content:
```bash
ls -la ~/.config/Code/User/globalStorage/kilocode.kilo-code/settings/custom_modes.yaml
head -10 ~/.config/Code/User/globalStorage/kilocode.kilo-code/settings/custom_modes.yaml
```

### Step 5: Restart VSCode

Restart VSCode completely to load the new global modes.

## Available Modes

After setup, you'll have access to these 9 modes:

### Specialist Modes
- **aria-accessibility**: ARIA Accessibility Implementation Specialist
- **css-architecture**: CSS Architecture Specialist
- **micro-interactions**: Micro-Interactions Animation Expert
- **react-component**: React Component Architect
- **user-persona**: UX Research Persona Creator

### Design Modes
- **aceternity-ui-design**: Aceternity UI Design Specialist
- **shadcn-ui-design**: Shadcn UI Design Specialist
- **design-principles**: Design Principles Specialist
- **typography-design**: Typography Design Specialist

## Mode Details

Each mode is configured with:
- **Role Definition**: Based on the original markdown file's purpose
- **Tool Groups**: Appropriate permissions (read, edit, command)
- **Custom Instructions**: Full content from the source markdown files
- **When to Use**: Specific scenarios for mode selection

## Customization

To modify or add modes:
1. Edit the `custom_modes.yaml` file
2. Follow the YAML structure with required fields: slug, name, roleDefinition, groups
3. Optional fields: description, whenToUse, customInstructions
4. Restart VSCode to apply changes

## Troubleshooting

### Modes Not Appearing
- Ensure VSCode is fully restarted (not just window reload)
- Check file permissions on custom_modes.yaml
- Verify YAML syntax is valid

### Mode Not Working as Expected
- Check that the mode's tool groups match your needs
- Review customInstructions content matches the source markdown
- Ensure the roleDefinition accurately describes the mode's purpose

### File Location Issues
- Confirm the global storage path exists for your OS
- On Windows: `%APPDATA%\Code\User\globalStorage\kilocode.kilo-code\settings\`
- On macOS: `~/Library/Application Support/Code/User/globalStorage/kilocode.kilo-code/settings/`
- On Linux: `~/.config/Code/User/globalStorage/kilocode.kilo-code/settings/`

## Source Files

The original markdown files used to generate these modes are included in the `source-files/` directory for reference and future updates.