#!/bin/bash

echo "************************************************************"
echo "Setting up users..."
echo "************************************************************"

# create root user
nohup gosu mongodb mongo mydatabase --eval "db.createUser({user: 'admin', pwd: 'myadminpass', roles:[{ role: 'root', db: 'mydatabase' }, { role: 'read', db: 'local' }]});"

# create app user/database
nohup gosu mongodb mongo mydatabase --eval "db.createUser({ user: 'mongodb', pwd: 'mymongopass', roles: [{ role: 'readWrite', db: 'mydatabase' }, { role: 'read', db: 'local' }]});"

echo "************************************************************"
echo "Shutting down"
echo "************************************************************"
nohup gosu mongodb mongo admin --eval "db.shutdownServer();"
