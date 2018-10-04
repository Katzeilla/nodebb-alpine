#! /bin/bash

cd /home/node/ || exit

NodeBB_branch="v1.10.x"

echo NodeBB not found, clone "$NodeBB_branch" from nodebb/nodebb
git clone https://github.com/nodebb/nodebb -b "$NodeBB_branch"

/home/node/nodebb/nodebb setup
