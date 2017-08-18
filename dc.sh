#!/bin/sh

SEARCHFILE="docker-compose.yml"

case "$1" in
        start)
            OPTION="docker-compose up -d"
            ;;
         
        stop)
            OPTION="docker-compose down"
            ;;
         
        *)
            echo $"Usage: $0 {start|stop}"
            exit 1
 
esac

for i in $(find . -maxdepth 2 -name $SEARCHFILE | sed -e "s/$SEARCHFILE//g");
do
 cd $i
 $OPTION
 cd ..
done



