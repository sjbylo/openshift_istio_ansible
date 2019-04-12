m[$i]="Show the Istio Ingress gateway yaml definition";                   c[$i]="./show.sh 01_create_gateway.yaml; "; let i=$i+1 
m[$i]="Create Istio Ingress gateway";                                     c[$i]="ansible-playbook 01_create_gateway.yaml"; let i=$i+1
m[$i]="Test the application with just one request. See Kiali respond.";   c[$i]="bash test_customer.sh"; let i=$i+1 
m[$i]="Show mTLS yaml definitions";                                       c[$i]="./show.sh 02_enable_mtls.yaml"; let i=$i+1 
m[$i]="Enable mTLS";                                                      c[$i]="ansible-playbook 02_enable_mtls.yaml"; let i=$i+1 
m[$i]="Test the application with some requests";                          c[$i]="bash test_customer.sh 20"; let i=$i+1 
m[$i]="Reset demo";   c[$i]="ansible-playbook 03_disable_mtls.yaml && ansible-playbook 04_delete_gateway.yaml && ansible-playbook 05_restore_route.yaml"; let i=$i+1 
m[$i]="Ensure all istio resources are gone";                              c[$i]="bash ../show_istio_resources.sh"; let i=$i+1 

