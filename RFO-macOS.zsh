
# RFO-macOS intalls and configures RFO directly from your command line
# Proudly designed for macOS systems
# Project by 54thTaco on GitHub
# Credits: RFO Developers Kaede and Expo

# Flag variables
BASICS="https://raw.githubusercontent.com/rbxflags/Flags/main/Main/Base.json" 
GRAPHICBARS="https://raw.githubusercontent.com/rbxflags/Flags/main/Main/GraphicsBars.json"
PRIVACY="https://raw.githubusercontent.com/rbxflags/Flags/main/Main/Privacy.json"
RENDERER="https://raw.githubusercontent.com/rbxflags/Flags/main/Render/Renderer/Metal.json5"

# Directory variables
FOLDER="/Applications/Roblox.app/Contents/MacOS/ClientSettings"
JSON="/Applications/Roblox.app/Contents/MacOS/ClientSettings/ClientAppSettings.json"
JSONOFF="/Applications/Roblox.app/Contents/MacOS/ClientSettings/ClientAppSettings.off"
MACOS="/Applications/Roblox.app/Contents/MacOS/"

# Startup
print && print "Welcome to RFO-macOS! See available commands:"
print -a -c "\nBase Tools" "\n[N] - Install/Remove" "[T] - Toggle RFO" "[C] - Checker"
print -a -c "\nConfiguration Tools" "\n[M] - Manual Editing" "[R] - Toggle OpenGL/Metal"
print -a -c "\nOther Commands" "\n[H] - Lists commands" "[Q] - Quit" && print

# Program
while true;
    read "?Option: "
    if [[ $REPLY == "N" ]]; then 
        if [ ! -f $JSON ]; then # Install
            print "\nInstaller is starting...\n" && cd $MACOS
            mkdir ClientSettings && cd ClientSettings
            curl --remote-name-all $BASICS $GRAPHICBARS $PRIVACY $RENDERER
            cat Base.json GraphicsBars.json Privacy.json Metal.json5 >>ClientAppSettings.json && rm -rf Base.json GraphicsBars.json Privacy.json Metal.json5
            sed -i '' 's/{//' ClientAppSettings.json && sed -i '' 's/}//' ClientAppSettings.json && sed -i '' '/^$/d' ClientAppSettings.json && sed -i '' 's/,//' ClientAppSettings.json && sed -i '' 's/$/,/' ClientAppSettings.json
            sed -i '' '1i\
{
            ' ClientAppSettings.json
            sed -i '' '$ s/.$//' ClientAppSettings.json
            sed -i '' '$a\
}
            ' ClientAppSettings.json
            print '\nInstaller finished!\n'
        else # Remove
            print "\nUninstaller is starting..." && rm -rf $FOLDER && print "Uninstaller finished!\n"
        fi

    elif [[ $REPLY == "T" ]]; then # Toggle
        cd $FOLDER
        if [ ! -f $JSON ]; then
            # Toggle on
            print "\nToggling on..." && mv ClientAppSettings.off ClientAppSettings.json && print "RFO is now on\n"
        else
            # Toggle off
            print "\nToggling off..." && mv ClientAppSettings.json ClientAppSettings.off && print "RFO is now off\n"
        fi

    elif [[ $REPLY == "C" ]]; then # Checker
        if [ ! -f $JSONOFF ]; then 
            # On/off
            print "\nOn/off: On"
        elif [[ ! -f $JSON ]]; then
            print "\nOn/off: Off"
        else
            print "\nOn/off: Off, not installed"
        fi


        if [ ! -f OGL ]; then 
            # Metal/OpenGL
            print "Renderer: Metal (Default)\n"
        else
            print "Renderer: OpenGL\n"
        fi

    elif [[ $REPLY == "M" ]]; then # Manual edits
        if [ ! -f $JSONOFF ]; then 
            nano $JSON && print 
                # Edit when toggled on
        else
            nano $JSONOFF && print 
                # Edit when toggled off
        fi

    elif [[ $REPLY == "R" ]]; then # Renderer toggle
        if [ ! -f $JSONOFF ]; then
            # Change renderer when toggled on
            if [ ! -f OGL ]; then
                cd $FOLDER
                sed -i '' 's/FFlagDebugGraphicsPreferMetal/FFlagDebugGraphicsPreferOpenGL/g' ClientAppSettings.json
                touch OGL
                print "\nYou are now using OpenGL! (NOT RECOMMENDED) \n"
            else
                sed -i '' 's/FFlagDebugGraphicsPreferOpenGL/FFlagDebugGraphicsPreferMetal/g' ClientAppSettings.json
                rm OGL
                print "\nYou are now using Metal!\n"
            fi
        else
            # Change renderer when toggled off
            if [ ! -f OGL ]; then
                cd $FOLDER
                sed -i '' 's/FFlagDebugGraphicsPreferMetal/FFlagDebugGraphicsPreferOpenGL/g' ClientAppSettings.off
                touch OGL
                print "\nYou are now using OpenGL! (NOT RECOMMENDED) \n"
            else
                sed -i '' 's/FFlagDebugGraphicsPreferOpenGL/FFlagDebugGraphicsPreferMetal/g' ClientAppSettings.off
                rm OGL
                print "\nYou are now using Metal!\n"
            fi
        fi

    elif [[ $REPLY == "H" ]]; then # Help
        read HELP\?"Tools/List [b/c/o]: "
            if [[ $HELP == "b" ]]; then
                # Base
                print -a -c "\nBase Tools" "\n[N] - Install/Remove" "[T] - Toggle RFO" "[C] - Checker\n"
            elif [[ $HELP == "c" ]]; then
                # Configuration
                print -a -c "\nConfiguration Tools" "\n[M] - Manual Editing" "[R] - Toggle OpenGL/Metal\n"
            elif [[ $HELP == "o" ]]; then
                # Other
                print -a -c "\nOther Commands" "\n[H] - Help MSG" "[Q] - Quit\n"
            else
            fi

    elif [[ $REPLY == "Q" ]]; then 
        exit 0

    else
        print "\n'$REPLY' is not a valid option!\n"
    fi
