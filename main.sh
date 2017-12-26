#! /bin/bash

dir=$(pwd)

date="[$(date)]"


nodebb_stop()
{
    docker stop nodebb-alpine
    docker rm nodebb-alpine
}

show_usage()
{
        echo "This is a bash script for manage NodeBB-alpine"
        echo "./main [ACTION]"
        echo
        echo "ACTION:"
        echo "stop                    Stop NodeBB-alpine"
        echo "debug                   Start in to bash"
        echo "--help, -h ,help        Show this message"
        echo
        echo "If no [ACTION], start normally"
}

  if [[ $1 == debug ]]; then
        flag='--entrypoint /bin/sh'
		echo $date 'Debug Mode'

elif [[ $1 == stop ]];then
        echo $date 'Stoping NodeBB-alpine......'
        stop_nginx
        exit

elif [[ $1 == --help ]] || [[ $1 == -h ]] || [[ $1 == help ]]; then
        show_usage
        exit

else
	    echo $date 'Normal Mode'
fi

docker run -it \
  -p 4567:4567 \
  --mount type=bind,source=$dir/nodebb,target=/home/node/nodebb \
  --name nodebb-alpine \
  $flag \
  demo:2

if [[ $? == 125 ]];
    then
    echo $date "Another nodebb-alpine already start, stop it......"
    nodebb_stop
    ./main.sh $1
  fi
