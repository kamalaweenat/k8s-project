FROM ubuntu:20.04

WORKDIR /app

RUN apt update &&  apt install -y python3-pip
RUN pip install mysql-connector-python

COPY insert_db.py .

CMD [ "python3", "-u", "./insert_db.py"]



