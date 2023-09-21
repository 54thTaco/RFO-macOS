#!/bin/zsh
#!/usr/local/bin/zsh

# RFO-macOS is an installer and conifgurer designed for macOS systems.
# Author: tatataco (54thTaco) 
# Credits: Developers Kaede and Expo

print && print "Welcome to RFO-macOS! Available commands:"
print -a -c "\nBase Tools" "\n[N] - Install/Remove" "[T] - Toggle RFO" "[C] - Checker" "[Q] - Quit"
print -a -c "\nConfiguration Tools" "\n[M] - Manual Editing [R] - Change Renderer" 
print -a -c "\nMisc. Tools" "\n[Cf] - Check Flags" && print

# Variables
CPATH=/Applications/Roblox.app/Contents/MacOS/ClientSettings/ClientAppSettings.json
FPATH=/Applications/Roblox.app/Contents/MacOS/ClientSettings

while true;
    read "?Option: "
    if [[ $REPLY == "N" ]]; then
        if [ ! -f $CPATH ]; then
            print "\nInstaller is starting...\n" && cd /Applications/Roblox.app/Contents/MacOS/
            mkdir ClientSettings && cd ClientSettings
            curl --remote-name-all https://raw.githubusercontent.com/rbxflags/Flags/main/Main/Base.json https://raw.githubusercontent.com/rbxflags/Flags/main/Main/GraphicsBars.json https://raw.githubusercontent.com/rbxflags/Flags/main/Main/Privacy.json https://raw.githubusercontent.com/rbxflags/Flags/main/Render/Renderer/OpenGL.json5
            cat Base.json GraphicsBars.json Privacy.json OpenGL.json5 >>ClientAppSettings.json && rm -rf Base.json GraphicsBars.json Privacy.json OpenGL.json5
            sed -i '' 's/{//' ClientAppSettings.json && sed -i '' 's/}//' ClientAppSettings.json && sed -i '' '/^$/d' ClientAppSettings.json && sed -i '' 's/,//' ClientAppSettings.json && sed -i '' 's/$/,/' ClientAppSettings.json
            sed -i '' '1i\
{
            ' ClientAppSettings.json
            sed -i '' '$ s/.$//' ClientAppSettings.json
            sed -i '' '$a\
}
            ' ClientAppSettings.json
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

    elif [[ $REPLY == "R" ]]; then
        if [ ! -f METAL ]; then
            cd $FPATH
            sed -i '' 's/FFlagDebugGraphicsPreferOpenGL/FFlagDebugGraphicsPreferMetal/g' ClientAppSettings.json
            touch METAL
            print "\nYou are now using Metal!\n"
        else
            sed -i '' 's/FFlagDebugGraphicsPreferMetal/FFlagDebugGraphicsPreferOpenGL/g' ClientAppSettings.json
            rm METAL
            print "\nYou are now using OpenGL!\n"
        fi

    elif [[ $REPLY == "Cf" ]]; then
        if [ ! -f ClientAppSettings.off ]; then
            print "\nOn/off: On"
        else
            print "\nOn/off: Off"
        fi

        if [ ! -f METAL ]; then
            print "Renderer: OpenGL (Default)\n"
        else
            print "Renderer: Metal\n"
        fi

    else
        print "\n'$REPLY' is not a command!\n"
    fi