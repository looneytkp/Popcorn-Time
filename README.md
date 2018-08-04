# Popcorn Time
![alt text](popcorn_img.png)
This is a simple script that automates the proceedure of installing Popcorn Time on your Linux PC.
### Basic usage:
The process can be executed using wget or by manually downloading, extracting and executing the script. Be sure to have an internet connection as it downloads the Popcorn Time package.
#### via wget:
```bash
wget -q --no-clobber -c "https://github.com/looneytkp/popcorntime/archive/master.zip"; unzip -oq master.zip; cd popcor*; bash popcorntime; cd - > /dev/null && rm -rf master.zip popcor*
```
#### manual method:
1. Download and extract the zip file.
2. Double click on the popcorntime script and select "Run in terminal" or open terminal within the folder and run the command: ```bash popcorntime```
3. The rest is pretty straight forward. Run "popcorntime -h" after the installation for more info.
### Best regards.
