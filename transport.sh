#!/bin/bash

filename="/etc/postfix/transport"
logfile="/var/log/maillog"

#!/bin/env bash
while [ true ]; do
 sleep 30

#get_cmd=$(kubectl get --selector smtp_ingress_domain svc --all-namespaces -L smtp_ingress_domain -o json | jq -r '.items[] | [.metadata.labels.smtp_ingress_domain ,.spec.clusterIP + ":25"] | join("  smtp:")  ' &> $filename )

if [ -s $filename ]
then
        #postmap for transport
        postmap hash:$filename
        echo "Warning: Updating transport" >> $logfile 
else
        echo "Error: Check the api server" >> $logfile
fi



done
