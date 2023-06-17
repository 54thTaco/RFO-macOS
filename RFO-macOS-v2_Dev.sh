#!/bin/zsh

# Welcome / Guide
echo && echo "Welcome to RFO-macOS! Available commands:" && echo "'I' - Installer" && echo "'U' - Uninstaller" && echo "'C' - Checker" && echo "Dev Tools:" && echo "'Co' - RFO Config" && echo "'Oa' - Open Roblox.app Folder"

# Program
echo && read OPTION\?"Option: "
if [[ $OPTION == "I" ]]; then
    echo && echo "Installer initialized..." && cd /Applications/Roblox.app/Contents/MacOS && rm -rf ClientSettings
    mkdir ClientSettings && cd ClientSettings
    curl https://raw.githubusercontent.com/rbxflags/Flags/main/Main/Base.json -o Base.json && curl https://raw.githubusercontent.com/rbxflags/Flags/main/Main/GraphicsBars.json -o GraphicsBars.json && curl https://raw.githubusercontent.com/rbxflags/Flags/main/Main/Privacy.json -o Privacy.json && curl https://raw.githubusercontent.com/rbxflags/Flags/main/Render/Renderer/Metal.json5 -o Metal.json
    cat Base.json GraphicsBars.json Privacy.json Metal.json >>ClientAppSettings.json && rm -rf Base.json GraphicsBars.json Privacy.json Metal.json
    sed '4d;5d;8d;104d' ClientAppSettings.json >CAS.json && sed '3s/$/,/' CAS.json >ClientAppSettings.json && sed '5s/$/,/' ClientAppSettings.json >CAS.json && sed '100s/$/,/' CAS.json >ClientAppSettings.json
    rm -rf CAS.json && echo 'Installer finished!' && echo
elif [[ $OPTION == "U" ]]; then
    echo && echo "Uninstaller initialized..." && rm -rf /Applications/Roblox.app/Contents/MacOS/ClientSettings && echo "Uninstaller finished!" && echo
elif [[ $OPTION == "C" ]]; then
    echo
elif [[ $OPTION == "Co" ]]; then
    nano /Applications/Roblox.app/Contents/MacOS/ClientSettings/ClientAppSettings.json && echo && echo "Configurator closed." && exit
elif [[ $OPTION == "Oa" ]]; then
    open /Applications/Roblox.app/Contents/MacOS && exit
elif [[ $OPTION == "s" ]]; then
    exit
else
    echo && echo "Error: '$OPTION' is not a command" && exit 1
fi

# Checker
echo "Checker initialized..."
if [ ! -f /Applications/Roblox.app/Contents/MacOS/ClientSettings/ClientAppSettings.json ]; then
    echo "File not found, RFO is not installed!"
else
    echo "File found, RFO is installed!"
fi
