m[$i]="Ensure all istio resources are gone.";       c[$i]="bash ../show_istio_resources.sh"; let i=$i+1 
m[$i]="Show the pods running.";                   c[$i]="oc get pods"; let i=$i+1 
m[$i]="Load the application";                   c[$i]="../load_customer.sh"; let i=$i+1 
m[$i]="Create recommmendation version v2.";                   c[$i]="ansible-playbook 01_recommendation.yaml"; let i=$i+1 
m[$i]="Show the pods running.";                   c[$i]="oc get pods"; let i=$i+1 
m[$i]="Scale up the recommendation service";                   c[$i]="ansible-playbook 02_scale_recommendation.yaml"; let i=$i+1 
m[$i]="Show the pods running.";                   c[$i]="oc get pods"; let i=$i+1 
m[$i]="Load the application";                   c[$i]="../load_customer.sh"; let i=$i+1 
m[$i]="Scale down recommendation v2";                   c[$i]="ansible-playbook 03_scale_down_recommendation.yaml"; let i=$i+1 
m[$i]="Show the pods running.";                   c[$i]="oc get pods"; let i=$i+1 
m[$i]="Load the application";                   c[$i]="../load_customer.sh"; let i=$i+1 
m[$i]="Now let's have all users go to recommendation v2. This is the blue-green deployment for microservices.";                   c[$i]="./show.sh 04_all_users_recommendation_v2_blue_green.yaml"; let i=$i+1 
m[$i]="Now let's have all users go to recommendation v2. This is the blue-green deployment for microservices.";                   c[$i]="ansible-playbook 04_all_users_recommendation_v2_blue_green.yaml"; let i=$i+1 
m[$i]="Show the pods running.";                   c[$i]="oc get pods"; let i=$i+1 
m[$i]="Load the application";                   c[$i]="../load_customer.sh"; let i=$i+1 
m[$i]="Now let's have all users go to recommendation v1";                   c[$i]="./show.sh 05_all_users_recommendation_v1_blue_green.yaml"; let i=$i+1 
m[$i]="Execute: Now let's have all users go to recommendation v1";          c[$i]="ansible-playbook 05_all_users_recommendation_v1_blue_green.yaml"; let i=$i+1 
m[$i]="Load the application";                   c[$i]="../load_customer.sh"; let i=$i+1 
#m[$i]="All users even distributed between both versions";                   c[$i]="./show.sh 06_all_users_recommendation_v1_v2.yaml"; let i=$i+1 
m[$i]="Execute all users even distributed between both versions";                   c[$i]="ansible-playbook 06_all_users_recommendation_v1_v2.yaml"; let i=$i+1 
m[$i]="Load the application";                   c[$i]="../load_customer.sh"; let i=$i+1 
m[$i]="Canary deployment in istio. 90% goes to v1 and 10% go to v2";                   c[$i]="./show.sh 07_canary.yaml"; let i=$i+1 
m[$i]="Execute the canary deployment in istio. 90% goes to v1 and 10% go to v2";                   c[$i]="ansible-playbook 07_canary.yaml"; let i=$i+1 
m[$i]="Load the application";                   c[$i]="../load_customer.sh"; let i=$i+1 
m[$i]="Reset demo";                   c[$i]="ansible-playbook 09_cleanup.yaml"; let i=$i+1 
m[$i]="Ensure all istio resouerces are gone.";       c[$i]="bash ../show_istio_resources.sh"; let i=$i+1 
m[$i]="Both versions should now be equal";                   c[$i]="../load_customer.sh"; let i=$i+1 

