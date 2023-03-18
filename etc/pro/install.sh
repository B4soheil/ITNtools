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

{
chattr -i /dev/config
chattr -i /dev/config/config.txt
chattr -i /dev/config/configure.txt
} &> /dev/null

{
mkdir /dev/config
echo 0 >> /dev/config/config.txt
echo 1 >> /dev/config/configure.txt
} &> /dev/null

{
chattr +i /dev/config
chattr +i /dev/config/config.txt
chattr +i /dev/config/configure.txt
} &> /dev/null

SERSE="$( cat /dev/config/config.txt | head -n 1 )"
ESRES="$( cat /dev/config/configure.txt | head -n 1 )"

if [[ "$SERSE" != "$ESRES" ]]
then

ASESR="$(ping -c 1 -q google.com >&/dev/null; echo $?)"

if [[ "$ASESR" = 0 ]]
then 

clear

cd /root/ITNtools/lib
chmod +x libactiv
passcode="$(cat /root/ITNtools/etc/.config)"
./libactiv

if [[ -f /etc/ITNtools/root/service/late/ITNkey.txt ]]
then

ITNKEY="$( cat /etc/ITNtools/root/service/late/ITNkey.txt )"
sleep 1

else
exit
fi

else
sleep 1
echo -e "["$RS"*"$CE"] "$RS"No Internet connection!"$CE""
sleep 1
exit
fi
fi

printf '\033]2;install.sh\a'

clear
chmod +x /root/ITNtools/ITN/ITN1
chmod +x /root/ITNtools/ITN/ITN2
chmod +x /root/ITNtools/ITN/ITN3
chmod +x /root/ITNtools/ITN/ITN21
chmod +x /root/ITNtools/ITN/ITN31
chmod +x /root/ITNtools/bin/ITNtools
chmod +x /root/ITNtools/ITN/ITN4
chmod +x /root/ITNtools/ITN/ITN41
chmod +x /root/ITNtools/ITN/ITN42
chmod +x /root/ITNtools/ITN/ITN43
chmod +x /root/ITNtools/dev/dev1
chmod +x /root/ITNtools/dev/dev2
chmod +x /root/ITNtools/dev/dev21
chmod +x /root/ITNtools/uninstall.sh
chmod +x /root/ITNtools/bin/ITNmod
chmod +x /root/ITNtools/bin/ITNkey
chmod +x /root/ITNtools/bin/ITNconsole
chmod +x /root/ITNtools/bin/ITNapp
chmod +x /root/ITNtools/bin/epasswd
cd /root/ITNtools
cp /root/ITNtools/bin/ITNtools /bin
chmod +x /bin/ITNtools
cp /root/ITNtools/bin/ITNkey /bin
chmod +x /bin/ITNkey
cp /root/ITNtools/bin/ITNapp /bin
chmod +x /bin/ITNapp
cp /root/ITNtools/bin/epasswd /bin
chmod +x /bin/epasswd
cp /root/ITNtools/bin/ITNmod /bin
chmod +x /bin/ITNmod
cp /root/ITNtools/etc/root/password /etc/ITNtools/root
mkdir /etc/ITNtools/app
cp /root/ITNtools/app/ITNtools.png /etc/ITNtools/app
mkdir /etc/ITNtools/ITNtoold
cp /root/ITNtools/bin/ITNconsole /etc/ITNtools/ITNtoold
chmod +x /etc/ITNtools/ITNtoold/ITNconsole

clear
if [[ ! -d /root/handshakes ]]
then
	mkdir /root/handshakes
	sleep 0
else
	sleep 0
fi
if [[ ! -d /root/wordlists ]]
then
	mkdir /root/wordlists
	sleep 0
else
	sleep 0
fi
clear
printf '\033]2;install.sh\a'
sleep 3
echo -e "What desktop shell do you use?"
echo -e
echo -e ""$YS"1"$CE") Gnome"
echo -e ""$YS"2"$CE") Xfce"
echo -e ""$YS"3"$CE") KDE"
echo -e
read -e -p $'(\033[4;93mdesktop\033[0m\en)> ' xdesk

if [[ $xdesk = "1" ]]
then
{
chattr -i /etc/ITNtools
mkdir /etc/ITNtools/xdesktop
echo "gnome-terminal" >> /etc/ITNtools/xdesktop/config.txt
chattr +i /etc/ITNtools
} &> /dev/null

elif [[ $xdesk = "2" ]]
then
{
chattr -i /etc/ITNtools
mkdir /etc/ITNtools/xdesktop
echo "xfce4-terminal" >> /etc/ITNtools/xdesktop/config.txt
chattr +i /etc/ITNtools
} &> /dev/null

elif [[ $xdesk = "3" ]]
then
{
chattr -i /etc/ITNtools
mkdir /etc/ITNtools/xdesktop
echo "konsole" >> /etc/ITNtools/xdesktop/config.txt
chattr +i /etc/ITNtools
} &> /dev/null
fi

clear
printf '\033]2;install.sh\a'
sleep 3
echo -e "Do you want to install ITNtools modules now?(\033[1;33myes\033[0m/\033[1;33mno\033[0m):"
echo -e "So without thinking install them now!"
echo -e "Only use 'yes' for the best way!"
read -e -p $'(\033[4;93minstall\033[0m\en)> ' UORI

if [[ "$UORI" = "no" ]]
then 
	clear
	echo -e "OK..."
	sleep 1
	echo -e "To install ITNtools modules, run '"$YS"ITNmod -i"$CE"'"
	sleep 3
	clear
        
elif [[ "$UORI" = "yes" ]]
then
      clear
      echo -e "OK..."
      sleep 1
      echo -e "Please wait..."
      sleep 1
      echo -e "Launching..."
      sleep 1
      ITNmod -i
fi

clear
printf '\033]2;install.sh\a'
sleep 3
echo -e "Do you want to protect ITNtools with password?(\033[1;33myes\033[0m/\033[1;33mno\033[0m):"
echo -e "This function will protect ITNtools with login and password!"
echo -e "So without thinking protect ITNtools now!"
echo -e "Only use 'yes' for the best way!"
read -e -p $'(\033[4;93mprotect\033[0m\en)> ' WQE


if [[ "$WQE" = "no" ]]
then
clear
	echo -e "OK..."
	sleep 1
	echo -e "To protect ITNtools, run '"$YS"epasswd"$CE"'"
	touch /etc/ITNtools/login
        touch /etc/ITNtools/password
        sleep 3
	clear
fi

if [[ "$WQE" = "yes" ]]
then
if [[ -f /etc/ITNtools/login ]]
then
sleep 0
else
clear
printf '\033]2;install.sh\a'
sleep 3
echo -e "Set ITNtools login and password!"
echo -e "ITNtools Password Protection:"

sleep 0.5
read -e -p $'(\033[4;93m(new)login\033[0m\en)> ' logins
while [ "$logins" = "root" ]
do
sleep 0.5
echo -e "["$RS"*"$CE"] "$RS"This user is reserved by the ITNtools system!"$CE""
sleep 0.5
read -e -p $'(\033[4;93m(new)login\033[0m\en)> ' logins
done

echo $logins >> /etc/ITNtools/login

sleep 0.5
read -s -p $'(\033[4;93m(new)password\033[0m\en)> ' passwords

echo $passwords >> /etc/ITNtools/password

cd /root/ITNtools/lib
chmod +x liblogin
passcode="$(cat /root/ITNtools/etc/.config)"
echo $passcode | ./liblogin

cd /root/ITNtools/lib
chmod +x libchattr
passcode="$(cat /root/ITNtools/etc/.config)"
echo $passcode | ./libchattr


echo -e
echo -e

printf '\033]2;Configuring...\a'

function ProgressBar {

    let _progress=(${1}*100/${2}*100)/100
    let _done=(${_progress}*4)/10
    let _left=40-$_done

    _fill=$(printf "%${_done}s")
    _empty=$(printf "%${_left}s")

                         
        
printf "\rConfiguring: [${_fill// /\#}${_empty// /-}] ${_progress}%%"

}


_start=1

_end=100

for number in $(seq ${_start} ${_end})
do
    sleep 0.2
    ProgressBar ${number} ${_end}
done

sleep 5
fi
fi

clear
printf '\033]2;install.sh\a'
sleep 3
echo -e "Create your ITNtools config key for "$YS"/etc/ITNtools/.config"$CE""
echo -e "The ITNtools config key is intended to protect ITNtools boot!"
echo -e "It is recommended to create a strong ITNtools config key!"
read -e -p $'(\033[4;93mconfig_key\033[0m\en)> ' DADI
if [[ "$DADI" = "" ]]
then
sleep 0
else
{
rm /root/ITNtools/etc/.config
} &> /dev/null
echo $DADI >> /root/ITNtools/etc/.config
fi

cd /root/ITNtools/lib
chmod +x libconf
passcode="$(cat /root/ITNtools/etc/.config)"
echo $passcode | ./libconf

if [[ "$(cat /etc/ITNtools/login)" = "" ]]
then
sleep 0
else
cd /root/ITNtools/lib
chmod +x libenc
passcode="$(cat /root/ITNtools/etc/.config)"
echo $passcode | ./libenc
fi

clear
printf '\033]2;install.sh\a'
sleep 3
echo -e "Do you want to create ITNtools application(\033[1;33myes\033[0m/\033[1;33mno\033[0m):"
echo -e "This will allow you to run ITNtools via the application!"
echo -e "ITNtools application will be created in the applications!"
read -e -p $'(\033[4;93mcreate\033[0m\en)> ' ES

if [[ "$ES" = "yes" ]]
then
cp /root/ITNtools/app/ITNtools.desktop /usr/share/applications
chmod +x /usr/share/applications/ITNtools.desktop
fi

if [[ "$ES" = "no" ]]
then
clear
	echo -e "OK..."
	sleep 1
	echo -e "To create ITNtools application, run '"$YS"ITNapp -c"$CE"'"
        sleep 3
fi


clear
printf '\033]2;install.sh\a'
sleep 3
echo -e "Open a NEW terminal and type '"$YS"ITNtools"$CE"' to launch the framework"
sleep 0.5
echo -e "If you want to configure ITNtools application, run '"$YS"ITNapp"$CE"'"
sleep 0.5
echo -e "If you want to change ITNtools config key, run '"$YS"ITNkey"$CE"'"
sleep 0.5
echo -e "If you want to configure ITNtools modules, run '"$YS"ITNmod"$CE"'"
sleep 0.5
echo -e "If you want to change ITNtools password, run '"$YS"epasswd"$CE"'"
sleep 1
exit
