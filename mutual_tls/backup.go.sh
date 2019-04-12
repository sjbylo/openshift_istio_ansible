#!/bin/bash

source ../lib/func.sh

my_reset()
{
	ansible-playbook 03_disable_mtls.yaml
	ansible-playbook 04_delete_gateway.yaml
	ansible-playbook 05_restore_route.yaml
	exec $0
}


echo 1
msg "Create Istio Ingress gateway" "ansible-playbook 01_create_gateway.yaml" 
ret=$?
[ $ret -eq 1 ] && my_reset;
[ $ret -eq 2 ] && exit 1

msg "Show the gateway's yaml definition" "./show.sh 01_create_gateway.yaml" 
ret=$?
[ $ret -eq 1 ] && my_reset;
[ $ret -eq 2 ] && exit 1

msg "Test the application with just one request.  See Kiali respond." "bash test_customer.sh" 
ret=$?
[ $ret -eq 1 ] && my_reset;
[ $ret -eq 2 ] && exit 1

msg "Show mTLS yaml definitions" "./show.sh 02_enable_mtls.yaml"
ret=$?
[ $ret -eq 1 ] && my_reset;
[ $ret -eq 2 ] && exit 1

msg "Enable mTLS" ansible-playbook 02_enable_mtls.yaml 
ret=$?
[ $ret -eq 1 ] && my_reset;
[ $ret -eq 2 ] && exit 1

msg "Test the application with one reauest" "bash test_customer.sh 20" 
ret=$?
[ $ret -eq 1 ] && my_reset;
[ $ret -eq 2 ] && exit 1

msg "Reset demo" "ansible-playbook 03_disable_mtls.yaml && ansible-playbook 04_delete_gateway.yaml && ansible-playbook 05_restore_route.yaml"
ret=$?
[ $ret -eq 1 ] && my_reset;
[ $ret -eq 2 ] && exit 1

msg "Ensure all istio resources are gone" "bash ../show_istio_resources.sh"
ret=$?
[ $ret -eq 1 ] && my_reset;
[ $ret -eq 2 ] && exit 1

