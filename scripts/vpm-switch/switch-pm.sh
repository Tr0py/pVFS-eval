#!/bin/bash

set -x

FNVTHREADS=nvthreads
FPMTHREADS=pmthreads

RAMFS=/dev/shm/shm-storage
EXT4=/root/pms/ext4
EXT4NJ=/root/pms/ext4nj
EXT4HDD=/root/pms/ext4-hdd
EXT4DAX=/root/pms/ext4-dax
XFS=/root/pms/xfs

ROOT=/dev/shm

FS_PATH=

case $1 in
	"pm")
		mkdir -p $RAMFS/$FNVTHREADS
		mkdir -p $RAMFS/$FPMTHREADS
		FS_PATH=$RAMFS
		;;
	"pm-real")
		mkdir -p $EXT4DAX/$FNVTHREADS
		mkdir -p $EXT4DAX/$FPMTHREADS
		FS_PATH=$EXT4DAX
		;;

	"vpm")
		FS_PATH=$EXT4
		;;
	"vpm-nj")
		FS_PATH=$EXT4NJ
		;;
	"vpm-xfs")
		FS_PATH=$XFS
		;;
	"vpm-hdd")
		FS_PATH=$EXT4HDD
		;;
	*)
		echo "Invalid option!"
		echo "Usage: $0 <persistent memory type>"
		echo "Available pm types: pm, vpm, vpm-nj (vpm w/o journal)"
		echo "vpm-xfs, vpm-hdd."
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
