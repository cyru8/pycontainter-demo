# pycontainter-demo
#k8sdeployment[main] $ kubectl create deployment hello-kubernetes --image=oadetiba/hello-kubernetes:latest --dry-run=client -o yaml | more
#k8sdeployment[main] $ kubectl create deployment hello-kubernetes --image=oadetiba/hello-kubernetes:latest --dry-run=client -o yaml > hello-kubernetes-deployment.yaml

#Generate Service Manifest:
#kubectl expose deployment hello-kubernetes --port=80 --target-port=5000 --dry-run=client -o yaml | more
#kubectl expose deployment hello-world --port=80 --target-port=5000 --dry-run=client -o yaml > hello-kubernetes-service.yaml
