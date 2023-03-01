#!/usr/bin/env bash

set -euo pipefail

RED=$'\e[0;31m'
GREEN=$'\e[0;32m'
YELLOW=$'\e[0;33m'
NC=$'\e[0m' # No Color

cat << EOF
 ______    _    _   _____      __                 ______   ______   ____  ____  
|_   _ \  (_)  (_) |_   _|    [  |               |_   _ \ |_   _ `.|_   ||   _| 
  | |_) | __   __    | |       | |.--.   _   __    | |_) |  | | `. \ | |__| |   
  |  __'.[  | [  |   | |   _   | '/'`\ \[ \ [  ]   |  __'.  | |  | | |  __  |   
 _| |__) || |  | |  _| |__/ |  |  \__/ | \ '/ /   _| |__) |_| |_.' /_| |  | |_  
|_______/[___][___]|________| [__;.__.'[\_:  /   |_______/|______.'|____||____| 
                                        \__.'                                   
                                        
BUU-Infineon Innovation Launchpad Center 
EAST Park, Burapha University, Chonburi, THAILAND

http://www.eastpark.buu.ac.th

===============================================================================

EOF

# Determine the user's operating system
OS=$(uname -s)

# Download and install wget
if [ "$OS" = "Darwin" ]; then
    # macOS
    echo "Test"
elif [ "$OS" = "Linux" ]; then
    # Linux
    sudo apt-get update
    sudo apt-get install -y wget
else
    # Windows (assuming PowerShell is available)
    (New-Object System.Net.WebClient).DownloadFile('https://sourceforge.net/projects/ezwinports/files/wget/1.20.3-1/wget-1.20.3-1-win64.zip/download', 'wget.zip')
    Expand-Archive -Path wget.zip -DestinationPath wget
    $env:PATH += ";" + (Join-Path $pwd wget\bin)
fi

# Create manifest.loc file
if [ "$OS" = "Darwin" ]; then
    # macOS
    MANIFEST_URL="https://raw.githubusercontent.com/Advance-Innovation-Centre-AIC/mtb2-bdh-academy-manifests/master/bdh-academy-super-manifest.xml"
    echo "$MANIFEST_URL" > "manifest.loc"
elif [ "$OS" = "Linux" ]; then
    # Linux
    MANIFEST_URL="https://raw.githubusercontent.com/Advance-Innovation-Centre-AIC/mtb2-bdh-academy-manifests/master/bdh-academy-super-manifest.xml"
    echo "$MANIFEST_URL" > "$HOME/.modustoolbox/manifest.loc"
else
    # Windows
    MANIFEST_URL="https://raw.githubusercontent.com/Advance-Innovation-Centre-AIC/mtb2-bdh-academy-manifests/master/bdh-academy-super-manifest.xml"
    echo "$MANIFEST_URL" > "$env:USERPROFILE\.modustoolbox\manifest.loc"
fi


cat << EOF

 _____  _                    _         _     _            
(_   _)( )                  ( )       ( )   ( )           
  | |  | |__     _ _   ___  | |/')    `\`\_/'/'_    _   _ 
  | |  |  _ `\ /'_` )/' _ `\| , <       `\ /'/'_`\ ( ) ( )
  | |  | | | |( (_| || ( ) || |\`\       | |( (_) )| (_) |
  (_)  (_) (_)`\__,_)(_) (_)(_) (_)      (_)`\___/'`\___/'
                                                          
powered by 
╔╗ ╔╦╗╦ ╦
╠╩╗ ║║╠═╣
╚═╝═╩╝╩ ╩ (Bangsaen Design House)

EOF