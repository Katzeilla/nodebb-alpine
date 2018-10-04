#! /bin/bash


if [[ ! -d /home/node/nodebb ]]; then
	su node -c "/setup.sh"
fi

chown -R node /home/node/nodebb
su node -c "/start.sh"


