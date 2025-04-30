#!/bin/bash
mkdir -p ~/.kube/kelm
cp kubectl-kelm ~/.local/bin/
chmod +x ~/.local/bin/kubectl-kelm
echo "✅ kelm plugin installed to ~/.local/bin/"