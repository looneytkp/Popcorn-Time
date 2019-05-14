This script automates the proceedure of manually downloading and installing Popcorn Time. The package is downloaded from the official open source Popcorn Time website.

<img src="https://popcorntime.sh/images/popcorn-time-image.png" alt="Popcorn Time">

### Usage:
The script can be executed automatically using wget or by manually downloading, extracting and executing the script. Both instructions are below, be sure to have an internet connection as it downloads the Popcorn Time package.
##### Via wget:
Copy, paste and run the code below in a terminal:

```bash
wget -qnc 'https://github.com/looneytkp/popcorntime/archive/master.zip' && unzip -oq ma*ip && ./Po*er/p*e; rm -rf ma*ip Po*er
```
##### Manual method:
Download the zip or tar.gz file and extract it, double click on the popcorntime script and select "Run in terminal" or open terminal within the folder and run the command: ```bash popcorntime```
#### Uninstall
##### Via wget:
Copy, paste and run the code below in a terminal:

```bash
wget -qnc 'https://github.com/looneytkp/popcorntime/archive/master.zip' && unzip -oq ma*ip && ./Po*er/p*e -u; rm -rf ma*ip Po*er
```
##### Manual method:
Or copy & paste any of the codes below in a terminal: ```bash popcorntime -u```

OR

```sudo rm -fr $DIR || true; sudo rm /usr/share/icons/hicolor/48x48/apps/popcorntime.png || true; rm /home/$(whoami)/.local/share/applications/popcorn-time.desktop || true```

Done!

### Best regards.
