   __    ___  ___                             ___  __    
  /__\  / __\/___\     _ __ ___   __ _  ___  /___\/ _\   
 / \// / _\ //  //____| '_ ` _ \ / _` |/ __|//  //\ \    
/ _  \/ /  / \_//_____| | | | | | (_| | (__/ \_// _\ \   
\/ \_/\/   \___/      |_| |_| |_|\__,_|\___\___/  \__/   
                                                         

A RFO installer for the macOS ecosystem.

JSON is provided by Kaiddd

# Prerequisites 
1. Roblox must be installed
2. A WiFi connection
3. CLI using Z shell/ZSH

# Installation
1. Download `RFO-installer.sh`
2. Open the terminal, type `sh` , add a space, and put the shell file into the terminal window.

To see if you've done the steps above correctly so far, check to see if you have something similar to this:
```
sh /Users/Taco/Downloads/RFO-install.sh
```
3. Now press `ENTER`. It should now be installed onto Roblox.

# Verification
[**OPTIONAL**] For those who need extra checking.
1. Go to your desktop, and press `Shift` + `Command` + `G`
2. Type `/Applications/Roblox.app/Contents/MacOS` and press `ENTER`
3. If you see a folder named `ClientSettings`, and inside of it a file named `ClientAppSettings.json`, you've succesfully installed RFO!

# Renewing
Every time Roblox updates, which is typically every Wednesday, type this in the terminal:

```
curl --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/54thTaco/RFO-macOS/main/RFO-installer.sh | sh
```

Alternatively, you may redo step 2.
