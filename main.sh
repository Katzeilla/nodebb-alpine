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
        echo "network <network_name>                   Connect to a network"
        echo "stop                                       Stop NodeBB-alpine"
        echo "build                                     Build NodeBB-alpine"
        echo "debug                                        Start in to bash"
        echo "--help, -h ,help                            Show this message"
        echo
        echo "If no [ACTION], start normally"
}

  if [[ $1 == debug ]]; then
        flag='--entrypoint /bin/sh'
		echo $date 'Debug Mode'

elif [[ $1 == network ]]; then
    if [[ $2 != "" ]]; then
        flag="--network $2"
        echo Connect to $2
    fi

elif [[ $1 == stop ]]; then
        echo $date 'Stoping NodeBB-alpine......'
        nodebb_stop
        exit

elif [[ $1 == build ]]; then
        echo $date 'Build NodeBB-alpine:testing ......'
	docker build . --tag nodebb-alpine:testing 
        exit

elif [[ $1 == --help ]] || [[ $1 == -h ]] || [[ $1 == help ]]; then
        show_usage
        exit

else
	    echo $date 'Normal Mode'
fi

docker run -it \
  --mount type=bind,source=$dir/nodebb,target=/home/node/nodebb \
  --name nodebb-alpine \
  $flag \
  nodebb-alpine:testing

if [[ $? == 125 ]];
    then
    echo $date "Another nodebb-alpine already start, stop it......"
    nodebb_stop
    ./main.sh $1
  fi