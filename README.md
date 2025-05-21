# Dynamic ArgoCD Environment Lab

Usage:
1. Create the cluster
2. Set up ArgoCD controller 
3. Fill up values as desired
4. Apply boostrap chart

## Provision a Kubernetes cluster

You'll need a kubernetes Cluster to work on this lab. 

## ArgoCD installation

After provisioning a Kubernetes cluster, to start exploring the lab you'll need to install ArgoCD, follow the steps below:

``` shell
helm repo add argo https://argoproj.github.io/argo-helm
helm repo list 
helm show values argo/argo-cd > argo-cd.yaml
helm -n argocd install argocd argo/argo-cd --values values/argo-cd.yaml --create-namespace
```

After installing the operador, apply the `boostrap.yaml` to create the repository and application resources on ArgoCD:

``` shell
kubectl apply -f bootstrap/templates/bootstrap.yaml
```



