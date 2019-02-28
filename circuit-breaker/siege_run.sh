MY_URL=`oc get route customer -n tutorial -o jsonpath='{.spec.host}'`

echo "siege -r 2 -c 20 -v http://$MY_URL"

siege -r 2 -c 20 -v http://$MY_URL

