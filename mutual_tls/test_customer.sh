NODE_PORT=`oc -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="http2")].nodePort}'`
MY_HOST=`hostname -I | awk '{print $1}'`
MY_URL=http://$MY_HOST:$NODE_PORT

echo curl $MY_URL

if [ "$1" = "-f" ]
then
	while true
	do
		curl $MY_URL
		sleep 0.5
	done
else
	curl $MY_URL
fi
