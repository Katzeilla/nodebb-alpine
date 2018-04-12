#! /bin/bash

NodeBB_branch="v1.8.x"

cd /home/node/
echo NodeBB not found, clone $Nodebb_branch from nodebb/nodebb
git clone https://github.com/nodebb/nodebb -b $NodeBB_branch

/home/node/nodebb/nodebb setup
