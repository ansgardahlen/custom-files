#!/bin/sh

SEARCHFILE="docker-compose.yml"
HOMEDIR=`pwd`

case "$1" in
        start)
            OPTION="docker-compose up -d"
            ;;
         
        stop)
            OPTION="docker-compose down"
            ;;
        restart)
            OPTION="docker-compose restart"
            ;;
         
        status)
            docker ps --format "table {{.Names}}\t{{.ID}}\t{{.Image}}\t{{.Ports}}"
            exit 0
            ;;
        *)
            echo $"Usage: $0 {start|stop|restart|status}"
            exit 1
 
esac

for i in $(find . -maxdepth 3 -name $SEARCHFILE | sed -e "s/$SEARCHFILE//g");
do
 cd $i
 $OPTION
 cd $HOMEDIR
done



