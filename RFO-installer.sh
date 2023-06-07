cd /Applications/Roblox.app/Contents/MacOS
rm -rf /Applications/Roblox.app/Contents/MacOS/ClientSettings
mkdir /Applications/Roblox.app/Contents/MacOS/ClientSettings
curl https://raw.githubusercontent.com/54thTaco/RFO-macOS/main/ClientAppSettings.json -o /Applications/Roblox.app/Contents/MacOS/ClientSettings/ClientAppSettings.json
echo "RFO has been installed."
