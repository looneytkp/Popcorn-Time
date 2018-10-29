import os, getpass, tarfile
from platform import architecture

username = getpass.getuser()
DIR = "/home/" + username + "/.popcorntime"


def installation():
    dl = str(input("- Download Popcorn Time package ? [Y/n]> "))
    if dl == "y" or "Y":
        os.system("wget -q -nc popcorntime.sh")
        if architecture() == "('64bit', 'ELF')": bit = "64"
        else: bit = "32"
        os.system("sed -n '35p' index.html > index.txt")
        url = str(os.system('sed "s/.*a data-os=\"Linux ' + bit + '\" href=\"//" txt|sed "s/\".*//"'))
        os.system("wget -cq --retry-connrefused --show-progress " + url)
    else:
        exit("- Installation aborted.\n")
    with tarfile.open("popcorn.tar.xz") as pkg:
        pkg.extractall()
    if os.path.exists("index.html"):
        os.remove("index.html", "index.txt")
    NAME = "Popcorn Time"
    COMMENT = "Watch Movies and TV Shows instantly!"
    CURRENT_DIR = os.system("$(pwd)")
    EXECUTABLE = os.system(CURRENT_DIR + "/Popcorn-Time")
    ICON_PATH = os.system(CURRENT_DIR + "/src/app/images/icon.png")
    DESTINATION_DIR = ("/home/" + username + "/.local/share/applications")
    DESTINATION_DIR2 = "/usr/share/applications"
    DESKTOP_FILE = "popcorn-time.desktop"
    with open(DESKTOP_FILE, "a+") as df:
        df.write("[Desktop Entry]\n\nVersion=1.0\nType=Application")
        df.write("\nName=" + NAME + "\nIcon=" + ICON_PATH)
        df.write("\nExec=" + EXECUTABLE + "\nComment=" + COMMENT)
        df.write("\nCategories=Multimedia;\nTerminal=false")
    if os.path.exists(DESTINATION_DIR):
        os.rename(DESKTOP_FILE, DESTINATION_DIR)
    else:
        os.rename(DESKTOP_FILE, DESTINATION_DIR2)
    os.system('sudo -p "- [sudo] password for $USER: " gtk-update-icon-cache /usr/share/icons/hicolor')
    opt = str(input("- Launch Popcorn Time ? (Y)es/(N)o > "))
    if opt == "y" or "yes":
        os.system("./Popcorn-Time 2> /dev/null")
    print("\n- Popcorn Time should be in your application list.")
    print("- Execute 'popcorntime -h' for more info. Enjoy :)")
    print("- Installation complete!\n")

exit("not working yet")
if not os.path.exists(DIR):
    os.mkdir(DIR); os.chdir(DIR)
else:
    os.chdir(DIR)
installation()
