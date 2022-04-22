# k8s-proj

Kubernetes project:

* Database pod based on MySQL with 3 replicas - statefulset. 
Connect to this database using MySQL Workbench (using the exported port - 30012).
Create a single table using MySQL Workbench. 
Storing the information of the database in a persistent volume.

* Creating a pod with ubuntu. Use python to connect to the SQL database and write to it every minute.
* Creating a new pod with NodeJS and linking it to the database.

<p>&nbsp;</p>
* Diagram which explains the flow:
<p>&nbsp;</p>

![Diagram](https://github.com/kamalaweenat/k8s-project/blob/95cc74f96486ed5f3d276f897db80e26ea2a5617/k8s_arch.png)


How it works:

you only need to run the script file - install_env.sh

in your terminal:
\
first of all clone the project to your local folder:
clone https://github.com/kamalaweenat/k8s-project.git

after that enter the project folder and run the script:

./install_env.sh
Or 
bash install_env.sh

the script will install the environment:
1 statefulset for mysql with 3 replicas
2 deployment for nodejs and python
also, it will initialize a db once the mysql is up and running

