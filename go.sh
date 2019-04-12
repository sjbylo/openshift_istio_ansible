#!/bin/bash 

clear; echo demo mutual_tls; read 
cd mutual_tls ; ./go.sh; cd ..
sleep 1

clear; echo demo simple_routing; read
cd simple_routing ; ./go.sh; cd ..
sleep 1

clear; echo demo fault-injection; read 
cd fault-injection ; ./go.sh cd ..
