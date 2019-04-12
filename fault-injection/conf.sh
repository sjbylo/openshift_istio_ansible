m[$i]="Let's inject 503's to 50% of the requests";       c[$i]="./show.sh 01_inject_503_50pc.yaml"; let i=$i+1 
m[$i]="Execute: Let's inject 503's to 50% of the requests";       c[$i]="ansible-playbook 01_inject_503_50pc.yaml"; let i=$i+1 

m[$i]="Load the application";       c[$i]="../load_customer.sh"; let i=$i+1 
m[$i]="Clean up";       c[$i]="ansible-playbook 02_cleanup.yml"; let i=$i+1 

m[$i]="Inject delays of 7 seconds to 50% of the requests";       c[$i]="./show.sh 03_inject_delay_50pc.yml"; let i=$i+1 
m[$i]="Execute: Inject delays of 7 seconds to 50% of the requests";       c[$i]="ansible-playbook 03_inject_delay_50pc.yml"; let i=$i+1 
m[$i]="Load the application";       c[$i]="../load_customer.sh 6"; let i=$i+1 

m[$i]="Clean up";       c[$i]="ansible-playbook 04_cleanup.yaml"; let i=$i+1 

m[$i]="Now let's make v2 of the recommendation service misbehave";       c[$i]="ansible-playbook 05_misbehave_v2.yaml"; let i=$i+1 
m[$i]="Load the application";       c[$i]="../load_customer.sh 6"; let i=$i+1 

m[$i]="Enable a retry if a service fails";       c[$i]="./show.sh 06_retry.yaml"; let i=$i+1 
m[$i]="Execute the retry";       c[$i]="ansible-playbook 06_retry.yaml"; let i=$i+1 
m[$i]="Load the application";       c[$i]="../load_customer.sh"; let i=$i+1 

m[$i]="Clean up ... back to normal";       c[$i]="ansible-playbook 07_cleanup.yaml && ansible-playbook 08_behave.yaml"; let i=$i+1 
m[$i]="Load the application";       c[$i]="../load_customer.sh"; let i=$i+1 

m[$i]="Ensure all istio resources are gone.";       c[$i]="bash ../show_istio_resources.sh"; let i=$i+1 

#m[$i]="xxx";       c[$i]="yyy"; let i=$i+1 
