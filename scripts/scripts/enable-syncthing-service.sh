#!/usr/bin/env bash
set -euo pipefail

# enables running syncthing on startup
systemctl --user enable --now syncthing.service
