#!/bin/bash
DIRBIN="$(cd "$(dirname "$0")"; pwd)/bin"
PATH=$PATH:$DIRBIN
uuid=$(uuidgen)
mkdir -p ~/GRASP_result
cd ~/GRASP_result
mkdir $uuid
cd $uuid
bash -
