HUBOT_NAME=chiroru
ADAPTER=slack
forever --minUptime 3000 --spinSleepTime 3000 start -c coffee node_modules/.bin/hubot --adapter $ADAPTER --name $NAME
