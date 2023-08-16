#!/bin/bash

ROOT_UID=0
DEST_DIR=
DISTR=Qogir-Recolored-Catppuccin-Macchiato/

# Destination directory
if [ "$UID" -eq "$ROOT_UID" ]; then
  DEST_DIR="/usr/share/icons"
else
  DEST_DIR="$HOME/.local/share/icons"
fi

if [ -d "$DEST_DIR/$DISTR" ]; then
  rm -r "$DEST_DIR/$DISTR"
fi

cp -r $DISTR $DEST_DIR

echo "Finished copying ..."

