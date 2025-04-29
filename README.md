# 📦 kelm

> Extended lightweight CLI on top of `kubectl` + `helm` to operate resources by Helm **release**.

---

## ✨ Features

- Quickly get, describe, tail logs, or top metrics for resources deployed via Helm releases.
- Simple and consistent usage across pods, services, deployments, etc.
- Namespace-aware (`-n` flag support).
- Minimal dependencies (`kubectl`, `helm`, `metrics-server` for `top`).

---

## 📥 Installation

### Option 1: Manual Installation

To install `kelm` manually on your local machine, follow these steps:

1. **Clone the Repository**

    ```bash
    git clone https://github.com/yourname/kelm.git
    cd kelm
    ```

2. **Make the Script Executable**

    Ensure that the `kelm` script has executable permissions:

    ```bash
    chmod +x kelm
    ```

3. **Move `kelm` to a Directory in Your PATH**

    Move the `kelm` script to `/usr/local/bin/` (or any directory in your system's `$PATH`):

    ```bash
    sudo mv kelm /usr/local/bin/
    ```

    Now, `kelm` is available globally for use in your terminal.

---

### Usage

You can run `kelm` from the command line by providing it the following options:

```bash
kelm [get|describe|logs|top] <resource> -r <release> [-n <namespace>]
