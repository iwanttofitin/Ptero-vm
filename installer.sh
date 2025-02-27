#!/bin/bash
clear
echo "=============================="
echo "VER 4.2"
echo "Soon Full linux vnc server"
echo "Copy paste function"
echo "More hosting support"
echo "=============================="
sleep 1
clear
export LANG=ru_RU.UTF-8
export LANGUAGE=ru_RU.UTF-8
export LC_ALL=ru_RU.UTF-8
APTHinstalled=""
LDinstalled=""
Linstalled=""
Sinstalled=""
Pinstalled=""
Ginstalled=""
Winstalled=""
HOMEA="$HOME/linux"
STAR1="$HOMEA/lib:$HOMEA/usr/lib:$HOMEA/var/lib:$HOMEA/usr/lib/x86_64-linux-gnu:$HOMEA/lib/x86_64-linux-gnu:$HOMEA/lib:$HOMEA/usr/lib/sudo"
STAR2="$HOMEA/usr/include/x86_64-linux-gnu:$HOMEA/usr/include/x86_64-linux-gnu/bits:$HOMEA/usr/include/x86_64-linux-gnu/gnu"
STAR3="$HOMEA/usr/share/lintian/overrides/:$HOMEA/usr/src/glibc/debian/:$HOMEA/usr/src/glibc/debian/debhelper.in:$HOMEA/usr/lib/mono"
STAR4="$HOMEA/usr/src/glibc/debian/control.in:$HOMEA/usr/lib/x86_64-linux-gnu/libcanberra-0.30:$HOMEA/usr/lib/x86_64-linux-gnu/libgtk2.0-0"
STAR5="$HOMEA/usr/lib/x86_64-linux-gnu/gtk-2.0/modules:$HOMEA/usr/lib/x86_64-linux-gnu/gtk-2.0/2.10.0/immodules:$HOMEA/usr/lib/x86_64-linux-gnu/gtk-2.0/2.10.0/printbackends"
STAR6="$HOMEA/usr/lib/x86_64-linux-gnu/samba/:$HOMEA/usr/lib/x86_64-linux-gnu/pulseaudio:$HOMEA/usr/lib/x86_64-linux-gnu/blas:$HOMEA/usr/lib/x86_64-linux-gnu/blis-serial"
STAR7="$HOMEA/usr/lib/x86_64-linux-gnu/blis-openmp:$HOMEA/usr/lib/x86_64-linux-gnu/atlas:$HOMEA/usr/lib/x86_64-linux-gnu/tracker-miners-2.0:$HOMEA/usr/lib/x86_64-linux-gnu/tracker-2.0:$HOMEA/usr/lib/x86_64-linux-gnu/lapack:$HOMEA/usr/lib/x86_64-linux-gnu/gedit:$HOMEA/usr/lib/x86_64-linux-gnu/xrdp"
STAR8="$HOMEA/usr/lib/*:$HOMEA/usr/share/*"

echo 'Initialising environment -> APTH'
echo '|==>...................|10%'
STARALL="$STAR1:$STAR2:$STAR3:$STAR4:$STAR5:$STAR6:$STAR7:$STAR8"
PATALL="$HOMEA/bin:$HOMEA/usr/bin:$HOMEA/sbin:$HOMEA/usr/sbin:$HOMEA/etc/init.d:$HOMEA/udocker:$PATH"

APTHinstalled="APTH already installed | skip [Info]"
if ! [ -f $HOME/usr/bin/apth ];
then
mkdir -p $HOMEA/usr/bin/
curl -o $HOMEA/usr/bin/apth https://igriastranomier.ucoz.ru/apth.txt
chmod +x $HOMEA/usr/bin/apth
APTHinstalled="APTH Donwnloaded [OK]"
fi
clear

echo "$APTHinstalled"
echo 'Initialising environment -> LIBRARY'
echo '|==========>...........|50%'

Linstalled="LIBRARY_PATH already modifed [info]"
if ! [ -n "$LIBRARY_PATH" ];
then
export LIBRARY_PATH=$STARALL
Linstalled="LIBRARY_PATH is installed [OK]"
fi


clear

echo "$APTHinstalled"
echo "$Linstalled"
echo 'Initialising environment -> LD LIBRARY '
echo '|============>.........|60%'
LDinstalled="LD_LIBRARY_PATH already modifed [Info]"
Pinstalled="PATH already modifed [Info]"
clear

if ! [ -n "$LD_LIBRARY_PATH" ];
then
export LD_LIBRARY_PATH=$STARALL
LDinstalled="LD_LIBRARY_PATH is installed [OK]"

clear


echo "$APTHinstalled"
echo "$Linstalled"
echo "$LDinstalled"
echo 'Initialising environment -> PATH '
echo "|===============>......|75%"
export PATH=$PATALL
Pinstalled="PATH env modifed [OK]"

clear

echo "$APTHinstalled"
echo "$Linstalled"
echo "$LDinstalled"
echo "$Pinstalled"
echo "Rebooting system bash"
echo "|\================/|"

clear
bash $HOME/1.sh
fi

echo "$APTHinstalled"
echo "$Linstalled"
echo "$LDinstalled"
echo "$Pinstalled"
echo "System loaded [OK]"
echo "Searching -> wget package"
echo "|===============>....|70%"
Sinstalled="Wget already installed skip it [Info]"
if ! [ -f $HOMEA/usr/bin/wget ];
then

clear
echo "$APTHinstalled"
echo "$Linstalled"
echo "$LDinstalled"
echo "$Pinstalled"
echo "System loaded [OK]"
echo 'Installing WGET'
echo "|===============>|80%"
mkdir -p $HOME/linux
apt download wget
dpkg-deb -x wget*.deb $HOME/linux
rm wget*.deb
Sinstalled="Wget is installed [OK]"
fi
clear


echo "$APTHinstalled"
echo "$Linstalled"
echo "$LDinstalled"
echo "$Pinstalled"
echo "System loaded [OK]"
echo "$Sinstalled"
echo "Searching -> GoTTy package"
echo "|===============>...|85%"
Ginstalled="Gotty already installed [Info]"
if ! [ -f $HOMEA/gotty ];
then

clear
echo "$APTHinstalled"
echo "$Linstalled"
echo "$LDinstalled"
echo "$Pinstalled"
echo "System loaded [OK]"
echo "$Sinstalled"
echo "Installing GoTTy package"
echo "|===============>...|89%"
wget -O $HOMEA/1.tar.gz https://github.com/yudai/gotty/releases/download/v1.0.1/gotty_linux_amd64.tar.gz
cd $HOME/linux && tar xvf 1.tar.gz
rm -r 1.tar.gz
chmod +x gotty
Ginstalled="Gotty is installed [OK]"
fi

clear

echo "$APTHinstalled"
echo "$Linstalled"
echo "$LDinstalled"
echo "$Pinstalled"
echo "System loaded [OK]"
echo "$Sinstalled"
echo "$Ginstalled"
echo "Searching -> udocker package"
echo "|===============>..|90%"
Winstalled="Udocker package already installed [Info]"
if ! [ -f $HOME/linux/udocker/udocker ];
then
apth python
mkdir -p $HOME/.udocker/containers
clear
echo 'Downloading udocker for docker rootless'
echo "$APTHinstalled"
echo "$Linstalled"
echo "$LDinstalled"
echo "$Pinstalled"
echo "System loaded [OK]"
echo "$Sinstalled"
echo "$Ginstalled"
echo "|===============>..|95%"
wget -O $HOME/linux/1.tar.gz https://github.com/indigo-dc/udocker/releases/download/v1.3.1/udocker-1.3.1.tar.gz
wget -O $HOME/.udocker/containers/1.tar.gz https://www.dropbox.com/s/5td5f6xyp8kcgwk/hello.tar.gz?dl=1
cd $HOME/.udocker/containers && tar zxvf 1.tar.gz && rm -r 1.tar.gz
cd $HOME/linux && tar zxvf 1.tar.gz && rm -r 1.tar.gz
rm -r 1.tar.gz
chmod +x $HOME/linux/udocker/udocker
Winstalled="Udocker package installed [OK]"
udocker run vnc apk add bash
fi
clear


echo "$APTHinstalled"
echo "$Linstalled"
echo "$LDinstalled"
echo "$Pinstalled"
echo "System loaded [OK]"
echo "$Sinstalled"
echo "$Ginstalled"
echo "Starting server"
echo "|\===============/|"
echo " "
echo " "

echo "--------------"
if [ -f $HOME/linux/gotty ];
then
echo "**| Open url: $SERVER_IP:$SERVER_PORT |**"
echo " "
echo " "
echo "Command for run full |-(ALPINE)-| linux -> udocker run vnc"
echo " "
echo "My vk (GOODGAMEMAGA) (orig release)"
echo "Guide how to https://www.youtube.com/watch?v=5aKDtzBtAr8 "
echo " "
echo "If you need install package Use command APTH"
echo "I have no name!@ID -> APTH 'name of package without quotes'"
echo "preferences { ctrl_c_copy = true ctrl_v_paste = true}" >$HOME/.gotty
echo "If you don't want web terminal"
echo "Create startcustom.sh in same folder"
echo 'Write (non root commands) e.g echo "helloWorld"'
echo "-----------"

if ! [ -f $HOME/startcustom.sh ];
then
echo "startcustom.sh not found. Creating web bash"
$HOME/linux/gotty -p $SERVER_PORT -w bash
fi
if [ -f $HOME/startcustom.sh ];
then
cd $HOME
echo "startcustom.sh FOUND. opening it!"
chmod +x $HOME/startcustom.sh
bash $HOME/startcustom.sh
fi
fi
echo "--------------"
