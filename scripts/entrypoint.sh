#! /bin/bash

chown -R node /home/node/nodebb

if [[ ! -f /home/node/nodebb/config.json ]]; then
# Use config.json as a flag

	su node -c "/setup.sh"
fi

su node -c "/start.sh"


