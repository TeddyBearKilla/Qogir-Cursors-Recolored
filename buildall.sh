#!/bin/bash

#  Check command avalibility
function has_command() {
  command -v $1 > /dev/null
}

if [[ ! "$(which xcursorgen 2> /dev/null)" ]]; then echo xorg-xcursorgen needs to be installed to generate the cursors.; if has_command zypper; then sudo zypper in xorg-xcursorgen; elif has_command apt; then sudo apt install xorg-xcursorgen; elif has_command dnf; then sudo dnf install -y xorg-xcursorgen; elif has_command dnf; then sudo dnf install xorg-xcursorgen; elif has_command pacman; then sudo pacman -S --noconfirm xorg-xcursorgen; fi; fi

if [[ ! "$(which inkscape 2> /dev/null)" ]]; then echo inkscape needs to be installed to generate the cursors.; if has_command zypper; then sudo zypper in inkscape; elif has_command apt; then sudo apt install inkscape; elif has_command dnf; then sudo dnf install -y inkscape; elif has_command dnf; then sudo dnf install inkscape; elif has_command pacman; then sudo pacman -S --noconfirm inkscape; fi; fi

function create {
	cd "$SRC"
	mkdir -p x1 x1_25 x1_5 x2

	cd "$SRC"/$1
	find . -name "*.svg" -type f -exec sh -c 'inkscape -o "../x1/${0%.svg}.png" -w 32 -h 32 $0' {} \;
	find . -name "*.svg" -type f -exec sh -c 'inkscape -o "../x1_25/${0%.svg}.png" -w 40 -w 40 $0' {} \;
	find . -name "*.svg" -type f -exec sh -c 'inkscape -o "../x1_5/${0%.svg}.png" -w 48 -w 48 $0' {} \;
	find . -name "*.svg" -type f -exec sh -c 'inkscape -o "../x2/${0%.svg}.png" -w 64 -w 64 $0' {} \;

	cd "$SRC"

	OUTPUT="$BUILD"/cursors
	ALIASES="$SRC"/cursorList

	if [ ! -d "$BUILD" ]; then
		mkdir "$BUILD"
	fi
	if [ ! -d "$OUTPUT" ]; then
		mkdir "$OUTPUT"
	fi

	echo -ne "Generating cursor theme...\\r"
	for CUR in config/*.cursor; do
		BASENAME="$CUR"
		BASENAME="${BASENAME##*/}"
		BASENAME="${BASENAME%.*}"
		
		xcursorgen "$CUR" "$OUTPUT/$BASENAME"
	done
	echo -e "Generating cursor theme... DONE"

	cd "$OUTPUT"

	#generate aliases
	echo -ne "Generating shortcuts...\\r"
	while read ALIAS; do
		FROM="${ALIAS#* }"
		TO="${ALIAS% *}"

		if [ -e $TO ]; then
			continue
		fi
		ln -sr "$FROM" "$TO"
	done < "$ALIASES"
	echo -e "Generating shortcuts... DONE"

	cd "$PWD"

	echo -ne "Generating Theme Index...\\r"
	INDEX="$OUTPUT/../index.theme"
	if [ ! -e "$OUTPUT/../$INDEX" ]; then
		touch "$INDEX"
		echo -e "[Icon Theme]\nName=$THEME\nComment=$THEME Cursor pack.\n" > "$INDEX"
	fi
	echo -e "Generating Theme Index... DONE"
}

# generate pixmaps from svg source
SRC=$PWD/src

cd "$SRC"
cp -r svg joris; cp -r svg joris2; cp -r svg joris3; cp -r svg joris4
cp -r svg blue; cp -r svg purple
cp -r svg cat-blue; cp -r svg cat-flamingo; cp -r svg cat-green; cp -r svg cat-macchiato; cp -r svg cat-maroon; cp -r svg cat-mauve; cp -r svg cat-peach; cp -r svg cat-pink; cp -r svg cat-red; cp -r svg cat-rosewater; cp -r svg cat-sapphire; cp -r svg cat-sky; cp -r svg cat-teal; cp -r svg cat-yellow
cp -r svg dracula-cyan ; cp -r svg dracula-green ; cp -r svg dracula-orange ; cp -r svg dracula-pink ; cp -r svg dracula-purple ; cp -r svg dracula-red; cp -r svg dracula-teddy ; cp -r svg dracula-yellow
cp -r svg gruvbox-aqua;  cp -r svg gruvbox-black; cp -r svg gruvbox-blue; cp -r svg gruvbox-gray;  cp -r svg gruvbox-green; cp -r svg gruvbox-mojas84;  cp -r svg gruvbox-orange;  cp -r svg gruvbox-purple;  cp -r svg gruvbox-white

# Main Color, Stroke, Accents, Context Menu (Help/Copy/Pencil), Loading BG, Loading FG, Skull/Not Allowed.
cd "$SRC"/joris && sed -i "s/#111111/#D699b6/g" `ls` && sed -i "s/#222222/#2d353b/g" `ls` && sed -i "s/#333333/#D699b6/g" `ls` && sed -i "s/#444444/#D699b6/g" `ls` && sed -i "s/#555555/#2d353b/g" `ls` && sed -i "s/#666666/#D699b6/g" `ls` && sed -i "s/#777777/#D699b6/g" `ls`

cd "$SRC"/joris2 && sed -i "s/#111111/#05D2AE/g" `ls` && sed -i "s/#222222/#012a23/g" `ls` && sed -i "s/#333333/#69E4CE/g" `ls` && sed -i "s/#444444/#05D2AE/g" `ls` && sed -i "s/#555555/#012a23/g" `ls` && sed -i "s/#666666/#05D2AE/g" `ls` && sed -i "s/#777777/#05D2AE/g" `ls`

cd "$SRC"/joris3 && sed -i "s/#111111/#D3C6AA/g" `ls` && sed -i "s/#222222/#4F585E/g" `ls` && sed -i "s/#333333/#e5ddcc/g" `ls` && sed -i "s/#444444/#D3C6AA/g" `ls` && sed -i "s/#555555/#4F585E/g" `ls` && sed -i "s/#666666/#D3C6AA/g" `ls` && sed -i "s/#777777/#D3C6AA/g" `ls`

cd "$SRC"/joris4 && sed -i "s/#111111/#2D353B/g" `ls` && sed -i "s/#222222/#D699B6/g" `ls` && sed -i "s/#333333/#2D353B/g" `ls` && sed -i "s/#444444/#2D353B/g" `ls` && sed -i "s/#555555/#D699B6/g" `ls` && sed -i "s/#666666/#2D353B/g" `ls` && sed -i "s/#777777/#2D353B/g" `ls`

cd "$SRC"/blue && sed -i "s/#111111/#7786ec/g" `ls` && sed -i "s/#222222/#181b2f/g" `ls` && sed -i "s/#333333/#adb6f4/g" `ls` && sed -i "s/#444444/#7786ec/g" `ls` && sed -i "s/#555555/#181b2f/g" `ls` && sed -i "s/#666666/#7786ec/g" `ls` && sed -i "s/#777777/#7786ec/g" `ls`

cd "$SRC"/purple && sed -i "s/#111111/#8a80e0/g" `ls` && sed -i "s/#222222/#1c1a2d/g" `ls` && sed -i "s/#333333/#c1bbfe/g" `ls` && sed -i "s/#444444/#8a80e0/g" `ls` && sed -i "s/#555555/#1c1a2d/g" `ls` && sed -i "s/#666666/#8a80e0/g" `ls` && sed -i "s/#777777/#8a80e0/g" `ls`

cd "$SRC"/cat-blue && sed -i "s/#111111/#89B4FA/g" `ls` && sed -i "s/#222222/#1b2432/g" `ls` && sed -i "s/#333333/#b8d2fc/g" `ls` && sed -i "s/#444444/#89B4FA/g" `ls` && sed -i "s/#555555/#1b2432/g" `ls` && sed -i "s/#666666/#89B4FA/g" `ls` && sed -i "s/#777777/#89B4FA/g" `ls`

cd "$SRC"/cat-flamingo && sed -i "s/#111111/#F2CDCD/g" `ls` && sed -i "s/#222222/#302929/g" `ls` && sed -i "s/#333333/#f7e1e1/g" `ls` && sed -i "s/#444444/#F2CDCD/g" `ls` && sed -i "s/#555555/#302929/g" `ls` && sed -i "s/#666666/#F2CDCD/g" `ls` && sed -i "s/#777777/#F2CDCD/g" `ls`

cd "$SRC"/cat-green && sed -i "s/#111111/#A6E3A1/g" `ls` && sed -i "s/#222222/#212d20/g" `ls` && sed -i "s/#333333/#caeec7/g" `ls` && sed -i "s/#444444/#A6E3A1/g" `ls` && sed -i "s/#555555/#212d20/g" `ls` && sed -i "s/#666666/#A6E3A1/g" `ls` && sed -i "s/#777777/#A6E3A1/g" `ls`

cd "$SRC"/cat-macchiato && sed -i "s/#111111/#24273A/g" `ls` && sed -i "s/#222222/#EFF1F5/g" `ls` && sed -i "s/#333333/#7c7d89/g" `ls` && sed -i "s/#444444/#24273A/g" `ls` && sed -i "s/#555555/#EFF1F5/g" `ls` && sed -i "s/#666666/#1d1f2e/g" `ls` && sed -i "s/#777777/#24273A/g" `ls`

cd "$SRC"/cat-maroon && sed -i "s/#111111/#EBA0AC/g" `ls` && sed -i "s/#222222/#2f2022/g" `ls` && sed -i "s/#333333/#f3c6cd/g" `ls` && sed -i "s/#444444/#EBA0AC/g" `ls` && sed -i "s/#555555/#2f2022/g" `ls` && sed -i "s/#666666/#EBA0AC/g" `ls` && sed -i "s/#777777/#EBA0AC/g" `ls`

cd "$SRC"/cat-mauve && sed -i "s/#111111/#cba6f7/g" `ls` && sed -i "s/#222222/#292131/g" `ls` && sed -i "s/#333333/#e0cafa/g" `ls` && sed -i "s/#444444/#cba6f7/g" `ls` && sed -i "s/#555555/#292131/g" `ls` && sed -i "s/#666666/#cba6f7/g" `ls` && sed -i "s/#777777/#cba6f7/g" `ls`

cd "$SRC"/cat-peach && sed -i "s/#111111/#FAB387/g" `ls` && sed -i "s/#222222/#32241b/g" `ls` && sed -i "s/#333333/#fcd1b7/g" `ls` && sed -i "s/#444444/#FAB387/g" `ls` && sed -i "s/#555555/#32241b/g" `ls` && sed -i "s/#666666/#FAB387/g" `ls` && sed -i "s/#777777/#FAB387/g" `ls`

cd "$SRC"/cat-pink && sed -i "s/#111111/#F5C2E7/g" `ls` && sed -i "s/#222222/#31272e/g" `ls` && sed -i "s/#333333/#f9daf1/g" `ls` && sed -i "s/#444444/#F5C2E7/g" `ls` && sed -i "s/#555555/#31272e/g" `ls` && sed -i "s/#666666/#F5C2E7/g" `ls` && sed -i "s/#777777/#F5C2E7/g" `ls`

cd "$SRC"/cat-red && sed -i "s/#111111/#F38BA8/g" `ls` && sed -i "s/#222222/#311c22/g" `ls` && sed -i "s/#333333/#f8b9cb/g" `ls` && sed -i "s/#444444/#F38BA8/g" `ls` && sed -i "s/#555555/#311c22/g" `ls` && sed -i "s/#666666/#F38BA8/g" `ls` && sed -i "s/#777777/#F38BA8/g" `ls`

cd "$SRC"/cat-rosewater && sed -i "s/#111111/#f5e0dc/g" `ls` && sed -i "s/#222222/#322529/g" `ls` && sed -i "s/#333333/#f9ecea/g" `ls` && sed -i "s/#444444/#f5e0dc/g" `ls` && sed -i "s/#555555/#322529/g" `ls` && sed -i "s/#666666/#f5e0dc/g" `ls` && sed -i "s/#777777/#f5e0dc/g" `ls`

cd "$SRC"/cat-sapphire && sed -i "s/#111111/#73C6EB/g" `ls` && sed -i "s/#222222/#17282f/g" `ls` && sed -i "s/#333333/#abddf3/g" `ls` && sed -i "s/#444444/#73C6EB/g" `ls` && sed -i "s/#555555/#17282f/g" `ls` && sed -i "s/#666666/#73C6EB/g" `ls` && sed -i "s/#777777/#73C6EB/g" `ls`

cd "$SRC"/cat-sky && sed -i "s/#111111/#89DCEB/g" `ls` && sed -i "s/#222222/#1b2c2f/g" `ls` && sed -i "s/#333333/#b8eaf3/g" `ls` && sed -i "s/#444444/#89DCEB/g" `ls` && sed -i "s/#555555/#1b2c2f/g" `ls` && sed -i "s/#666666/#89DCEB/g" `ls` && sed -i "s/#777777/#89DCEB/g" `ls`

cd "$SRC"/cat-teal && sed -i "s/#111111/#94E2D5/g" `ls` && sed -i "s/#222222/#1e2d2b/g" `ls` && sed -i "s/#333333/#bfeee6/g" `ls` && sed -i "s/#444444/#94E2D5/g" `ls` && sed -i "s/#555555/#1e2d2b/g" `ls` && sed -i "s/#666666/#94E2D5/g" `ls` && sed -i "s/#777777/#94E2D5/g" `ls`

cd "$SRC"/cat-yellow && sed -i "s/#111111/#F9E2AF/g" `ls` && sed -i "s/#222222/#322d23/g" `ls` && sed -i "s/#333333/#fbeecf/g" `ls` && sed -i "s/#444444/#F9E2AF/g" `ls` && sed -i "s/#555555/#322d23/g" `ls` && sed -i "s/#666666/#F9E2AF/g" `ls` && sed -i "s/#777777/#F9E2AF/g" `ls`

cd "$SRC"/dracula-cyan && sed -i "s/#111111/#282A36/g" `ls` && sed -i "s/#222222/#8be9fd/g" `ls` && sed -i "s/#333333/#538c98/g" `ls` && sed -i "s/#444444/#282A36/g" `ls` && sed -i "s/#555555/#8be9fd/g" `ls` && sed -i "s/#666666/#282A36/g" `ls` && sed -i "s/#777777/#282A36/g" `ls`

cd "$SRC"/dracula-green && sed -i "s/#111111/#282A36/g" `ls` && sed -i "s/#222222/#50fa7b/g" `ls` && sed -i "s/#333333/#30964a/g" `ls` && sed -i "s/#444444/#282A36/g" `ls` && sed -i "s/#555555/#50fa7b/g" `ls` && sed -i "s/#666666/#282A36/g" `ls` && sed -i "s/#777777/#282A36/g" `ls`

cd "$SRC"/dracula-orange && sed -i "s/#111111/#282A36/g" `ls` && sed -i "s/#222222/#ffb86c/g" `ls` && sed -i "s/#333333/#996e41/g" `ls` && sed -i "s/#444444/#282A36/g" `ls` && sed -i "s/#555555/#ffb86c/g" `ls` && sed -i "s/#666666/#282A36/g" `ls` && sed -i "s/#777777/#282A36/g" `ls`

cd "$SRC"/dracula-pink && sed -i "s/#111111/#282A36/g" `ls` && sed -i "s/#222222/#ff79c6/g" `ls` && sed -i "s/#333333/#994977/g" `ls` && sed -i "s/#444444/#282A36/g" `ls` && sed -i "s/#555555/#ff79c6/g" `ls` && sed -i "s/#666666/#282A36/g" `ls` && sed -i "s/#777777/#282A36/g" `ls`

cd "$SRC"/dracula-purple && sed -i "s/#111111/#282A36/g" `ls` && sed -i "s/#222222/#bd93f9/g" `ls` && sed -i "s/#333333/#715895/g" `ls` && sed -i "s/#444444/#282A36/g" `ls` && sed -i "s/#555555/#bd93f9/g" `ls` && sed -i "s/#666666/#282A36/g" `ls` && sed -i "s/#777777/#282A36/g" `ls`

cd "$SRC"/dracula-red && sed -i "s/#111111/#282A36/g" `ls` && sed -i "s/#222222/#ff5555/g" `ls` && sed -i "s/#333333/#993333/g" `ls` && sed -i "s/#444444/#282A36/g" `ls` && sed -i "s/#555555/#ff5555/g" `ls` && sed -i "s/#666666/#282A36/g" `ls` && sed -i "s/#777777/#282A36/g" `ls`

cd "$SRC"/dracula-teddy && sed -i "s/#111111/#282A36/g" `ls` && sed -i "s/#222222/#988dfd/g" `ls` && sed -i "s/#333333/#1e1c33/g" `ls` && sed -i "s/#444444/#282A36/g" `ls` && sed -i "s/#555555/#1e1c33/g" `ls` && sed -i "s/#666666/#988dfd/g" `ls` && sed -i "s/#777777/#282A36/g" `ls`

cd "$SRC"/dracula-yellow && sed -i "s/#111111/#282A36/g" `ls` && sed -i "s/#222222/#f1fa8c/g" `ls` && sed -i "s/#333333/#919654/g" `ls` && sed -i "s/#444444/#282A36/g" `ls` && sed -i "s/#555555/#f1fa8c/g" `ls` && sed -i "s/#666666/#282A36/g" `ls` && sed -i "s/#777777/#282A36/g" `ls`

cd "$SRC"/gruvbox-aqua && sed -i "s/#111111/#8ec07c/g" `ls` && sed -i "s/#222222/#1c2619/g" `ls` && sed -i "s/#333333/#bbd9b0/g" `ls` && sed -i "s/#444444/#8ec07c/g" `ls` && sed -i "s/#555555/#1c2619/g" `ls` && sed -i "s/#666666/#8ec07c/g" `ls` && sed -i "s/#777777/#8ec07c/g" `ls`

cd "$SRC"/gruvbox-black && sed -i "s/#111111/#282828/g" `ls` && sed -i "s/#222222/#ebdbb2/g" `ls` && sed -i "s/#333333/#7e7e7e/g" `ls` && sed -i "s/#444444/#282828/g" `ls` && sed -i "s/#555555/#181818/g" `ls` && sed -i "s/#666666/#ebdbb2/g" `ls` && sed -i "s/#777777/#282828/g" `ls`

cd "$SRC"/gruvbox-blue && sed -i "s/#111111/#83a598/g" `ls` && sed -i "s/#222222/#1a211e/g" `ls` && sed -i "s/#333333/#b5c9c1/g" `ls` && sed -i "s/#444444/#83a598/g" `ls` && sed -i "s/#555555/#1a211e/g" `ls` && sed -i "s/#666666/#83a598/g" `ls` && sed -i "s/#777777/#83a598/g" `ls`

cd "$SRC"/gruvbox-gray && sed -i "s/#111111/#928374/g" `ls` && sed -i "s/#222222/#1d1a17/g" `ls` && sed -i "s/#333333/#beb5ac/g" `ls` && sed -i "s/#444444/#928374/g" `ls` && sed -i "s/#555555/#1d1a17/g" `ls` && sed -i "s/#666666/#928374/g" `ls` && sed -i "s/#777777/#928374/g" `ls`

cd "$SRC"/gruvbox-green && sed -i "s/#111111/#b8bb26/g" `ls` && sed -i "s/#222222/#252508/g" `ls` && sed -i "s/#333333/#d4d67d/g" `ls` && sed -i "s/#444444/#b8bb26/g" `ls` && sed -i "s/#555555/#252508/g" `ls` && sed -i "s/#666666/#b8bb26/g" `ls` && sed -i "s/#777777/#b8bb26/g" `ls`

cd "$SRC"/gruvbox-mojas84 && sed -i "s/#111111/#B16286/g" `ls` && sed -i "s/#222222/#23141b/g" `ls` && sed -i "s/#333333/#d0a1b6/g" `ls` && sed -i "s/#444444/#B16286/g" `ls` && sed -i "s/#555555/#23141b/g" `ls` && sed -i "s/#666666/#B16286/g" `ls` && sed -i "s/#777777/#B16286/g" `ls`

cd "$SRC"/gruvbox-orange && sed -i "s/#111111/#fe8019/g" `ls` && sed -i "s/#222222/#331a05/g" `ls` && sed -i "s/#333333/#feb375/g" `ls` && sed -i "s/#444444/#fe8019/g" `ls` && sed -i "s/#555555/#331a05/g" `ls` && sed -i "s/#666666/#fe8019/g" `ls` && sed -i "s/#777777/#fe8019/g" `ls`

cd "$SRC"/gruvbox-purple && sed -i "s/#111111/#d3869b/g" `ls` && sed -i "s/#222222/#2a1b1f/g" `ls` && sed -i "s/#333333/#e5b6c3/g" `ls` && sed -i "s/#444444/#d3869b/g" `ls` && sed -i "s/#555555/#2a1b1f/g" `ls` && sed -i "s/#666666/#d3869b/g" `ls` && sed -i "s/#777777/#d3869b/g" `ls`

cd "$SRC"/gruvbox-white && sed -i "s/#111111/#ebdbb2/g" `ls` && sed -i "s/#222222/#2f2c24/g" `ls` && sed -i "s/#333333/#f3e9d1/g" `ls` && sed -i "s/#444444/#ebdbb2/g" `ls` && sed -i "s/#555555/#2f2c24/g" `ls` && sed -i "s/#666666/#ebdbb2/g" `ls` && sed -i "s/#777777/#ebdbb2/g" `ls`
# Main Color, Stroke, Accents, Context Menu (Help/Copy/Pencil), Loading BG, Loading FG, Skull/Not Allowed.

THEME="Qogir Joris v2"
BUILD="$SRC/../dist/dist-joris"
create joris
echo Qogir Joris v2 Done...

THEME="Qogir Joris 2 v2"
BUILD="$SRC/../dist/dist-joris2"
create joris2
echo Qogir Joris 2 v2 Done...

THEME="Qogir Joris 3 v2"
BUILD="$SRC/../dist/dist-joris3"
create joris3
echo Qogir Joris 3 v2 Done...

THEME="Qogir Joris 4 v2"
BUILD="$SRC/../dist/dist-joris4"
create joris4
echo Qogir Joris 4 v2 Done...

THEME="Qogir Blue v2"
BUILD="$SRC/../dist/dist-blue"
create blue
echo Qogir Blue v2 Done...

THEME="Qogir Purple v2"
BUILD="$SRC/../dist/dist-purple"
create purple
echo Qogir Purple v2 Done...

THEME="Qogir Catppuccin Blue v2"
BUILD="$SRC/../dist/dist-cat-blue"
create cat-blue
echo Qogir Catppuccin Blue v2 Done...

THEME="Qogir Catppuccin Flamingo v2"
BUILD="$SRC/../dist/dist-cat-flamingo"
create cat-flamingo
echo Qogir Catppuccin Flamingo v2 Done...

THEME="Qogir Catppuccin Green v2"
BUILD="$SRC/../dist/dist-cat-green"
create cat-green
echo Qogir Catppuccin Green v2 Done...

THEME="Qogir Catppuccin Macchiato v2"
BUILD="$SRC/../dist/dist-cat-macchiato"
create cat-macchiato
echo Qogir Catppuccin Macchiato v2 Done...

THEME="Qogir Catppuccin Maroon v2"
BUILD="$SRC/../dist/dist-cat-maroon"
create cat-maroon
echo Qogir Catppuccin Maroon v2 Done...

THEME="Qogir Catppuccin Mauve v2"
BUILD="$SRC/../dist/dist-cat-mauve"
create cat-mauve
echo Qogir Catppuccin Mauve v2 Done...

THEME="Qogir Catppuccin Peach v2"
BUILD="$SRC/../dist/dist-cat-peach"
create cat-peach
echo Qogir Catppuccin Peach v2 Done...

THEME="Qogir Catppuccin Pink v2"
BUILD="$SRC/../dist/dist-cat-pink"
create cat-pink
echo Qogir Catppuccin Pink v2 Done...

THEME="Qogir Catppuccin Red v2"
BUILD="$SRC/../dist/dist-cat-red"
create cat-red
echo Qogir Catppuccin Red v2 Done...

THEME="Qogir Catppuccin Rosewater v2"
BUILD="$SRC/../dist/dist-cat-rosewater"
create cat-rosewater
echo Qogir Catppuccin Rosewater v2 Done...

THEME="Qogir Catppuccin Sapphire v2"
BUILD="$SRC/../dist/dist-cat-sapphire"
create cat-sapphire
echo Qogir Catppuccin Sapphire v2 Done...

THEME="Qogir Catppuccin Sky v2"
BUILD="$SRC/../dist/dist-cat-sky"
create cat-sky
echo Qogir Catppuccin Sky v2 Done...

THEME="Qogir Catppuccin Teal v2"
BUILD="$SRC/../dist/dist-cat-teal"
create cat-teal
echo Qogir Catppuccin Teal v2 Done...

THEME="Qogir Catppuccin Yellow v2"
BUILD="$SRC/../dist/dist-cat-yellow"
create cat-yellow
echo Qogir Catppuccin Yellow v2 Done...

THEME="Qogir Dracula Cyan"
BUILD="$SRC/../dist/dist-dracula-cyan"
create dracula-cyan
echo Qogir Dracula Cyan Done...

THEME="Qogir Dracula Green"
BUILD="$SRC/../dist/dist-dracula-green"
create dracula-green
echo Qogir Dracula Green Done...

THEME="Qogir Dracula Orange"
BUILD="$SRC/../dist/dist-dracula-orange"
create dracula-orange
echo Qogir Dracula Orange Done...

THEME="Qogir Dracula Pink"
BUILD="$SRC/../dist/dist-dracula-pink"
create dracula-pink
echo Qogir Dracula Pink Done...

THEME="Qogir Dracula Purple"
BUILD="$SRC/../dist/dist-dracula-purple"
create dracula-purple
echo Qogir Dracula Purple Done...

THEME="Qogir Dracula Red"
BUILD="$SRC/../dist/dist-dracula-red"
create dracula-red
echo Qogir Dracula Red Done...

THEME="Qogir Dracula Teddy"
BUILD="$SRC/../dist/dist-dracula-teddy"
create dracula-teddy
echo Qogir Dracula Teddy Done...

THEME="Qogir Dracula Yellow"
BUILD="$SRC/../dist/dist-dracula-yellow"
create dracula-yellow
echo Qogir Dracula Yellow Done...

THEME="Qogir Gruvbox Aqua"
BUILD="$SRC/../dist/dist-gruvbox-aqua"
create gruvbox-aqua
echo Qogir Gruvbox Aqua Done...

THEME="Qogir Gruvbox Black"
BUILD="$SRC/../dist/dist-gruvbox-black"
create gruvbox-black
echo Qogir Gruvbox Black Done...

THEME="Qogir Gruvbox Blue"
BUILD="$SRC/../dist/dist-gruvbox-blue"
create gruvbox-blue
echo Qogir Gruvbox Blue Done...

THEME="Qogir Gruvbox Gray"
BUILD="$SRC/../dist/dist-gruvbox-gray"
create gruvbox-gray
echo Qogir Gruvbox Gray Done...

THEME="Qogir Gruvbox Green"
BUILD="$SRC/../dist/dist-gruvbox-green"
create gruvbox-green
echo Qogir Gruvbox Green Done...

THEME="Qogir Gruvbox Mojas84"
BUILD="$SRC/../dist/dist-gruvbox-mojas84"
create gruvbox-mojas84
echo Qogir Gruvbox Mojas84 Done...

THEME="Qogir Gruvbox Orange"
BUILD="$SRC/../dist/dist-gruvbox-orange"
create gruvbox-orange
echo Qogir Gruvbox Orange Done...

THEME="Qogir Gruvbox Purple"
BUILD="$SRC/../dist/dist-gruvbox-purple"
create gruvbox-purple
echo Qogir Gruvbox Purple Done...

THEME="Qogir Gruvbox White"
BUILD="$SRC/../dist/dist-gruvbox-white"
create gruvbox-white
echo Qogir Gruvbox White Done...

cd "$SRC"
rm -rf joris joris2 joris3 joris4 blue purple valen cat-blue cat-flamingo cat-green cat-macchiato cat-maroon cat-mauve cat-peach cat-pink cat-red cat-rosewater cat-sapphire cat-sky cat-teal cat-yellow dracula-cyan dracula-green dracula-orange dracula-pink dracula-purple dracula-red dracula-teddy dracula-yellow gruvbox-aqua gruvbox-black gruvbox-blue gruvbox-gray gruvbox-green gruvbox-mojas84 gruvbox-orange gruvbox-purple gruvbox-white x1 x1_25 x1_5 x2

echo All cursors exported to the dist/ directory!
