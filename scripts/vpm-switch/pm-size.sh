#!/bin/bash

S_BLK=178
E_BLK=255

function offline_pmem() {
	sudo chmem -d -b $S_BLK-$E_BLK
}

function online_pmem() {
	# TODO: check if exceeds E_BLK
	sudo chmem -e -b $S_BLK-$(($S_BLK+$1/128-1))
}

offline_pmem
online_pmem $1
