# Popcorn Time
![alt text](https://github.com/looneytkp/popcorntime/blob/master/Screenshot%20from%202018-04-05%2004-53-59.png)
This is a simple script that automates the proceedure of installing Popcorn Time on your Linux PC.
### Basic usage:
The process can be executed using wget or by manually downloading, extracting and executing the script. Be sure to have an internet connection as it downloads the Popcorn Time package.
#### via wget:
```bash
wget -q --no-clobber -c "https://github.com/looneytkp/popcorntime/archive/master.zip"; unzip -oq master.zip; cd popcor*; bash popcorntime; cd - > /dev/null && rm -rf master.zip popcor*
```
#### manual method:
1. Download and extract the zip file.
2. Double click on the popcorntime script and select "Run in terminal" or open terminal within the folder and run this command:
```bash
bash popcorntime
```
3. The rest is pretty straight forward.

Best regards
