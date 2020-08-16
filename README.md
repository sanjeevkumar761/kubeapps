**Build steps for kubeapps app**

Source is here https://github.com/sanjeevkumar761/kubeapps  

cd ./kubeapps/dashboard  

docker build . -t kubeapps/dashboard  

docker tag kubeapps/dashboard souveniracr.azurecr.io/kubeapps/dashboard   
docker push souveniracr.azurecr.io/kubeapps/dashboard  