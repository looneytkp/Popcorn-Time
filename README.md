This script automates the proceedure of manually downloading and installing Popcorn Time. The build is downloaded from the official [Popcorn Time](popcorntime.sh) website.

![popcorntime image](popcorn_img.jpeg)
#### Usage:
The script can be executed automatically using wget or by manually downloading, extracting and executing the script. Both instructions are below, be sure to have an internet connection as it downloads the Popcorn Time package.
##### Via wget:
Copy, paste and run the any of the code below in terminal.
```bash
wget -qc --no-clobber "https://github.com/looneytkp/popcorntime/archive/master.zip";unzip -oq master.zip;cd Popcorn*;bash popcorntime;cd - > /dev/null;rm -rf master.zip Popcorn*
```
##### Manual method:
  * Download the zip or tar.gz file and extract it.
  * Double click on the popcorntime script and select "Run in terminal" or open terminal within the folder and run the command: `bash popcorntime` OR `yes|bash popcorntime`.  
  The latter command skips the interactive mode and runs the script without prompting for user input.
  * The rest is pretty straight forward. Run ___"popcorntime -h"___ after the installation for more info.

Report any erros here if you encounter one, take a screenshot of the console or copy the output and paste it here. You could also send via email to **"tenphine@gmail.com"** with a subject that would let me know which type of email it is.

### Best regards.
