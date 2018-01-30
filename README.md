# Postfix

Postfix ingress controller which anyone can run to update the transport of application on run time.

## Description

That container is highly depends on label

## How it works

It checks the smtp_ingress_domain value in the label. With the label value, it updates the transport in every 5 mins. Typically, we will launch any other servie in cluster the mail services will automatically active in less than 5 mins.

Value of smtp_ingess_domain will be looks like below: 

```
 smtp_ingress_domain: a.test.com
```
You can download it and run it from vparashar/postfix

```
kubectl run mail-ingress  --image=vparashar/centos-postfix --port=25
kubectl expose deployment mail-ingress --type=NodePort --name mail-ingress
```

## Diagram


For example if you have a application name app1

create a kubernetes service called 'app1', for app1.test.com

add 1 label to this service:
smtp_ingress_domain=app1.text.com

the ingress controller should use the information in the service specification to automatically create the mapping
for each service:

domain - value of smtp_ingress_domain
server - internal cluster IP of the smtp service


## Usage





## Options

## Maintainer
Vikas Parashar <vikas.parashar@scalemonks.com>
