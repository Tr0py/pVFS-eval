#!/bin/bash

set -x

FNVTHREADS=nvthreads
FPMTHREADS=pmthreads

EXT4NJ=/root/ssd/home/ziyi/ext4-nojournal-mnt
EXT4=/root/ssd/home/ziyi/ssd-storage
PM=/dev/shm/shm-storage

ROOT=/dev/shm

FS_PATH=

case $1 in
	"pm")
		FS_PATH=$PM
		;;

	"vpm")
		FS_PATH=$EXT4
		;;
	"vpm-nj")
		FS_PATH=$EXT4NJ
		;;
	*)
		echo "Invalid option!"
		echo "Usage: $0 <persistent memory type>"
		echo "Available pm types: pm, vpm, vpm-nj (vpm w/o journal)"
		exit 1
		;;
esac

echo "Switching to $1"

rm -f $ROOT/$FNVTHREADS
rm -f $ROOT/$FPMTHREADS

ln -s $FS_PATH/$FNVTHREADS $ROOT
ln -s $FS_PATH/$FPMTHREADS $ROOT

echo 'Switched to persistent memory type: $1'
ls -lh /dev/shm
