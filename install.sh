#!/bin/bash

CE="\033[0m"
RS="\033[1;31m"
YS="\033[1;33m"
WHS="\033[1;37m"

printf '\033]2;install.sh\a'

if [[ $EUID -ne 0 ]]
then
   sleep 1
   echo -e "["$RS"*"$CE"] "$RS"This script must be run as root!"$CE"" 1>&2
   sleep 1
   exit
fi

{
ASESR="$(ping -c 1 -q www.google.com >&/dev/null; echo $?)"
} &> /dev/null
if [[ "$ASESR" != 0 ]]
then 
   sleep 1
   echo -e "["$RS"*"$CE"] "$RS"No Internet connection!"$CE""
   sleep 1
   exit
fi

clear

if [[ -d /root/ITNtools ]]
then
sleep 0.5
else
if [[ -d /root ]]
then
cd /root
{
git clone https://github.com/entynetproject/ITNtools.git
} &> /dev/null
cd /root/ITNtools
chmod +x install.sh
cd /root/ITNtools
else
mkdir /root
{
git clone https://github.com/entynetproject/ITNtools.git
} &> /dev/null
cd /root/ITNtools
chmod +x install.sh
cd /root/ITNtools
fi
fi

clear
printf '\033]2;select ITNtools\a'
sleep 3
echo -e "What version of ITNtools Framework you want to install?(\033[1;33mpro\033[0m/\033[1;33mlite\033[0m):"
echo -e "If you did not buy ITNtools Framework PRO, select \033[1;33mlite\033[0m!"
echo -e "If you bought ITNtools Framework PRO, select \033[1;33mpro\033[0m!"
read -e -p $'(\033[1;33mversion\033[0m)> ' CONFIGURATION

if [[ $CONFIGURATION = "pro" ]]
then

{
rm -rf /root/ITNtools/etc/lite
rm /root/ITNtools/install.sh
cp /root/ITNtools/etc/pro/install.sh /root/ITNtools
cp /root/ITNtools/etc/pro/uninstall.sh /root/ITNtools
chmod +x /root/ITNtools/install.sh
rm -rf /root/ITNtools/etc/pro
} &> /dev/null
cd /root/ITNtools
./install.sh
exit
fi

cd /root/ITNtools/etc
cp -r lite /root
cd /root
rm -rf ITNtools
mv lite ITNtools
cd /root/ITNtools
chmod +x install.sh
./install.sh
exit
