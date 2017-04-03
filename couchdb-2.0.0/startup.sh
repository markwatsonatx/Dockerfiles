#!/bin/sh
./apache-couchdb-2.0.0/rel/couchdb/bin/couchdb &
./create_db.sh _users
./create_db.sh _replicator
./create_db.sh _global_changes
./create_admin.sh admin secret
while true; do sleep 1000; done
