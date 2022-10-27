#!/bin/sh
cat << EOF


     ____.     .__                 ________.__                   
    |    |__ __|__| ____  ____    /   _____|  |__   ____ ______  
    |    |  |  |  _/ ____/ __ \   \_____  \|  |  \ /  _ \\____ \ 
/\__|    |  |  |  \  \__\  ___/   /        |   Y  (  <_> |  |_> >
\________|____/|__|\___  \___  > /_______  |___|  /\____/|   __/ 
                       \/    \/          \/     \/       |__|    

EOF
echo '============== Pull the latest Docker image =============='
echo
docker pull bkimminich/juice-shop
echo
echo '===== Remove previous container and start a new one ======'
echo
ID=$(docker ps -a | grep -e "bkimminich/juice-shop" | awk 'NR == 1 {print $1}')
if [ -z "$ID" ]
then
        echo 'NO CONTAINER REMOVED'
else
        echo 'ID CONTAINER REMOVED:' $(docker rm -fv $ID) 
fi
unset ID
echo
echo 'ID CONTAINER CREATED:'
docker run --restart always -d -p 3000:3000 bkimminich/juice-shop
echo
docker images -a
echo
docker ps -a
echo
echo '========================== DONE =========================='
echo
