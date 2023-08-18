#!/bin/bash

ROOT_UID=0
DEST_DIR=

# Destination directory
if [ "$UID" -eq "$ROOT_UID" ]; then
  DEST_DIR="/usr/share/icons"
else
  DEST_DIR="$HOME/.local/share/icons"
fi

if [ -d "$DEST_DIR/Qogir-Recolored-Joris-2-v2" ]; then
  rm -r "$DEST_DIR/Qogir-Recolored-Joris-2-v2"
fi

cp -pr dist-joris2 $DEST_DIR/Qogir-Recolored-Joris-2-v2

echo "Finished..."

