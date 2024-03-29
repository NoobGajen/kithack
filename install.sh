#!/usr/bin
#Copyright 2020 KITHACK
#Written by: Adrian Guillermo
#Re-Written by: Gajendra Mahato
#Facebook: https://facebook.com/TechGajenPage
#Github: https://github.com/TechGajen

#Installer KitHack

path=$(pwd)

# Check root 
if [ "$(id -u)" != "0" ] > /dev/null 2>&1; then
echo ""
echo -e '\e[1;31m[x] Este script necesita permisos root.\e[0m' 1>&2
sleep 2
exit
fi

# Banner 
clear
sleep 2
echo -e "\e[0;33m ___                 __         .__  .__                              "
echo -e "\e[0;33m|   | ____   _______/  |______  |  | |  |   ___________               "    
echo -e "\e[0;33m|   |/    \ /  ___/\   __\__  \ |  | |  | _/ __ \_  __ \              "    
echo -e "\e[0;33m|   |   |  \___  \  |  |  / __ \|  |_|  |_\  ___/|  | \/              "    
echo -e "\e[0;33m|___|___|  /____  > |__| (____  /____/____/\___  >__|   /\  /\  /\    "
echo -e "\e[0;33m         \/     \/            \/               \/       \/  \/  \/    "
echo -e ""
echo -e "                      \e[38;5;166m Setup KitHack v1.3.0                       "
echo -e ""
echo -e "                            By:AdrMXR                                         "
 
# Check if there is an internet connection
ping -c 1 google.com > /dev/null 2>&1
if [[ "$?" == 0 ]]; then
echo ""
echo -e "\033[92m[✔][Internet Connection]............[ OK ]"
sleep 1.5
else
echo ""
echo -e "\e[1;31m[!][Internet Connection].........[ NOT FOUND ]"
echo ""
exit
fi

# Check dependencies
echo -e "\e[0;33m"
echo -n [*] Checando dependencias...= ;
sleep 3 & while [ "$(ps a | awk '{print $1}' | grep $!)" ] ; do for X in '-' '\' '|' '/'; do echo -en "\b$X"; sleep 0.1; done; done 
echo ""

# Check if xterm exists
which xterm > /dev/null 2>&1
if [ "$?" -eq "0" ]; then
echo ""
echo -e "\033[92m[✔][Xterm]..........................[ OK ]"
sleep 1.5
else
echo ""
echo -e "\e[1;31m[x][Xterm].......................[ NOT FOUND ]"
sleep 1.5
echo -e "\e[0;33m[!][Installing Xterm...]"
sudo apt-get install -y xterm > /dev/null
fi

# Check if postgresql exists
which /etc/init.d/postgresql > /dev/null 2>&1
if [ "$?" -eq "0" ]; then
echo -e "\033[92m[✔][Postgresql].....................[ OK ]"
sleep 1.5
else
echo -e "\e[1;31m[x][Postgresql]..................[ NOT FOUND ]"
sleep 1.5
echo -e "\e[0;33m[!][Installing Postgresql...]"
xterm -T "INSTALLER POSTGRESQL" -geometry 100x30 -e "sudo apt-get install -y postgresql"
fi 

# Check if metasploit framework exists 
which msfconsole > /dev/null 2>&1
if [ "$?" -eq "0" ]; then
echo -e "\033[92m[✔][Metasploit Framework]...........[ OK ]"
sleep 1.5
else
echo -e "\e[1;31m[x][Metasploit Framework]........[ NOT FOUND ]"
sleep 1.5
echo -e "\e[0;33m[!][Installing Metasploit-Framework...]"
xterm -T "INSTALLER METASPLOIT FRAMEWORK" -geometry 100x30 -e "curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall && chmod 755 msfinstall && ./msfinstall && sudo apt-get update && apt-get upgrade"
fi

# Check if apktool exists 
which apktool > /dev/null 2>&1
if [ "$?" -eq "0" ]; then
echo -e "\033[92m[✔][Apktool]........................[ OK ]"
sleep 1.5
else
echo -e "\e[1;31m[x][Apktool].....................[ NOT FOUND ]"
sleep 1.5
echo -e "\e[0;33m[!][Installing Apktool...]"
xterm -T "INSTALLER APKTOOL" -geometry 100x30 -e "echo -e "" && echo [*] Añadiendo Apktool... && sleep 2 && echo -e "" && cp apktoolv2.4.0/apktool /usr/local/bin/apktool && echo [✔]/usr/local/bin/apktool && sleep 2 && cp apktoolv2.4.0/apktool.jar /usr/local/bin/apktool.jar && echo [✔]/usr/local/bin/apktool.jar && echo "" && sleep 2 && echo Instalación completa. && sleep 1"
fi

# Check if aapt exists
which aapt > /dev/null 2>&1
if [ "$?" -eq "0" ]; then
echo -e "\033[92m[✔][Aapt]...........................[ OK ]"
sleep 1.5
else
echo -e "\e[1;31m[x][Aapt]........................[ NOT FOUND ]"
sleep 1.5
echo -e "\e[0;33m[!][Installing Aapt...]"
xterm -T "INSTALLER AAPT" -geometry 100x30 -e "sudo apt-get install -y aapt && sudo apt-get install -y android-framework-res -y"
fi

# Check if jarsigner exists
which jarsigner > /dev/null 2>&1
if [ "$?" -eq "0" ]; then
echo -e "\033[92m[✔][Jarsigner]......................[ OK ]"
sleep 1.5
else
echo -e "\e[1;31m[x][Jarsigner]...................[ NOT FOUND ]"
sleep 1.5
echo -e "\e[0;33m[!][Installing Jarsigner...]"
xterm -T "INSTALLER JARSIGNER" -geometry 100x30 -e "sudo apt-get install default-jdk -y"
fi

# Check if zipalign exists
which zipalign > /dev/null 2>&1
if [ "$?" -eq "0" ]; then
echo -e "\033[92m[✔][Zipalign].......................[ OK ]"
sleep 1.5
else
echo -e "\e[1;31m[x][Zipalign]....................[ NOT FOUND ]"
sleep 1.5
echo -e "\e[0;33m[!][Installing Zipalign...]"
xterm -T "INSTALLER ZIPALIGN" -geometry 100x30 -e "sudo apt-get install -y zipalign -y"
fi

# Check if pwgen exists
which pwgen > /dev/null 2>&1
if [ "$?" -eq "0" ]; then
echo -e "\033[92m[✔][Pwgen]..........................[ OK ]"
sleep 1.5
else
echo -e "\e[1;31m[x][Pwgen].......................[ NOT FOUND ]"
sleep 1.5
echo -e "\e[0;33m[!][Installing Pwgen...]"
xterm -T "INSTALLER PWGEN" -geometry 100x30 -e "sudo apt-get install pwgen -y"
fi

# Check if pip2 exists
which pip2 > /dev/null 2>&1
if [ "$?" -eq "0" ]; then
echo -e "\033[92m[✔][Pip2]...........................[ OK ]"
sleep 1.5
else
echo -e "\e[1;31m[x][Pip2]........................[ NOT FOUND ]"
sleep 1.5
echo -e "\e[0;33m[!][Installing Pip2...]"
xterm -T "INSTALLER PIP2" -geometry 100x30 -e "wget https://bootstrap.pypa.io/get-pip.py && sudo python2.7 get-pip.py"
rm get-pip.py
fi

# Configuring folders
echo -e "\e[0;33m"
echo -n [*] Configurando carpetas...= ;
sleep 3 & while [ "$(ps a | awk '{print $1}' | grep $!)" ] ; do for X in '-' '\' '|' '/'; do echo -en "\b$X"; sleep 0.1; done; done
echo ""
echo -e "\033[92m"

if [ -d output ]; then
echo -e "[✔]Ya existe $path/output"
sleep 0.2
else
mkdir output
echo -e "[✔]$path/output"
sleep 0.2
fi

if [ -d tools/Android ]; then
echo -e "[✔]Ya existe $path/tools/Android"
sleep 0.2
else
mkdir -p tools/Android
echo -e "[✔]$path/tools/Android"
sleep 0.2
fi

if [ -d tools/Windows ]; then
echo -e "[✔]Ya existe $path/tools/Windows"
sleep 0.2
else
mkdir -p tools/Windows
echo -e "[✔]$path/tools/Windows"
sleep 0.2
fi

if [ -d tools/Phishing ]; then
echo -e "[✔]Ya existe $path/tools/Phishing"
sleep 0.2
else
mkdir -p tools/Phishing
echo -e "[✔]$path/tools/Phishing"
sleep 0.2
fi

if [ -d tools/Wifi ]; then
echo -e "[✔]Ya existe $path/tools/Wifi"
sleep 0.2
else
mkdir -p tools/Wifi
echo -e "[✔]$path/tools/Wifi"
sleep 0.2
fi

if [ -d tools/Passwords ]; then
echo -e "[✔]Ya existe $path/tools/Passwords"
sleep 0.2
else
mkdir -p tools/Passwords
echo -e "[✔]$path/tools/Passwords"
sleep 0.2
fi

if [ -d tools/Web ]; then
echo -e "[✔]Ya existe $path/tools/Web"
sleep 0.2
else
mkdir -p tools/Web
echo -e "[✔]$path/tools/Web"
sleep 0.2
fi

if [ -d tools/Spoofing ]; then
echo -e "[✔]Ya existe $path/tools/Spoofing"
sleep 0.2
else
mkdir -p tools/Spoofing
echo -e "[✔]$path/tools/Spoofing"
sleep 0.2
fi

if [ -d tools/InformationGathering ]; then
echo -e "[✔]Ya existe $path/tools/InformationGathering"
sleep 0.2
else
mkdir -p tools/InformationGathering
echo -e "[✔]$path/tools/InformationGathering"
sleep 0.2
fi

if [ -d tools/Others ]; then
echo -e "[✔]Ya existe $path/tools/Others"
sleep 0.2
else
mkdir -p tools/Others
echo -e "[✔]$path/tools/Others"
sleep 0.2
fi

if [ -d .config ]; then
echo -e "[✔]Ya existe $path/.config"
sleep 0.2
else
mkdir -p .config
echo -e "[✔]$path/.config"
sleep 0.2
fi

# Installing requirements
echo -e "\e[0;33m"
echo -n [*] Instalando requerimientos de python...= ;
sleep 3 & while [ "$(ps a | awk '{print $1}' | grep $!)" ] ; do for X in '-' '\' '|' '/'; do echo -en "\b$X"; sleep 0.1; done; done
echo ""
echo -e "\033[92m"
pip2 install py-getch  -y
apt-get install python-tk -y
pip2 install pathlib -y
pip2 install python-zenity -y
pip2 install pgrep -y
apt-get install libatk-adaptor libgail-common -y
apt-get install python-gtk2-dev -y

# Shortcut for kithack
echo -e "\e[0;33m"
echo -n [*] Configuración de acceso directo...= ;
sleep 3 & while [ "$(ps a | awk '{print $1}' | grep $!)" ] ; do for X in '-' '\' '|' '/'; do echo -en "\b$X"; sleep 0.1; done; done
echo ""
echo ""
echo -e "\033[92m[!] ¿Desea poder ejecutar kithack desde cualquier lugar de su terminal? (y/n)"
echo ""
echo -ne "\e[1;31mKitHack >>\e[0m "
read -r option
case "$option" in

y|Y)
lnk=$?
if [ "$lnk" ==  "0" ];then
run="cd $path && sudo python KitHack.py"
touch /usr/local/bin/kithack
echo "#!/bin/bash" > /usr/local/bin/kithack
echo "$run" >> /usr/local/bin/kithack
chmod +x /usr/local/bin/kithack
sed -i "4i\Exec=sh -c '$run'" images/kithack.desktop
cp images/kithack.desktop /usr/share/applications/kithack.desktop
cp images/kithack.png /usr/share/icons/kithack.png
echo ""
sleep 2
echo -e "\033[92m[✔] Installation complete. Type 'kithack' to run the tool"
echo ""
fi
;;

n|N)
echo ""
sleep 2
echo -e "\033[92m[✔] Installation complete."
echo ""
;;
esac
exit
