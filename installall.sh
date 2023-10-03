#!/usr/bin/env bash

ROOT_UID=0
DEST_DIR=
QR=Qogir-Recolored
QRC=Qogir-Recolored-Catppuccin
QRD=Qogir-Recolored-Dracula
QRG=Qogir-Recolored-Gruvbox
D=dist
DC=dist-cat
DD=dist-dracula
DG=dist-gruvbox

# Destination directory
if [ "$UID" -eq "$ROOT_UID" ]; then
  DEST_DIR="/usr/share/icons"
else
  DEST_DIR="$HOME/.local/share/icons"
fi

if [ -d "$DEST_DIR/$QR-Joris" ]; then rm -r "$DEST_DIR/$QR-Joris"; fi
if [ -d "$DEST_DIR/$QR-Joris2" ]; then rm -r "$DEST_DIR/$QR-Joris2"; fi
if [ -d "$DEST_DIR/$QR-Joris3" ]; then rm -r "$DEST_DIR/$QR-Joris3"; fi
if [ -d "$DEST_DIR/$QR-Joris4" ]; then rm -r "$DEST_DIR/$QR-Joris4"; fi
if [ -d "$DEST_DIR/$QR-Blue-v2" ]; then rm -r "$DEST_DIR/$QR-Blue-v2"; fi
if [ -d "$DEST_DIR/$QR-Purple-v2" ]; then rm -r "$DEST_DIR/$QR-Purple-v2"; fi
if [ -d "$DEST_DIR/$QRC-Blue-v2" ]; then rm -r "$DEST_DIR/$QRC-Blue-v2"; fi
if [ -d "$DEST_DIR/$QRC-Flamingo-v2" ]; then rm -r "$DEST_DIR/$QRC-Flamingo-v2"; fi
if [ -d "$DEST_DIR/$QRC-Green-v2" ]; then rm -r "$DEST_DIR/$QRC-Green-v2"; fi
if [ -d "$DEST_DIR/$QRC-Macchiato-v2" ]; then rm -r "$DEST_DIR/$QRC-Macchiato-v2"; fi
if [ -d "$DEST_DIR/$QRC-Maroon-v2" ]; then rm -r "$DEST_DIR/$QRC-Maroon-v2"; fi
if [ -d "$DEST_DIR/$QRC-Mauve-v2" ]; then rm -r "$DEST_DIR/$QRC-Mauve-v2"; fi
if [ -d "$DEST_DIR/$QRC-Peach-v2" ]; then rm -r "$DEST_DIR/$QRC-Peach-v2"; fi
if [ -d "$DEST_DIR/$QRC-Pink-v2" ]; then rm -r "$DEST_DIR/$QRC-Pink-v2"; fi
if [ -d "$DEST_DIR/$QRC-Red-v2" ]; then rm -r "$DEST_DIR/$QRC-Red-v2"; fi
if [ -d "$DEST_DIR/$QRC-Rosewater-v2" ]; then rm -r "$DEST_DIR/$QRC-Rosewater-v2"; fi
if [ -d "$DEST_DIR/$QRC-Sapphire-v2" ]; then rm -r "$DEST_DIR/$QRC-Sapphire-v2"; fi
if [ -d "$DEST_DIR/$QRC-Sky-v2" ]; then rm -r "$DEST_DIR/$QRC-Sky-v2"; fi
if [ -d "$DEST_DIR/$QRC-Teal-v2" ]; then rm -r "$DEST_DIR/$QRC-Teal-v2"; fi
if [ -d "$DEST_DIR/$QRC-Yellow-v2" ]; then rm -r "$DEST_DIR/$QRC-Yellow-v2"; fi
if [ -d "$DEST_DIR/$QRD-Cyan" ]; then rm -r "$DEST_DIR/$QRD-Cyan"; fi
if [ -d "$DEST_DIR/$QRD-Green" ]; then rm -r "$DEST_DIR/$QRD-Green"; fi
if [ -d "$DEST_DIR/$QRD-Orange" ]; then rm -r "$DEST_DIR/$QRD-Orange"; fi
if [ -d "$DEST_DIR/$QRD-Pink" ]; then rm -r "$DEST_DIR/$QRD-Pink"; fi
if [ -d "$DEST_DIR/$QRD-Purple" ]; then rm -r "$DEST_DIR/$QRD-Purple"; fi
if [ -d "$DEST_DIR/$QRD-Red" ]; then rm -r "$DEST_DIR/$QRD-Red"; fi
if [ -d "$DEST_DIR/$QRD-Teddy" ]; then rm -r "$DEST_DIR/$QRD-Teddy"; fi
if [ -d "$DEST_DIR/$QRD-Yellow" ]; then rm -r "$DEST_DIR/$QRD-Yellow"; fi
if [ -d "$DEST_DIR/$QRG-Aqua" ]; then rm -r "$DEST_DIR/$QRG-Aqua"; fi
if [ -d "$DEST_DIR/$QRG-Black" ]; then rm -r "$DEST_DIR/$QRG-Black"; fi
if [ -d "$DEST_DIR/$QRG-Blue" ]; then rm -r "$DEST_DIR/$QRG-Blue"; fi
if [ -d "$DEST_DIR/$QRG-Gray" ]; then rm -r "$DEST_DIR/$QRG-Gray"; fi
if [ -d "$DEST_DIR/$QRG-Green" ]; then rm -r "$DEST_DIR/$QRG-Green"; fi
if [ -d "$DEST_DIR/$QRG-Mojas84" ]; then rm -r "$DEST_DIR/$QRG-Mojas84"; fi
if [ -d "$DEST_DIR/$QRG-Orange" ]; then rm -r "$DEST_DIR/$QRG-Orange"; fi
if [ -d "$DEST_DIR/$QRG-Purple" ]; then rm -r "$DEST_DIR/$QRG-Purple"; fi
if [ -d "$DEST_DIR/$QRG-White" ]; then rm -r "$DEST_DIR/$QRG-White"; fi

cd $D/

cp -r $D-joris/ $DEST_DIR/$QR-Joris-v2
cp -r $D-joris2/ $DEST_DIR/$QR-Joris-2-v2
cp -r $D-joris3/ $DEST_DIR/$QR-Joris-3-v2
cp -r $D-joris4/ $DEST_DIR/$QR-Joris-4-v2
cp -r $D-blue/ $DEST_DIR/$QR-Blue-v2
cp -r $D-purple/ $DEST_DIR/$QR-Purple-v2
cp -r $DC-blue/ $DEST_DIR/$QRC-Blue-v2
cp -r $DC-flamingo/ $DEST_DIR/$QRC-Flamingo-v2
cp -r $DC-green/ $DEST_DIR/$QRC-Green-v2
cp -r $DC-macchiato/ $DEST_DIR/$QRC-Macchiato-v2
cp -r $DC-maroon/ $DEST_DIR/$QRC-Maroon-v2
cp -r $DC-mauve/ $DEST_DIR/$QRC-Mauve-v2
cp -r $DC-peach/ $DEST_DIR/$QRC-Peach-v2
cp -r $DC-pink/ $DEST_DIR/$QRC-Pink-v2
cp -r $DC-red/ $DEST_DIR/$QRC-Red-v2
cp -r $DC-rosewater/ $DEST_DIR/$QRC-Rosewater-v2
cp -r $DC-sapphire/ $DEST_DIR/$QRC-Sapphire-v2
cp -r $DC-sky/ $DEST_DIR/$QRC-Sky-v2
cp -r $DC-teal/ $DEST_DIR/$QRC-Teal-v2
cp -r $DC-yellow/ $DEST_DIR/$QRC-Yellow-v2
cp -r $DD-cyan/ $DEST_DIR/$QRD-Cyan
cp -r $DD-green/ $DEST_DIR/$QRD-Green
cp -r $DD-orange/ $DEST_DIR/$QRD-Orange
cp -r $DD-pink/ $DEST_DIR/$QRD-Pink
cp -r $DD-purple/ $DEST_DIR/$QRD-Purple
cp -r $DD-red/ $DEST_DIR/$QRD-Red
cp -r $DD-teddy/ $DEST_DIR/$QRD-Teddy
cp -r $DD-yellow/ $DEST_DIR/$QRD-Yellow
cp -r $DG-aqua/ $DEST_DIR/$QRG-Aqua
cp -r $DG-black/ $DEST_DIR/$QRG-Black
cp -r $DG-blue/ $DEST_DIR/$QRG-Blue
cp -r $DG-gray/ $DEST_DIR/$QRG-Gray
cp -r $DG-green/ $DEST_DIR/$QRG-Green
cp -r $DG-mojas84/ $DEST_DIR/$QRG-Mojas84
cp -r $DG-orange/ $DEST_DIR/$QRG-Orange
cp -r $DG-purple/ $DEST_DIR/$QRG-Purple
cp -r $DG-white/ $DEST_DIR/$QRG-White

echo "Finished..."

