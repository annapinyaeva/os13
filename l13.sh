#!/bin/bash
lockfile="./lock.file"
exec {fn}>$lockfile
echo "lock"
until flock -n ${fn}
do	echo "not lock"
	sleep 1
	flock -n ${fn}
done
for ((i=0;i<=6;i++))
do echo "work"
    sleep 1
done