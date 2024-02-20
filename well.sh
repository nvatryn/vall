#!/bin/bash
clear
#ambil source dari vpsmu yg normal
function carane(){
cp -rf /usr/lib/x86_64-linux-gnu /root
cd /root
zip -r x86_64-linux-gnu.zip x86_64-linux-gnu
cp -f x86_64-linux-gnu.zip /home/vps/public_html
cp -f x86_64-linux-gnu.zip /var/www/html
}
#carane

#buat webget perhatikan portnya, SC Casper menggunakan port 89 , SC base fighter tunnel menggunakan port 81, Contoh: wget http://vpn.telkomsel.cloud:89/x86_64-linux-gnu.zip

echo "jangan lupa copy file ini lalu simpan ke repomu"

wget https://github.com/nvatryn/vall

unzip *gnu.zip

cp -rf /root/x86_64-linux-gnu/* /usr/lib/x86_64-linux-gnu/

cp -rf /root/x86_64-linux-gnu/libbrotlicommon.so.1 /usr/lib/x86_64-linux-gnu/

#bersihkan trash
#rm -rf /root/x86_64-linux-gnu/
rm -rf /root/x86_64-linux-gnu/
rm -rf /root/x86_64-linux-gnu.zip

function analisa(){
#apt install mlocate locate
#locate libbrotlicommon.so.1

#cp -rf /usr/lib/x86_64-linux-gnu/ /root
#cp /usr/lib/x86_64-linux-gnu/libbrotlidec.so.1 /root
#cp /usr/lib/x86_64-linux-gnu/libbrotlidec.so.1.0.7 /root
#cp /usr/lib/x86_64-linux-gnu/libssh.so.4 /root
#cp /usr/lib/x86_64-linux-gnu/libssh.so.4.8.4 /root
cp -f /root/libssh.so.4 /usr/lib/x86_64-linux-gnu/libssh.so.4
cp -f /root/libssh.so.4.8.4 /usr/lib/x86_64-linux-gnu/libssh.so.4.8.4

cp -f /root/libbrotlidec.so.1 /usr/lib/x86_64-linux-gnu/libbrotlidec.so.1
cp -f /root/libbrotlidec.so.1.0.7 /usr/lib/x86_64-linux-gnu/libbrotlidec.so.1.0.7

chmod +x /root/wget
chmod +x /root/curl
cp -f /root/wget /usr/bin
cp -f /root/curl /usr/bin

cp -f /root/libcurl.so.4 /usr/lib/x86_64-linux-gnu/libcurl.so.4
cp -f /root/libcurl.so.4.6.0 /usr/lib/x86_64-linux-gnu/libcurl.so.4.6.0
}
analisa

# COLOR VALIDATION
clear
y='\033[1;33m' #yellow
BGX="\033[42m"
CYAN="\033[96m"
z="\033[95;1m"
f="\033[1;97;41m"
G="\033[92m"
RED='\033[0;31m'
NC='\033[0m'
gray="\e[1;30m"
Blue="\033[0;34m"
green='\033[0;32m'
grenbo="\e[92;1m"
purple="\033[1;95m"
YELL='\033[0;33m'

# underline
UPU='\033[5;35m'
UCY='\033[5;36m'
UWH='\033[5;37m'

r="\033[1;31m"  # merah
a="ACCOUNT PREMIUM" 
BWC='\033[1;36'
cyan='\033[96m'
bwhite='\033[1;37m'

# // Checking Os Architecture

function CheckingOs(){
if [[ $( uname -m | awk '{print $1}' ) == "x86_64" ]]; then
    echo -e "${OK} Your Architecture Is Supported ( ${green}$( uname -m )${NC} )"
else
    echo -e "${EROR} Your Architecture Is Not Supported ( ${YELLOW}$( uname -m )${NC} )"
    exit 1
fi
}
CheckingOs

# // Checking System

function CheckingSystem(){
if [[ $( cat /etc/os-release | grep -w ID | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/ID//g' ) == "ubuntu" ]]; then
    echo -e "${OK} Your OS Is Supported ( ${green}$( cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/PRETTY_NAME//g' )${NC} )"
elif [[ $( cat /etc/os-release | grep -w ID | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/ID//g' ) == "debian" ]]; then
    echo -e "${OK} Your OS Is Supported ( ${green}$( cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/PRETTY_NAME//g' )${NC} )"
else
    echo -e "${EROR} Your OS Is Not Supported ( ${YELLOW}$( cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/PRETTY_NAME//g' )${NC} )"
    exit 1
fi
}
CheckingSystem

export IP=$( curl -s https://ipinfo.io/ip/ )

# // IP Address Validating

function IPAddressValidating(){
if [[ $IP == "" ]]; then
    echo -e "${EROR} IP Address ( ${YELLOW}Not Detected${NC} )"
else
    echo -e "${OK} IP Address ( ${green}$IP${NC} )"
fi
}
IPAddressValidating
sleep 3

### Status
function print_ok() {
    echo -e "${OK} ${BLUE} $1 ${FONT}"
}
function print_install() {
	echo -e "${green} ◇━━━━━━━━━━━━━━━━━━━━━━━◇ ${FONT}"
    echo -e "${YELLOW} # $1 ${FONT}"
	echo -e "${green} ◇━━━━━━━━━━━━━━━━━━━━━━━◇ ${FONT}"
    sleep 1
}

function print_error() {
    echo -e "${ERROR} ${REDBG} $1 ${FONT}"
}

function print_success() {
    if [[ 0 -eq $? ]]; then
		echo -e "${green} ◇━━━━━━━━━━━━━━━━━━━━━━━◇ ${FONT}"
        echo -e "${Green} # $1 berhasil dipasang"
		echo -e "${green} ◇━━━━━━━━━━━━━━━━━━━━━━━◇ ${FONT}"
        sleep 2
    fi
}

function first_setup(){
    timedatectl set-timezone Asia/Jakarta
    echo iptables-persistent iptables-persistent/autosave_v4 boolean true | debconf-set-selections
    echo iptables-persistent iptables-persistent/autosave_v6 boolean true | debconf-set-selections
    print_success "Directory Xray"
    if [[ $(cat /etc/os-release | grep -w ID | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/ID//g') == "ubuntu" ]]; then
    echo "Setup Dependencies $(cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/PRETTY_NAME//g')"
    sudo apt update -y
    apt-get install --no-install-recommends software-properties-common
    add-apt-repository ppa:vbernat/haproxy-2.0 -y
    apt-get -y install haproxy=2.0.\*
elif [[ $(cat /etc/os-release | grep -w ID | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/ID//g') == "debian" ]]; then
    echo "Setup Dependencies For OS Is $(cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/PRETTY_NAME//g')"
    curl https://haproxy.debian.net/bernat.debian.org.gpg |
        gpg --dearmor >/usr/share/keyrings/haproxy.debian.net.gpg
    echo deb "[signed-by=/usr/share/keyrings/haproxy.debian.net.gpg]" \
        http://haproxy.debian.net buster-backports-1.8 main \
        >/etc/apt/sources.list.d/haproxy.list
    sudo apt-get update
    apt-get -y install haproxy=1.8.\*
else
    echo -e " Your OS Is Not Supported ($(cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/PRETTY_NAME//g') )"
    exit 1
fi
}

first_setup

apt-get update -y
apt-get install curl wget

function testinghasil(){
MYIP=$(curl -sS ipv4.icanhazip.com)
echo ""
izinsc="https://raw.githubusercontent.com/nvatryn/vall/GM/Register"
# USERNAME
rm -f /usr/bin/user
username=$(curl ${izinsc} | grep $MYIP | awk '{print $2}')
echo "$username" >/usr/bin/user
# validity
rm -f /usr/bin/e
valid=$(curl ${izinsc} | grep $MYIP | awk '{print $3}')
echo "$valid" >/usr/bin/e
# DETAIL ORDER
username=$(cat /usr/bin/user)
oid=$(cat /usr/bin/ver)
exp=$(cat /usr/bin/e)
clear
# CERTIFICATE STATUS
d1=$(date -d "$valid" +%s)
d2=$(date -d "$today" +%s)
certifacate=$(((d1 - d2) / 86400))
# VPS Information
DATE=$(date +'%Y-%m-%d')
datediff() {
    d1=$(date -d "$1" +%s)
    d2=$(date -d "$2" +%s)
    echo -e "$COLOR1 $NC Expiry In   : $(( (d1 - d2) / 86400 )) Days"
}
mai="datediff "$Exp" "$DATE""

# Status Expired Or Active
Info="(${green}Active${NC})"
Error="(${RED}Expired${NC})"
today=`date -d "0 days" +"%Y-%m-%d"`
Exp1=$(curl ${izinsc} | grep $MYIP | awk '{print $3}')
if [[ $today < $Exp1 ]]; then
sts="${Info}"
else
sts="${Error}"
fi
echo -e " ${NC} ╰════════════════════════════════════════════════════════════════╯"
echo -e " ${NC} ╭════════════════════════════════════════════════════════════════╮"
echo -e " ${NC} │$bblue Script Version $YELL=$NC V2.1"
echo -e " ${NC} │$bblue Script Status  $YELL=$NC $sts"
echo -e " ${NC} │$bblue Username       $YELL=$green $username "
echo -e " ${NC} │$bblue Expiry Script  $YELL=$NC $exp ${NC}/$green $certifacate ${NC}Days"
echo -e " ${NC} ╰════════════════════════════════════════════════════════════════╯"
}
testinghasil
exit 0