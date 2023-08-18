#!/bin/bash

ROOT_UID=0
DEST_DIR=

# Destination directory
if [ "$UID" -eq "$ROOT_UID" ]; then
  DEST_DIR="/usr/share/icons"
else
  DEST_DIR="$HOME/.local/share/icons"
fi

if [ -d "$DEST_DIR/Qogir-Recolored-Dracula-Yellow" ]; then
  rm -r "$DEST_DIR/Qogir-Recolored-Dracula-Yellow"
fi

cp -pr dist-dracula-yellow $DEST_DIR/Qogir-Recolored-Dracula-Yellow

echo "Finished..."

