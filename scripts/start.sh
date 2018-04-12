#! /bin/bash

export NODE_ENV=production
export daemon=false
export silent=false

cd /home/node/nodebb
./nodebb start

