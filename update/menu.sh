#!/bin/bash
# =========================================
#!/bin/bash
BOT="https://raw.githubusercontent.com/YogzVpn/src/main/"
UPDATE="https://raw.githubusercontent.com/YogzVpn/VVIP/main/update/update.sh"
BURIQ () {
    curl -sS https://raw.githubusercontent.com/YogzVpn/izinvps/main/ip > /root/tmp
    data=( `cat /root/tmp | grep -E "^### " | awk '{print $2}'` )
    for user in "${data[@]}"
    do
    exp=( `grep -E "^### $user" "/root/tmp" | awk '{print $3}'` )
    d1=(`date -d "$exp" +%s`)
    d2=(`date -d "$biji" +%s`)
    exp2=$(( (d1 - d2) / 86400 ))
    if [[ "$exp2" -le "0" ]]; then
    echo $user > /etc/.$user.ini
    else
    rm -f /etc/.$user.ini > /dev/null 2>&1
    fi
    done
    rm -f /root/tmp
}

ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
MYIP=$(curl -sS ipv4.icanhazip.com)
Name=$(curl -sS https://raw.githubusercontent.com/YogzVpn/izinvps/main/ip | grep $MYIP | awk '{print $2}')
echo $Name > /usr/local/etc/.$Name.ini
CekOne=$(cat /usr/local/etc/.$Name.ini)

Bloman () {
if [ -f "/etc/.$Name.ini" ]; then
CekTwo=$(cat /etc/.$Name.ini)
    if [ "$CekOne" = "$CekTwo" ]; then
        res="Expired"
    fi
else
res="Permission Accepted..."
fi
}

PERMISSION () {
    MYIP=$(curl -sS ipv4.icanhazip.com)
    IZIN=$(curl -sS https://raw.githubusercontent.com/YogzVpn/izinvps/main/ip | awk '{print $4}' | grep $MYIP)
    if [ "$MYIP" = "$IZIN" ]; then
    Bloman
    else
    res="Permission Denied!"
    fi
    BURIQ
}
COLOR1='\033[0;33m'
COLOR2='\033[0;39m'
red='\e[1;31m'
green='\e[1;32m'
NC='\e[0m'
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }
PERMISSION

if [ "$res" = "Expired" ]; then
Exp="\e[36mExpired\033[0m"
else
Exp=$(curl -sS https://raw.githubusercontent.com/YogzVpn/izinvps/main/ip | grep $MYIP | awk '{print $3}')
fi

# =========================================
vlx=$(grep -c -E "^#& " "/etc/xray/config.json")
let vla=$vlx/2
vmc=$(grep -c -E "^### " "/etc/xray/config.json")
let vma=$vmc/2
ssh1="$(awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd | wc -l)"

trx=$(grep -c -E "^#! " "/etc/xray/config.json")
let tra=$trx/2
ssx=$(grep -c -E "^## " "/etc/xray/config.json")
let ssa=$ssx/2

UDPX="https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1S3IE25v_fyUfCLslnujFBSBMNunDHDk2' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1S3IE25v_fyUfCLslnujFBSBMNunDHDk2"
# // Exporting Language to UTF-8
export LC_ALL='en_US.UTF-8'
export LANG='en_US.UTF-8'
export LANGUAGE='en_US.UTF-8'
export LC_CTYPE='en_US.utf8'

# // Export Color & Information
export RED='\033[0;31m'
export GREEN='\033[0;32m'
export YELLOW='\033[0;33m'
export BLUE='\033[0;34m'
export PURPLE='\033[0;35m'
export CYAN='\033[0;36m'
export LIGHT='\033[0;37m'
export NC='\033[0m'

# // Export Banner Status Information
export EROR="[${RED} EROR ${NC}]"
export INFO="[${YELLOW} INFO ${NC}]"
export OKEY="[${GREEN} OKEY ${NC}]"
export PENDING="[${YELLOW} PENDING ${NC}]"
export SEND="[${YELLOW} SEND ${NC}]"
export RECEIVE="[${YELLOW} RECEIVE ${NC}]"

# // Export Align
export BOLD="\e[1m"
export WARNING="${RED}\e[5m"
export UNDERLINE="\e[4m"

# // Exporting URL Host
export Server_URL="autosc.me/aio"
export Server_Port="443"
export Server_IP="underfined"
export Script_Mode="Stable"
export Auther="FranataSTORE"

# // Root Checking
if [ "${EUID}" -ne 0 ]; then
		echo -e "${EROR} Please Run This Script As Root User !"
		exit 1
fi


# // Exporting IP Address
export IP=$( curl -s https://ipinfo.io/ip/ )

# // SSH Websocket Proxy
ssh_ws=$( systemctl status ws-epro | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $ssh_ws == "running" ]]; then
    status_ws="${GREEN}ON${NC}"
else
    status_ws="${RED}OFF${NC}"
fi

# // nginx
nginx=$( systemctl status nginx | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $nginx == "running" ]]; then
    status_nginx="${GREEN}ON${NC}"
else
    status_nginx="${RED}OFF${NC}"
fi

# // SSH Websocket Proxy
xray=$(/etc/init.d/ssh status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
if [[ $xray == "running" ]]; then
    status_xray="${GREEN}ON${NC}"
else
    status_xray="${RED}OFF${NC}"
fi

clear
clear
function add-host(){
clear
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1│${NC} ${COLBG1}               • ADD VPS HOST •                ${NC} $COLOR1│$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
read -rp "  New Host Name : " -e host
echo ""
if [ -z $host ]; then
echo -e "  [INFO] Type Your Domain/sub domain"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo ""
read -n 1 -s -r -p "  PENCET [ ENTER ] UNTUK KELUAR MENU"
menu
else
echo "IP=$host" > /var/lib/ssnvpn-pro/ipvps.conf
echo ""
echo "  [INFO] Dont forget to renew cert"
echo ""
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo ""
read -n 1 -s -r -p "  Press any key to Renew Cret"
crtxray
fi
}
clear
clear
echo -e "${RED}┌────────────────────────────────────────────────────────────┐${NC}"
echo -e "                      << INFORMASI VPS >>                    \E[0m" | lolcat    
echo -e "${RED}└────────────────────────────────────────────────────────────┘${NC}"
echo -e "  ${BLUE}• ${GREEN}Sever Uptime        ${NC}= $( uptime -p  | cut -d " " -f 2-10000 ) "
echo -e "  ${BLUE}• ${GREEN}Current Time        ${NC}= $( date -d "0 days" +"%d-%m-%Y | %X" )"
echo -e "  ${BLUE}• ${GREEN}Operating System    ${NC}= $( cat /etc/os-release | grep -w PRETTY_NAME | sed 's/PRETTY_NAME//g' | sed 's/=//g' | sed 's/"//g')( $(uname -m))"
echo -e "  ${BLUE}• ${GREEN}Current Domain      ${NC}= $( cat /etc/xray/domain )"
echo -e "  ${BLUE}• ${GREEN}Server IP           ${NC}= ${IP}"
echo -e "  ${BLUE}• ${GREEN}ISP-VPS             ${NC}= ${ISP}"
echo -e "  ${BLUE}• ${GREEN}City                ${NC}= ${CITY}"
echo -e "  ${BLUE}• ${GREEN}Clients Name        ${NC}= ${YELLOW}$Name ${NC}"
echo -e "  ${BLUE}• ${GREEN}Script Expired      ${NC}= ${YELLOW}$Exp ${NC}"
echo -e "  ${BLUE}• ${GREEN}Developer           ${NC}= YogzVPN Tunneling ${NC}"
echo -e "${RED}┌────────────────────────────────────────────────────────────┐${NC}"
echo -e "                     << STATUS SERVICE >>                    \E[0m" | lolcat    
echo -e "${RED}┌────────────────────────────────────────────────────────────┐${NC}"
echo -e "      ${COLOR2}[ SSH Websocket${NC}: ${GREEN}ON ${NC}]  [ NGINX${NC}: ${status_nginx} ] [ XRAY${NC} : ${status_xray} ] "
echo -e "${RED}└────────────────────────────────────────────────────────────┘${NC}"
echo -e "${RED}┌────────────────────────────────────────────────────────────┐${NC}"
echo -e "${RED}│  \033[0m ${BOLD}${YELLOW}SSH     VMESS       VLESS      TROJAN       SHADOWSOCKS$NC  ${RED}│"
echo -e "${RED}│  \033[0m ${Blue} $ssh1        $vma           $vla          $tra               $ssa   $NC    ${RED}│"
echo -e "${RED}└────────────────────────────────────────────────────────────┘${NC}"
echo -e "${RED}┌────────────────────────────────────────────────────────────┐${NC}"
echo -e "                     << MENU TUNNELING >>                    \E[0m" | lolcat    
echo -e "${RED}└────────────────────────────────────────────────────────────┘${NC}"
echo -e "   ${CYAN}[01]•${NC}${YELLOW}SSH${NC}        ${BLUE}[${NC}${CYAN}MENU${NC}${BLUE}]${NC}"      "${CYAN}[08]•${NC}${YELLOW} BACKUP${NC}     ${BLUE}[${NC}${CYAN}MENU${NC}${BLUE}]${NC}"
echo -e "   ${CYAN}[02]•${NC}${YELLOW}VMESS${NC}      ${BLUE}[${NC}${CYAN}MENU${NC}${BLUE}]${NC}"      "${CYAN}[09]•${NC}${YELLOW} SETTING${NC}    ${BLUE}[${NC}${CYAN}MENU${NC}${BLUE}]${NC}"
echo -e "   ${CYAN}[03]•${NC}${YELLOW}VLESS${NC}      ${BLUE}[${NC}${CYAN}MENU${NC}${BLUE}]${NC}"      "${CYAN}[10]•${NC}${YELLOW} INFORMATION${NC}${BLUE}[${NC}${CYAN}MENU${NC}${BLUE}]${NC}"
echo -e "   ${CYAN}[04]•${NC}${YELLOW}TROJAN${NC}     ${BLUE}[${NC}${CYAN}MENU${NC}${BLUE}]${NC}   "      "${CYAN}[11]•${NC}${YELLOW} ADD DOMAIN${NC} ${BLUE}[${NC}${CYAN}MENU${NC}${BLUE}]${NC}"
echo -e "   ${CYAN}[05]•${NC}${YELLOW}SSWS${NC}       ${BLUE}[${NC}${CYAN}MENU${NC}${BLUE}]${NC}   "      "${CYAN}[12]•${NC}${YELLOW} CERT XRAY${NC}  ${BLUE}[${NC}${CYAN}MENU${NC}${BLUE}]${NC}"
echo -e "   ${CYAN}[06]•${NC}${YELLOW}UPDATE${NC}     ${BLUE}[${NC}${CYAN}MENU${NC}${BLUE}]${NC}   "      "${CYAN}[13]•${NC}${YELLOW} AUTO REBOOT${NC}${BLUE}[${NC}${CYAN}MENU${NC}${BLUE}]${NC}"
echo -e "   ${CYAN}[07]•${NC}${YELLOW}INSTALL UDP${NC}${BLUE}[${NC}${CYAN}MENU${NC}${BLUE}]${NC}   "      "${CYAN}[14]•${NC}${YELLOW} BOT${NC}        ${BLUE}[${NC}${CYAN}MENU${NC}${BLUE}]${NC}"
echo -e "${RED}┌────────────────────────────────────────────────────────────┐${NC}"
echo -e "              << SCRIPT BY YOGZVPN TUNNELING >>              \E[0m" | lolcat
echo -e "${RED}└────────────────────────────────────────────────────────────┘${NC}"
echo -e ""
echo -ne " Select Menu : "; read opt
case $opt in
01 | 1) clear ; menu-ssh ;;
02 | 2) clear ; menu-vmess ;;
03 | 3) clear ; menu-vless ;;
04 | 4) clear ; menu-trojan ;;
05 | 5) clear ; menu-ss ;;
06 | 6) clear ; wget ${UPDATE} && chmod +x update.sh && ./update.sh ;;
07 | 7) clear ; wget https://raw.githubusercontent.com/pusoxx/Ver3/main/update.sh && chmod +x update.sh && ./update.sh && rm -f /root/update.sh ;;
08 | 8) clear ; menu-backup ;;
09 | 9) clear ; menu-set ;;
10) clear ; info ;;
11) clear ; add-host ;;
12) clear ; crtxray ;;
13) clear ; auto-reboot ;;
14) clear ; wget ${BOT}xolpanel.sh && chmod +x xolpanel.sh && ./xolpanel.sh ;;
999) clear ; $up2u ;;
00 | 0) clear ; menu ;;
*) clear ; menu ;;
esac
