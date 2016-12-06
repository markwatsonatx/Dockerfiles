#!/bin/sh
echo "Creating $1..."
ok=$(curl -s -X PUT http://127.0.0.1:5984/$1 | jq '.ok')
echo "Create $1 response.ok=$ok"
while [ "$ok" != "null" ] && [ "$ok" != "true" ]
do
        sleep 1
        echo "Creating $1..."
        ok=$(curl -s -X PUT http://127.0.0.1:5984/$1 | jq '.ok')
        echo "Create $1 response.ok=$ok"
done
