#!/bin/bash
#Script para executar parsing html
echo -e "\033[31m===========================================================================================================\033[0m";
echo " "
echo -e "\033[35m                                        ##                                ###        ##               ### ";
echo -e "\033[35m                                                                           ##        ##                ## ";
echo -e "\033[35m  ######    ####    ######    #####    ###     #####     ### ##            ##       #####   ##  ##     ## ";
echo -e "\033[35m   ##  ##      ##    ##  ##  ##         ##     ##  ##   ##  ##             #####     ##     #######    ## ";
echo -e "\033[35m   ##  ##   #####    ##       #####     ##     ##  ##   ##  ##             ##  ##    ##     ## # ##    ## ";
echo -e "\033[35m   #####   ##  ##    ##           ##    ##     ##  ##    #####             ##  ##    ## ##  ##   ##    ## ";
echo -e "\033[35m   ##       #####   ####     ######    ####    ##  ##       ##            ###  ##     ###   ##   ##   #### ";
echo -e "\033[35m  ####                                                  ##### ";
echo " ";
echo -e "\033[31m===========================================================================================================\033[0m";
echo "by Anderson Costa";

if [ "$1" == "" ]
then
	echo "PARSING HTML"
	echo "MODO DE USO: $0 {site}"
	echo "EXEMPLO: $0 nmap.org"
else

echo -e "\033[31m===========================================================================================================\033[0m";
echo " "
echo " "
echo -e "                          \033[1m\033[38;5;123m [+] Resolvendo URLs em: \033[95m$1\033[0m                                 ";
echo " "
echo " "
echo -e "\033[31m===========================================================================================================\033[0m";

#Baixa html
wget $1 2> /dev/null

#Filtra os  dominios
grep href *.html | cut -d "/" -f 3 | grep "\." | cut -d '"' -f 1 | grep -v "<l" | grep -v "{" | grep -v "\[" | grep -v "w3.org" | grep -v "<a" | grep -v "a>" | grep -v "png" > $1.ip.txt

echo -e "\033[31m===========================================================================================================\033[0m";
echo " ";
echo -e " \033[32m[+] Dominios salvos em: $1.ip.txt\033[0m";
echo " ";
echo -e "\033[31m===========================================================================================================\033[0m";

echo -e "\033[1m\033[35m___________________________________________________________________________________________________________\033[0m";
echo -e "\033[1m\033[35m|                                                                                                         |\033[0m";
echo -e "\033[1m\033[35m| LINHA |               IP                      |                   DOMINIO                               |\033[0m";
echo -e "\033[1m\033[35m|                                                                                                         |\033[0m";
echo -e "\033[1m\033[35m___________________________________________________________________________________________________________\033[0m";



#Verifica quais são os ips dos dominios extraídos
cont=1;

for url  in $(cat $1.ip.txt);
do
	ip=$(host $url | grep "has address" | cut -d " " -f 4);

	echo -e "\033[1m\033[35m|   $cont                   $ip                                      $url                                  \033[0m";

	cont=$(($cont + 1));	
done 

echo -e "\033[1m\033[35m___________________________________________________________________________________________________________\033[0m";

rm *.html

fi