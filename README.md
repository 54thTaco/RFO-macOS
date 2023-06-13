```
   __    ___  ___                             ___  __    
  /__\  / __\/___\     _ __ ___   __ _  ___  /___\/ _\   
 / \// / _\ //  //____| '_ ` _ \ / _` |/ __|//  //\ \    
/ _  \/ /  / \_//_____| | | | | | (_| | (__/ \_// _\ \   
\/ \_/\/   \___/      |_| |_| |_|\__,_|\___\___/  \__/  
```

A RFO installer for the macOS ecosystem.

Installer made by 54thTaco, JSON is provided by Kaiddd

# Prerequisites 
1. Roblox must be installed
2. A WiFi connection

# Installation
Prior to installing RFO, we need the installer. In that case, use this command:
```
cd Desktop && curl -o RFO-installer.sh https://raw.githubusercontent.com/54thTaco/RFO-macOS/main/RFO-installer.sh && zsh RFO-installer.sh
```
This command goes to your desktop, downloads the installer, and runs it. 

Now that you have the installer, press `I` for installation, and you're done!

# Verification
[**OPTIONAL**] For those who need extra checking.
1. Go to your desktop, and press `Shift` + `Command` + `G`
2. Type `/Applications/Roblox.app/Contents/MacOS` and press `ENTER`
3. If you see a folder named `ClientSettings`, and inside of it a file named `ClientAppSettings.json`, you've succesfully installed RFO!

# Renewing
## Without the Installer

Redo the command listed in [**Installation**](https://github.com/54thTaco/RFO-macOS#installation).

## With Installer

Use this command to reopen the installer:
```
zsh (path to installer)
```
To get your installer's path, simply place your installer in your terminal window.

If you did it correctly, you should have something like this:
```
zsh /Users/taco/Desktop/RFO-installer.sh/
```
