#!/usr/bin/env bash
set -euo pipefail

MARK="$HOME/.install_done"
if [ -f "$MARK" ]; then
  echo "[install] already done."
  exit 0
fi

echo "[install] start"

# mark as done
git config --global --add safe.directory /api

# install psmisc
apt-get update && apt-get install -y psmisc

# install golangci-lint
curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/HEAD/install.sh | sh -s -- -b $(go env GOPATH)/bin v2.4.0

# install air
go install github.com/air-verse/air@latest
air -v