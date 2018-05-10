



# Set-up

## Kubernetes

Based on [this](http://code.markedmondson.me/r-on-kubernetes-serverless-shiny-r-apis-and-scheduled-scripts/) post.
- Set up a kubernetes cluster on google cloud and install gcloud and kubectl. Configure you computer to connect to the cluster.

- Install Helm

```
curl -o get_helm.sh https://raw.githubusercontent.com/kubernetes/helm/master/scripts/get
chmod +x get_helm.sh
./get_helm.sh

```

- Install Tiller on the cluster

```
kubectl create serviceaccount tiller --namespace kube-system
```

- Bind the Tiller service to the cluster-admin role (using `tiller-clusterrolebinding.yaml`) and deploy on the cluster.

```
kubectl create -f deployments/tiller-clusterrolebinding.yaml
```

- Update the existing tiller-deploy deployment with the service account you created.

```
helm init --service-account tiller --upgrade
```

- Test the new Helm, the following should execute without errors.

```
helm ls
```

- Deploy nginx Ingress Controller using Helm.

```
helm install --name nginx-ingress stable/nginx-ingress --set rbac.create=true
```

- Deploy the Rstudio server using

```
kubectl create -f deployments/rstudio.yaml
```

- Update the `r-ingress-nginx.yaml`

```
kubectl apply -f deployments/r-ingress-nginx.yaml
```
## Containers

1. Add required secrets to the `secrets` folder. Subdirectories are named based on the container they provide secrets for. Required container secrets are, 
	1. `fcdashboard` - folder containing a copy of the loanbook saved as `loanbook.csv`.
	1. `rstudio` - folder containing the Rstudio server crediantials (`creds.env`) saved as `USER=` and `PASSWORD=`.

1. Add docker network

```bash
docker network create shinyproxy-net
```

1. Pull all images.

```bash
 docker-compose -f containers/docker-compose.yml pull --ignore-pull-failures
```

1. Build all images.

```bash
 docker-compose -f containers/docker-compose.yml build
```

1. Launch all services

```bash
 docker-compose up
```

There should now be a shinyproxy instance at `8080` and a jenkins instance at `9090`. All the commands seen here (except for the transfer of secrets has been implemented in the `set-up-server.sh` bash script).

# Kubernetes (to be implemented)

I plan to convert the docker infrastructure deployed above with `docker-compose` to kubernetes. I plan to do this using the managed google cloud service and have yet to find a functional example. Let me know if you have any thoughts on this.

# To do's

