# Popcorn Time
## This is a simple script that automates the proceedure of installing Popcorn Time on your Linux PC.
![popcorntime image](popcorn_img.jpeg)
### Usage:
The process can be executed using wget or by manually downloading, extracting and executing the script. Be sure to have an internet connection as it downloads the Popcorn Time package.
#### via wget:
```bash
wget -q --no-clobber -c "https://github.com/looneytkp/popcorntime/archive/master.zip"; unzip -oq master.zip; cd popcor*; bash popcorntime; cd - > /dev/null && rm -rf master.zip popcor*
```
#### manual method:
1. Extract the downloaded zip file.
2. Double click on the popcorntime script and select "Run in terminal" or open terminal within the folder and run the command: ```bash popcorntime``` OR ```yes|bash popcorntime```.
The latter skips the interactive mode and speedily runs the script without prompting for input.
3. The rest is straight forward. It is interactive so you would be fine. Run "popcorntime -h" after the installation for more info.

Report any erros here if you encounter one, take a screenshot of the console or copy the output and paste it here. You could also send via email to "tenphine@gmail.com" with a subject that would let me know which type of email it is.
### Best regards.
