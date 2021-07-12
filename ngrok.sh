#!/usr/bin/bash
echo -e "\e[32m"
echo -e "\e[31mWhich os are you running:\e[0m"
echo " "
echo -e "\e[35mLinux \e[32m[\e[31ml\e[32m]\e[0m"
echo " "
echo -e "\e[35mTermux \e[32m[\e[31mt\e[32m]\e[0m"
echo " "
read -p $'\e[32m[\e[35m*\e[32m] \e[36m(\e[31ml\e[33m/\e[31mt\e[36m)\e[33m:\e[32m ' os
if [[ $os == 'l' || $os == 'L' ]]; then
clear

sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get install wget curl php toilet figlet unzip ruby -y
sudo gem install lolcat
sudo wget -O $PREFIX/usr/share/figlet/ASCII-Shadow.flf https://raw.githubusercontent.com/xero/figlet-fonts/master/ANSI%20Shadow.flf
sleep 1
echo " "
echo -n -e "\e[31mpress enter to continue\e[32m..... "
read ts2
clear

toilet -f ASCII-Shadow -F border:metal ngrok
echo -e "\e[1;36m   	.:.:. \e[0m\e[1;35m creator || n1lby73 \e[1;36m.:.:."
echo " "
echo -e ".:.\e[1;35m email: n1lby73@gmail.com | github: github.com/n1lby73 \e[1;36m.:."
echo -e "          .:.\e[1;35minstagram: n1lby73 | twitter: n1l_by73\e[1;36m.:."
echo " "
echo -e "\e[101m\e[1;37mDISCLAIMER:                                              "
echo -e "dvelopers would not be held responsible for the misuse or"
echo -e "damaged caused by the use of this script                 \e[0m\n"
echo " "

echo -e "\e[32m[\e[31m1\e[32m]\e[34m install and configure ngrok server\e[0m"
echo -e "\e[32m[\e[31m2\e[32m]\e[34m start up ngrok session\e[0m"
echo " "

read -p $'\e[31mchoose an option\e[33m:\e[32m ' choose
if [[ $choose == 1 || $choose == 01 ]]; then
echo " "
echo -e "\e[36minstalling all neccessary configuration\e[31m.....\e[32m"
sleep 1
wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
sleep 2
echo " "

echo -e "\e[36mconfiguring ngrok to work wth your terminal\e[31m.....\e[32m"
sleep 2
unzip ngrok-stable-linux-amd64.zip
rm -rf ngrok-stable-linux-amd64.zip
sleep 2

echo " "
echo -e '\e[36mcopy and paste Authtoken given in \e[31mngrok.com\e[36m, and press \e[32m[\e[33mENTER\e[32m]\e[33m:\e[32m ' 
read authtoken
#./ngrok authtoken $authtoken
echo " "
echo -e "\e[33mconnecting account\e[31m.....\e[32m"
sleep 2
./ngrok authtoken $authtoken
echo " "
echo -e "\e[31minstallation completed successfully\e[0m"
echo " "

read -p $'\e[34mDo you want to start portfowarding\e[31m?\e[36m (\e[33my\e[31m/\e[33mn\e[36m):\e[32m ' n1l

if [[ $n1l == 'n' || $n1l == 'N' ]]; then
echo " "
echo -e "\e[31mClearing all footsteps and tracks....."
sleep 3
echo -e "exiting\e[0m"
sleep 1
clear
exit

echo " "
elif [[ $n1l == 'y' || $n1l == 'Y' ]]; then
echo -n -e '\e[35menter your tunneling protocol and port no, eg "\e[31mhttp 80\e[35m" and press [\e[33mENTER\e[35m]\e[33m:\e[32m '
read start
echo " "
echo -e "\e[31mstarting up portforwarding session...\e[32m"

sleep 2
./ngrok $start

else
echo "wrong value entered; existing..."
exit
fi

elif [[ $choose == 2 || $choose == 02 ]]; then
echo " "
sleep 1
echo -n -e '\e[35menter your tunneling protocol and port no, eg "\e[31mhttp 80\e[35m" and press [\e[33mENTER\e[35m]\e[33m:\e[32m '
read start
echo " "
echo -e "\e[31mstarting up portforwarding session...\e[32m"

sleep 2
./ngrok $start

else
echo "\e[36mInvalid option... restarting tool in 5 seconds\e[0m"
sleep 5
bash ngrok.sh
fi

elif [[ $os == 't' || $os == 'T' ]]; then
bash termux.sh

else 
echo " "
echo -e "\e[36minvalid option\e[0m"
sleep 2
clear
bash ngrok.sh
fi
