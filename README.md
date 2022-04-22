# k8s-proj

Kubernetes project:

* Database pod based on MySQL with 3 replicas - statefulset. 
Connect to this data base using MySQL Workbench (using the exported port - 30012).
Create a single table using MySQL Workbench. 
Storing the information of the database in a persistent volumes.

* Creating a pod with ubuntu. Use python to connect to the SQL database and write to it every one minuets.
* Creating a new pod with NodeJS and link it to the database.

<p>&nbsp;</p>
* Diagram which explains the flow:
<p>&nbsp;</p>

![Diagram](https://github.com/kamalaweenat/k8s-project/blob/95cc74f96486ed5f3d276f897db80e26ea2a5617/k8s_arch.png)
