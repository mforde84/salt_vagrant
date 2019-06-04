#!/bin/bash

# set dev root
SALT_ROOT="$PWD"

# helper function to up / down vms
updown() { ## updown < up / down > < hostname >
 cd "$SALT_ROOT"/$2
 vagrant $1
}

# query update to geany paths?
echo "update geany paths (y/n, default:n)?: "
read DECISION

if [[ "$DECISION" == "y" ]];  then # if update

 # replace paths
 sed -i 's~^base_path.*~base_path='"$SALT_ROOT"'~g' "$SALT_ROOT"/salt.geany
 NEWLOC=`echo "$SALT_ROOT" | sed 's/\//%2F/g'`
 sed -i 's~%2F.*vagrant~'"$NEWLOC"'~g' "$SALT_ROOT"/salt.geany
 sed -i 's~^last_dir.*~last_dir='"$SALT_ROOT"'~g' "$SALT_ROOT"/salt.geany

fi # else do nothing

# query up or down vms?
echo "up or down (u/d, default:u)?: "
read DECISION

if [[ "$DECISION" == "d" ]];  then #if down

 # break down everything
 updown "destroy -f" master &
 updown "destroy -f" minion1

else # if up (default)

 # spool up
 updown up master
 updown up minion1

 # set key state for minion
 cd "$SALT_ROOT"/master
 vagrant ssh -c 'yes | sudo salt-key --accept=minion1' # ACCEPT ALL: salt-key -A

fi

# return to dev root
cd "$SALT_ROOT"

exit 0
