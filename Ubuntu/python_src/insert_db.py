from random import randint
from time import sleep
import mysql.connector
import os
  
mydb = mysql.connector.connect(
  host=os.getenv("MYSQL_MASTER_SERVICE_HOST"),
  user=os.getenv("mysql_user"),
  #password=os.getenv("mysql_pwd"),
  database=os.getenv("mysql_db"),
  port=os.getenv("MYSQL_MASTER_SERVICE_PORT")
)

while True:
  mycursor = mydb.cursor()

  rand_int = randint(0, 1000)

  sql = f"INSERT INTO k8s_proj.random_nums (who, rand_num) VALUES ('Python', {rand_int})"  
  mycursor.execute(sql)
  mydb.commit()

  print(mycursor.rowcount, "record inserted.")
  
  sleep(60)


