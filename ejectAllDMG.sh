#!/bin/bash

VOLUMES=/Volumes/*
MATCH='Disk Image'

# Loop through all mounted volumes
for v in $VOLUMES
do
	
	# Check if volume is a disk image
	PROTOCOL=$(diskutil info "$v" | grep "Protocol:" | sed 's/.*Protocol:[[:space:]]*//')
	if [ "$PROTOCOL" == "$MATCH" ]; then

		# if volume is a disk image, eject it
		diskutil eject "$v"
		
		# send a notification using terminal-notifier
		terminal-notifier -message "$v ejected"
	
	fi

done
