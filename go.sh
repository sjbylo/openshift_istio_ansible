#!/bin/bash 

clear; echo mutual_tls; read 
cd mutual_tls ; ./go.sh; cd ..
sleep 1

clear; echo simple_routing; read
cd simple_routing ; ./go.sh; cd ..
sleep 1

clear; echo fault-injection; read 
cd fault-injection ; ./go.sh cd ..
