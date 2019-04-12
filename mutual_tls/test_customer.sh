NODE_PORT=`oc -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="http2")].nodePort}'`
MY_HOST=`hostname -I | awk '{print $1}'`
MY_URL=http://$MY_HOST:$NODE_PORT

echo curl $MY_URL

cnt=1
[ "$1" ] && cnt=$1
[ "$1" = "-f" ] && cnt=999999

i=0
while [ $i -lt $cnt ]
do
	curl $MY_URL
	sleep 0.5
	let i=$i+1
done

