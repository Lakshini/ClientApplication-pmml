#!/bin/bash
CT="Content-Type:application/json"
workers_list=( "9443" )
should_undeploy=()
no_of_partial_siddhi_apps=0

for u in "${workers_list[@]}"  
do  
    TEST="curl -k -X GET https://localhost:$u/siddhi-apps?isActive=true  -H accept:application/json -u admin:admin -k"
    #echo $TEST
    RESPONSE=`$TEST`
    #echo $RESPONSE
    
    my_string=$RESPONSE
    my_string="${my_string:1}"
    my_string="${my_string::-1}"  
    #echo $my_string

    my_array=($(echo $my_string | tr "," "\n"))

    #Print the split string
    for i in "${my_array[@]}"
    do
       echo $i
       no_of_partial_siddhi_apps=$((no_of_partial_siddhi_apps+1))
    done
done
echo $no_of_partial_siddhi_apps  




