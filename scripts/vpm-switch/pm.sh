#!/bin/bash
rm /dev/shm/*threads
ln -s /dev/shm/shm-storage/* /dev/shm/
echo 'switched to virtualized persistent memory'
ls -lh /dev/shm
