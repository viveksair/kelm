
# kelm 🧭 – Helm-Aware `kubectl` Filtering Tool

[![Shell Script](https://img.shields.io/badge/built_with-bash-1f425f.svg)](https://www.gnu.org/software/bash/)
[![License: MIT](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](https://github.com/yourname/kelm/pulls)

`kelm` is a `kubectl` plugin that lets you select a Helm release and automatically filters all relevant `kubectl` commands by namespace and label.

## ✨ Features

- Select a Helm release (`kubectl kelm select`)
- Automatically filters `kubectl` calls by namespace and release label
- Easily reset the selection (`kubectl kelm clear`)
- Smart wrapper skips filters for global commands (`-A`) or unsupported ones

## 📦 Installation

```bash
git clone https://github.com/yourname/kelm.git
cd kelm
chmod +x kubectl-kelm
chmod +x wrapper.sh
cp kubectl-kelm ~/.local/bin/
source wrapper.sh
```

## 🔧 Setup
```bash
source /path/to/kelm/wrapper.sh
```

## 🚀 Usage
```sh
kubectl kelm select     # Pick a Helm release
k get pods              # Filters by namespace and label
k get pods -A           # Shows all pods (no filtering)
kubectl kelm clear      # Clear the release selection
```

## 📂 Config
kelm stores the selected release in:
```sh
~/.kube/kelm/config   # Format: release,namespace
```

## 🧪 Examples
```sh
kubectl kelm select
# Select: myapp / staging

k get pods
# => kubectl get pods -n staging --selector=app.kubernetes.io/instance=myapp

k get svc
# => kubectl get svc -n staging --selector=app.kubernetes.io/instance=myapp

k get pods -A
# => kubectl get pods -A   (no filters added)

kubectl kelm clear
k get pods
# => kubectl get pods      (runs plain command)

```

❌ Clear Current Selection
```bash
kubectl kelm clear
```

## ✨ Features

- 🔍 Interactive Helm release selector
- 🔐 Automatically applies `--selector=app.kubernetes.io/instance=<release>` and `-n <namespace>` to kubectl
- 🔄 Full compatibility with `kubectl`; nothing injected on `-A` or unsupported commands
- 🧼 Clear selection at any time
- 🧠 Smart shell wrapper that doesn't break your normal workflows

## 🪪 License
MIT License — see LICENSE