ns="k8s-proj"
pod_name="mysql-0"

kubectl apply -f ns.yaml
kubectl apply -f MySql/mysql-secret.yaml
kubectl apply -f MySql/mysql-svc.yaml
kubectl apply -f MySql/mysql-pv.yaml
kubectl apply -f MySql/mysql-cfg.yaml
kubectl apply -f conf_map.yaml

kubectl apply -f MySql/mysql-deployment.yaml

echo 
echo " -> Readiness - waiting to open tcp sockect on port 3306 inside container"
kubectl rollout status statefulset/mysql -n "$ns"

# get pwd which exists in secret file
#pwd=$(kubectl get secret  mysql-secret -n "$ns" --template={{.data.password}} | base64 -d)
#pod_name=$(kubectl get pods --no-headers -o custom-columns=":metadata.name" -n "$ns" | head -n 1)


create_db="CREATE DATABASE IF NOT EXISTS k8s_proj;"
create_tbl="use k8s_proj; CREATE TABLE IF NOT EXISTS random_nums (creation_date datetime default current_timestamp, who varchar(16), rand_num int);"

echo
echo " -> Create Database (k8s_proj) with table (random_nums)"
# communicate with mysql inside pod and create the db, table
#kubectl exec -it "$pod_name" --namespace "$ns"   -- /bin/bash -c "mysql -e \"$grant_access\""
kubectl exec -it "$pod_name" --namespace "$ns" -- /bin/bash -c "mysql -e \"$create_db\""
kubectl exec -it "$pod_name" --namespace "$ns" -- /bin/bash -c "mysql -e \"$create_tbl\""

echo
echo "Deploying ubuntu-python db image..."
kubectl apply -f Ubuntu/ubun-deployment.yaml
kubectl rollout status deployment ubunpy -n "$ns"

echo
echo "Deploying nodejs db image..."
kubectl apply -f Nodejs/nodejs-deployment.yaml
kubectl rollout status deployment nodejs-db -n "$ns"

