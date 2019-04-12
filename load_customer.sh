MY_URL=`oc get route customer -n tutorial -o jsonpath='{.spec.host}'`

cnt=15
[ "$1" ] && cnt=$1
[ "$1" = "-f" ] && cnt=9999999

i=0
while [ $i -lt $cnt ]
do
	curl $MY_URL
	sleep 0.1
	let i=$i+1
done


#for i in `seq 1 $cnt`; do curl $MY_URL; done
