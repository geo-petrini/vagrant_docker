#!/bin/bash
cd $1
#echo listing differences and calculating word count for the if condition
DIFFPULL=$(git fetch && git diff HEAD..@{u} | wc -m)

if [ "$DIFFPULL" != "0" ]; then
	echo There are updates in the remote repo, running forced pull
	#executing a force pull disregarding local changes
	git fetch
	git reset --hard HEAD
	git merge
else
	echo Nothing to update
	exit 0
fi
