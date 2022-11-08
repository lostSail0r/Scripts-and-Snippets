#! /bin/sh
cd /etc/pihole
sudo service pihole-FTL stop
sudo mv pihole-FTL.db pihole-FTL.db.old
sudo service pihole-FTL start

# This clears out the query log history from pihole (no way to do it from web GUI)
