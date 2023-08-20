#!/bin/bash

ROOT_UID=0
DEST_DIR=

# Destination directory
if [ "$UID" -eq "$ROOT_UID" ]; then
  DEST_DIR="/usr/share/icons"
else
  DEST_DIR="$HOME/.local/share/icons"
fi

if [ -d "$DEST_DIR/Qogir-Recolored-Dracula-Teddy" ]; then
  rm -r "$DEST_DIR/Qogir-Recolored-Dracula-Teddy"
fi

cp -pr dist-dracula-teddy $DEST_DIR/Qogir-Recolored-Dracula-Teddy

echo "Finished..."

