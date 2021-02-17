#Patches Menu By MrDude
import os
import pip
from os import path

python = "python"
package = 'bitstring'
firmware = str("firmware")
fusee = str("fusee-secondary.bin")
debug = 0

def clear_screen():
    global debug
    if debug == 0:
        os.system('cls' if os.name=='nt' else 'clear')
    
def firm():
    print("Type the firmware folder address or drag the folder onto this menu:")
    global firmware
    firmware = input().replace('"', '')
    if not path.exists(firmware):
        firmware = str("firmware")

def my_load():
    print("Type the fusee-secondary.bin address or drag your fusee-secondary.bin file onto this menu:")
    global fusee
    fusee = input().replace('"', '')
    if not path.exists(fusee):
        fusee = str("fusee-secondary.bin")  

def install():
    try:
        return __import__(package)
    
    except ImportError:
        pip.main(['install', package])
        
def loader():
    os.system(python + ' scripts\Loader-AutoIPS.py "' + fusee + '"')

def fs():
    os.system(python + ' scripts\FS-AutoIPS.py "' + firmware + '" "scripts\keys.dat"')

def es():
    os.system(python + ' scripts\ES-AutoIPS.py "' + firmware + '" "scripts\keys.dat"')

def menu():
    try:
        ans=True
        while ans:
            print("===================================================================================")
            print("Make sure you have keys.dat in the scripts folder.")
            print("Menu + Scripts: Made by MrDude, thanks to Crckd + DarkMatterCore for info and help")
            print("===================================================================================")
            print("1.Make Loader Patches")
            print("2.Make FS and ES Patches")
            print("3.Make ES Patches")
            print("4.Make FS Patches")
            print("5.Toggle Debug info")
            print("6.Exit/Quit\n")
            ans=input("What would you like to do? ")
            if ans=="1":
                print("")
                my_load()
                loader()
                clear_screen()
            elif ans=="2":
                print("")
                firm()
                fs()
                es()
                clear_screen()
            elif ans=="3":
                print("")
                firm()
                es()
                clear_screen()
            elif ans=="4":
                print("")
                firm()
                fs()
                clear_screen()
            elif ans=="5":
                global debug
                if debug == 0:
                    debug = 1
                    print("Debugging enabled")
                elif debug == 1:
                    debug = 0
                    print("Debugging disabled")
            elif ans=="6":
                print("\n Goodbye")
                ans = None
            else:
                print("\n Not Valid Choice Try again")
    except OSError as e:
        print("Error: %s : %s" % ("In menu: ", e.strerror))             

install()
menu()
