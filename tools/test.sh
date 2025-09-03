#!/bin/bash

cd $(readlink -f $(dirname ${BASH_SOURCE[0]}))
cd ..

if [ -z "$1" ]; then
	echo "$0 IP" >&2
	exit 1
fi

tools/combine.sh
scp deploy root@$1:
