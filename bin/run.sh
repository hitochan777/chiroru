HUBOT_NAME=chiroru
ADAPTER=slack
forever --minUptime 3000 --spinSleepTime 3000 start -c sh bin/hubot --adapter $ADAPTER --name $NAME
