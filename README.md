# Git Pre-commit Hook: Gitleaks

An automated Git pre-commit hook designed to prevent hardcoded secrets (API keys, passwords, tokens etc) from being committed to your repository. It leverages [Gitleaks](https://github.com/gitleaks/gitleaks) to scan your staged changes.

## Features
- **Zero-dependency Installation:** Install the hook with a single terminal command.
- **Auto-install:** Automatically detects your Operating System (macOS, Linux, Windows) and CPU architecture (x64, arm64) to download the appropriate Gitleaks binary.
- **Local Isolation:** The binary is downloaded directly into the project's `.git/hooks/` directory. It does not clutter your global system or require `sudo` privileges.
- **Git Config Integration:** Enable or disable the security check on the fly using standard Git configuration.

---

## Installation

To install and set up the pre-commit hook in your local repository, run the following command from the **root directory** of your project:

```bash
curl -sSfL [https://raw.githubusercontent.com/mkdir28/gitleaks-hook/main/install.sh](https://raw.githubusercontent.com/mkdir28/gitleaks-hook/main/setup.sh) | sh
```

## What the installation script `setup.sh` does under the hood:
- **Verifies Environment:** Checks that you are executing the command from the root of a valid Git repository.
- **Downloads the Hook:** Fetches the pre-commit script from this repository and places it directly into your local .git/hooks/pre-commit directory.
- **Grants Permissions**: Automatically makes the hook executable by running `chmod +x`.
- **Activates the Config**: Runs `git config hooks.enable true` to enable the security check by default.