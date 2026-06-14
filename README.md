# Git Pre-commit Hook: Gitleaks

An automated Git pre-commit hook designed to prevent hardcoded secrets (API keys, passwords, tokens etc) from being committed to your repository. It leverages [Gitleaks](https://github.com/gitleaks/gitleaks) to scan your staged changes.

## Features
- **Zero-dependency Installation:** Install the hook with a single terminal command.
- **Auto-install:** Automatically detects your Operating System (macOS, Linux, Windows) and CPU architecture (x64, arm64) to download the appropriate Gitleaks binary.
- **Local Isolation:** The binary is downloaded directly into the project's `.git/hooks/` directory. It does not clutter your global system or require `sudo` privileges.
- **Git Config Integration:** Enable or disable the security check on the fly using standard Git configuration.

## What the installation script `setup.sh` does under the hood:
- **Verifies Environment:** Checks that you are executing the command from the root of a valid Git repository.
- **Downloads the Hook:** Fetches the pre-commit script from this repository and places it directly into your local .git/hooks/pre-commit directory.
- **Grants Permissions**: Automatically makes the hook executable by running `chmod +x`.
- **Activates the Config**: Runs `git config hooks.enable true` to enable the security check by default.

---

## Installation

To install and set up the pre-commit hook in your local repository, run the following command from the **root directory** of your project:

```bash
curl -sSfL [https://raw.githubusercontent.com/mkdir28/gitleaks-hook/main/setup.sh](https://raw.githubusercontent.com/mkdir28/gitleaks-hook/main/setup.sh) | sh
```

## Demo

Here's what the process looks like to install the hook and automatically block the commit when attempting to add a secret token to the repository:

```console
@mkdir28 ➜ /workspaces/kbot (main) $ curl -sSfL [https://raw.githubusercontent.com/mkdir28/gitleaks-hook/main/setup.sh](https://raw.githubusercontent.com/mkdir28/gitleaks-hook/main/setup.sh) | sh
starting gitleaks hook installation
download pre commit script
success
pre commit hook is installed and enabled

@mkdir28 ➜ /workspaces/kbot (main) $ git add .
@mkdir28 ➜ /workspaces/kbot (main) $ git commit -m "update"
gitleaks not found. auto installation started.
gitleaks installed to .git/hooks
running gitleaks

    ○
    │╲
    │ ○
    ○ ░
    ░    gitleaks

Finding:     ...s.Getenv("TELE_TOKEN=870548010......."
Secret:      870548010.......
RuleID:      telegram-bot-api-token
Entropy:     5.039547
File:        cmd/kbot.go
Line:        19
Fingerprint: cmd/kbot.go:telegram-bot-api-token:19

2:43PM INF 1 commits scanned.
2:43PM INF scan completed in 5.74ms
2:43PM WRN leaks found: 1
Error
remove secrets
```
