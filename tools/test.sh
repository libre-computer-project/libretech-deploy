#!/bin/bash

cd $(readlink -f $(dirname ${BASH_SOURCE[0]}))
cd ..

output=lc-deploy

if [ -z "$1" ]; then
	echo "$0 IP" >&2
	exit 1
fi

tools/combine.sh
scp $output root@$1:/usr/sbin/
