#!/bin/bash

clear

source ../lib/func.sh

my_reset()
{
	ansible-playbook 03_disable_mtls.yaml
	ansible-playbook 04_delete_gateway.yaml
	ansible-playbook 05_restore_route.yaml
	exec $0
}

source conf.sh

i=0
while true
do
	[ "${m[$i]}" = "" ] && exit 0

	msg "${m[$i]}" ${c[$i]}
	ret=$?
	[ $ret -eq 1 ] && my_reset;
	[ $ret -eq 3 ] && let i=$i-1 && continue;  # repeat
	[ $ret -eq 2 ] && exit 1 # Quit

	let i=$i+1
done

