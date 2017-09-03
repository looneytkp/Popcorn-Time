#!/bin/sh
#script 3.6 by LooNeyTKp™

#exits shell when there is an error
set -e
NC='\033[0m' # No Color
YELLOW='\033[1;33m'
LIGHT_CYAN='\033[1;36m'
LIGHT_PURPLE='\033[1;35m'

startscript() {
sleep 0.5
echo "
"
startinstall
}

startinstall() {
echo "         ${LIGHT_PURPLE}Installing Popcorn Time${YELLOW}"
cd /home/$USER
if [ -d popcorntime ]; then
rm -r popcorntime && mkdir popcorntime
else
mkdir popcorntime
fi
cd -
cp Popcorn-Time-0.3.10-Linux-64.tar.xz /home/$USER/popcorntime/
cd /home/$USER/popcorntime
#unpacking popcorn time archive
tar xf Popcorn-Time-0.3.10-Linux-64.tar.xz &
pid=$! # Process Id of the running command
printf "["
i=0
while kill -0 $pid 2>/dev/null
do
  i=$(( (i+1) %4 ))
  printf "#"
  sleep .2
done
echo "]
Done!"${NC}
#delete Popcorn-Time-0.3.10-Linux-32.tar.xz in /popcorntime
rm Popcorn-Time-0.3.10-Linux-64.tar.xz
sleep 0.4
createprompt
}

desktopentry() {
# Adds a desktop entry for the current user
	NAME="Popcorn Time"
	COMMENT="Watch Movies and TV Shows instantly!"

	CURRENT_DIR=$(pwd)
	EXECUTABLE=$CURRENT_DIR/Popcorn-Time
	ICON_PATH=$CURRENT_DIR/src/app/images/icon.png

	DESTINATION_DIR=/home/$(whoami)/.local/share/applications
	DESKTOP_FILE=$DESTINATION_DIR/popcorn-time.desktop

	echo "[Desktop Entry]" > $DESKTOP_FILE
	echo "Version=1.0" >> $DESKTOP_FILE
	echo "Type=Application" >> $DESKTOP_FILE
	echo "Name=$NAME" >> $DESKTOP_FILE
	echo "Icon=$ICON_PATH" >> $DESKTOP_FILE
	echo "Exec=\"$EXECUTABLE\" %U" >> $DESKTOP_FILE
	echo "Comment=$COMMENT" >> $DESKTOP_FILE
	echo "Categories=Multimedia;" >> $DESKTOP_FILE
	echo "Terminal=false" >> $DESKTOP_FILE

	# Updates the desktop entries
	gtk-update-icon-cache /usr/share/icons/hicolor

	echo "Desktop entry added for $(whoami)"
  launch
}

createprompt() {
echo "Create a desktop entry for Popcorn Time for the current user ? (Y)es/(N)o: "
read -n1 input
if [ "$input" == "Y" ] || [ "$input" == "y" ] || [ "$input" == "" ]
then
	case "$(uname)" in
		Linux)
			desktopentry ;;
		Darwin)
			echo "Create a desktop entry is only meant to be used on Linux" ;;
	esac
else
	echo -e "Cancel. /nJust execute ./Create-Desktop-Entry when you are ready to create a desktop entry for Popcorn Time"
fi
}

entry() {
#creating desktop entry
echo
echo "${LIGHT_PURPLE}Creating Desktop Entry${YELLOW}"
echo
wget https://raw.githubusercontent.com/popcorn-official/popcorn-desktop/development/Create-Desktop-Entry
#setting permissions
echo
echo "${LIGHT_PURPLE}Setting permissions${YELLOW}"
chmod +x Create-Desktop-Entry
#chmod 755 Create-Desktop-Entry
sleep 1
#ls -l Create-Desktop-Entry
echo "Done!${NC}"
#executing create-desktop-entry script
./Create-Desktop-Entry
notice
}

entry2() {
#creating desktop entry
echo "${LIGHT_PURPLE}Creating Desktop Entry${YELLOW}"
wget https://raw.githubusercontent.com/popcorn-official/popcorn-desktop/development/Create-Desktop-Entry
#setting permissions
echo "${LIGHT_PURPLE}Applying possible fix${YELLOW}"
chmod +x Create-Desktop-Entry
chmod 755 Create-Desktop-Entry
s#leep 1
ls -l Create-Desktop-Entry
echo "${LIGHT_PURPLE}Possible fix applied${YELLOW}"
#executing create-desktop-entry script
./Create-Desktop-Entry
notice2
}

checkpermtrap() {
while :
do
trap checkperm EXIT
checkperm
break
done
}

notice() {
echo
echo "${LIGHT_CYAN}Due to issues with setting permissions for desktop entry, scroll up a bit & check from "Settings permissions" for any "Permission denied" output. If it exists, select fix permissions  below to apply a possible fix set permissions correctly, select continue if there is not "Permission denied" output.${NC}"
checkperm
}

notice2() {
echo
echo "${LIGHT_CYAN}Possible fix is applied, yet scroll up a bit & check for from "Applying possible fix " for any "Permission denied" output. If it still exists please file a report. If not then the fix was successful.${NC}"
sleep 3
launch
}


checkperm() {
echo "
${LIGHT_PURPLE}1) Fix permission
2) Continue"
read -p "-> " answer
if [ "$answer" = "1" ]; then
rm Create-Desktop-Entry
entry2
fi
if [ "$answer" = "2" ]; then
launch
fi
if [ "$answer" = " " ]; then
echo "Error! No input detected"
checkpermtrap
fi
if [ "$answer" != "1" ] || [ "$answer" != "2" ]; then
echo "Invalid figure"
checkpermtrap
fi
}

installcomplete() {
sleep 0.7
echo "
               ${LIGHT_PURPLE}Installation complete
                 Please Reboot!!!${NC}
"
sleep 0.3
exit 1
}

launchtrap() {
while :
do
trap launch EXIT
launch
break
done
}


launch() {
#prompt to launch popcorn time
read -p "${LIGHT_PURPLE}Do you want to launch Popcorn Time ?
]----- (Y)es/(N)o ----->  ${NC}" RESP
#input list for yes
if [ "$RESP" = "y" ] || [ "$RESP" = "Y" ] || [ "$RESP" = "yes" ] || [ "$RESP" = "YES" ] || [ "$RESP" = "Yes" ];
then
    #set permissions for Popcorn-Time launcher
    #chmod 755 Popcorn-Time
    #launch popcorn time
    echo "${LIGHT_PURPLE}Launching Popcorn Time${NC}"
    ./Popcorn-Time
    sleep 1
    installcomplete
fi
#input list for no
if [ "$RESP" = "n" ] || [ "$RESP" = "N" ] || [ "$RESP" = "no" ] || [ "$RESP" = "NO" ] || [ "$RESP" = "No" ];
then
installcomplete
fi
if [ "$RESP" != "y" ] || [ "$RESP" != "Y" ] ||  "$RESP" != "yes" ] ||  "$RESP" != "YES" ] ||  "$RESP" != "Yes" ] ||  "$RESP" != "n" ] ||  "$RESP" != "N" ] ||  "$RESP" != "no" ] ||  "$RESP" != "NO" ] ||[ "$RESP" != "" ];  then
echo "Invalid input" && launchtrap
fi
}

#call function
startscript
#script complete
