#!/bin/bash
currdir=`pwd`
server_name=damp_server
list=$(docker ps -a |grep ${server_name})
if [[ "$list" != "" ]]
then
echo "Stopping and removing the following containers:"
echo $list
    docker ps -a |grep ${server_name}|awk '{print $1 }'|xargs docker stop
    docker ps -a |grep ${server_name}|awk '{print $1 }'|xargs docker rm -f
    rm -rf $currdir/mysql_hosts/ if -d $currdir/mysql_hosts/
else
echo "no $server_name containers are running"
fi
