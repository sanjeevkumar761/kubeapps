cd /home/juser/kubeapps/dashboard
docker build -t kubeapps/dashboard .
docker tag kubeapps/dashboard souveniracr.azurecr.io/kubeapps/
az acr login --name souveniracr --username $1 --password $2
docker push souveniracr.azurecr.io/kubeapps/dashboard

cd /home/juser/kubeapps/chart/kubeapps
export HELM_EXPERIMENTAL_OCI=1
helm chart save . kubeapps
helm chart save . souveniracr.azurecr.io/helm/kubeapps:v1
echo $2 | helm registry login souveniracr.azurecr.io \
  --username $1 \
  --password-stdin
helm chart push souveniracr.azurecr.io/helm/kubeapps:v1

kubectl delete namespaces kubeapps
sudo kubectl create namespace kubeapps
cd /home/juser/kubeapps/chart/
helm dependency update kubeapps
helm install kubeapps --namespace kubeapps ./kubeapps --set useHelm3=true

kubectl port-forward -n kubeapps svc/kubeapps 8080:80 --address 0.0.0.0