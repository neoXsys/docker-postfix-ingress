#!/bin/bash

filename="/etc/postfix/transport"

#!/bin/env bash
while [ true ]; do
 sleep 30

get_cmd=$(kubectl get --selector smtp_ingress_domain svc --all-namespaces -L smtp_ingress_domain -o json | jq -r '.items[] | [.metadata.labels.smtp_ingress_domain ,.spec.clusterIP + ":25"] | join("  smtp:")  ' &> $filename )

#postmap for transport
postmap hash:$filename

done
