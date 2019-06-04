#!/bin/bash

export SALT_ROOT=$PWD

updown() { ## updown < up / down > < hostname >
 cd $SALT_ROOT/$2
 vagrant $1
}

echo "up or down (u/d, default:u)?: "
read DECISION

if [[ "$DECISION" == "d" ]];  then

 # break down everything
 updown "destroy -f" master
 updown "destroy -f" minion1

else

 updown up master
 updown up minion1

 cd "$SALT_ROOT"/master
 vagrant ssh -c 'yes | salt-key --accept=minion1' # ACCEPT ALL: salt-key -A

fi

cd "$SALT_ROOT"
