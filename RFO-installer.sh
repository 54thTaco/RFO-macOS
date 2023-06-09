cd /Applications/Roblox.app/Contents/MacOS
rm -rf /Applications/Roblox.app/Contents/MacOS/ClientSettings
mkdir /Applications/Roblox.app/Contents/MacOS/ClientSettings
cd /Applications/Roblox.app/Contents/MacOS/ClientSettings/
curl https://raw.githubusercontent.com/rbxflags/Flags/main/Main/Base.json -o Base.json && curl https://raw.githubusercontent.com/rbxflags/Flags/main/Main/GraphicsBars.json -o GraphicsBars.json && curl https://raw.githubusercontent.com/rbxflags/Flags/main/Main/Privacy.json -o Privacy.json
cat Base.json GraphicsBars.json Privacy.json >> ClientAppSettings.json
rm -rf Base.json GraphicsBars.json Privacy.json
sed '4d;5d;8d' ClientAppSettings.json > CAS.json
sed '3s/$/,/' CAS.json > CAS1.json
sed '5s/$/,/' CAS1.json > ClientAppSettings.json
rm -rf CAS.json CAS1.json
echo "Script finished."
