#!/bin/bash
#Need to have public key auth setup and username on local system should be the same as the router else you could change $USER to your fortigate user ID.

function useage(){
        site_list=`/bin/cat sites.txt`
        echo "$site_list"
        echo ""
        echo "Usage ./qcon.sh 3-digit site."
        echo "Example Path Inside: ./qcon.sh ont"
        echo "Example Path Outside: ./qcon.sh ont o"
        echo ""
        exit 1
}



if [ "$1" = "" ]
then
        useage
fi


site="$1"

if [ "$2" = "" ]
then
        path="3"
else
        path="2"
fi


site=`cat sites.txt| grep $1 -i -m 1 | cut -d, -f 1`
ip=`cat sites.txt| grep $1 -i -m 1 | cut -d, -f $path`
echo "Opening up SSH Session to $site: $ip"

ssh "$USER@$ip"



## Sample sites.txt
#SiteName,ExternalIP,InternalIP
#Ontario,127.0.0.1,192.168.1.1


