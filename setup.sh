#!/usr/bin/env bash

echo "starting gitleaks hook installation"
if [ ! -d ".git" ]; then
    echo "Error"
    echo "you must run this command from the root of a Git repository."
    exit 1
fi

HOOK_PATH=".git/hooks/pre-commit"
RAW_URL="https://raw.githubusercontent.com/mkdir28/gitleaks-hook/main/pre-commit"

echo "download pre commit script"
curl -sSfL "$RAW_URL" -o "$HOOK_PATH"

if [ $? -ne 0 ]; then
    echo "Error"
    echo "failed to download the script. check the url."
    exit 1
fi

chmod +x "$HOOK_PATH"

git config hooks.enable true

echo "success"
echo "pre commit hook is installed and enabled"