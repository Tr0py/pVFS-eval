#!/bin/bash

S_BLK=178
E_BLK=255

function offline_pmem() {
	echo "sudo chmem -d -b $S_BLK-$E_BLK"
}

function online_pmem() {
	# TODO: check if exceeds E_BLK
	echo "sudo chmem -e -b $S_BLK-$(($S_BLK+$1/128-1))"
}

offloine_pmem
online_pmem $1
