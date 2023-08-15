#!/bin/zsh
#!/usr/local/bin/zsh
# RFO-macOS is an installer and conifgurer designed for macOS systems.
# Author: 54thTaco && Credits: Developers Kaede and Expo

print && print "Welcome to RFO-macOS! Available commands:"
print -a -c "\nBase Tools" "\n[N] - Install/Remove" "[T] - Toggle RFO" "[C] - Checker" "[Q] - Quit"
print -a -c "\nConfiguration Tools" "\n[M] - Manual Editing" && print

# Variables
CPATH=/Applications/Roblox.app/Contents/MacOS/ClientSettings/ClientAppSettings.json
FPATH=/Applications/Roblox.app/Contents/MacOS/ClientSettings

while true;
    read "?Option: "
    if [[ $REPLY == "N" ]]; then
        if [ ! -f $CPATH ]; then
            print "\nInstaller is starting...\n" && cd /Applications/Roblox.app/Contents/MacOS/
            mkdir ClientSettings && cd ClientSettings
            curl --remote-name-all https://raw.githubusercontent.com/rbxflags/Flags/main/Main/Base.json https://raw.githubusercontent.com/rbxflags/Flags/main/Main/GraphicsBars.json https://raw.githubusercontent.com/rbxflags/Flags/main/Main/Privacy.json https://raw.githubusercontent.com/rbxflags/Flags/main/Render/Renderer/Metal.json5
            cat Base.json GraphicsBars.json Privacy.json Metal.json5 >>ClientAppSettings.json && rm -rf Base.json GraphicsBars.json Privacy.json Metal.json5
            sed -i '' '6d;7d;10d;28d;29d' ClientAppSettings.json && sed -i '' '5s/$/,/' ClientAppSettings.json && sed -i '' '7s/$/,/' ClientAppSettings.json && sed -i '' '24s/$/,/' ClientAppSettings.json
            print '\nInstaller finished!\n'
        else
            print "\nUninstaller is starting..." && rm -rf $FPATH && print "Uninstaller finished!\n"
        fi
    elif [[ $REPLY == "T" ]]; then
        cd $FPATH
        if [ ! -f $CPATH ]; then
            print "\nToggling on..." && mv off.json ClientAppSettings.json && print "RFO is now on\n"
        else
            print "\nToggling off..." && mv ClientAppSettings.json off.json && print "RFO is now off\n"
        fi
    elif [[ $REPLY == "C" ]]; then
        if [ ! -f $CPATH ]; then
            print "\nRFO is not installed, or is not toggled. :(\n"
        else
            print "\nRFO is installed and toggled! :)\n"
        fi
    elif [[ $REPLY == "Q" ]]; then
        exit 0
    elif [[ $REPLY == "M" ]]; then
        nano $CPATH && print
    else
        print "\n'$REPLY' is not a command!\n"
    fi