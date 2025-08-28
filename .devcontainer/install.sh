#!/usr/bin/env bash
set -euo pipefail

MARK="$HOME/.install_done"
if [ -f "$MARK" ]; then
  echo "[install] already done."
  exit 0
fi

echo "[install] start"

# install psmisc
apt-get update && apt-get install -y psmisc

# install air
go install github.com/air-verse/air@latest
air -v