FROM debian:11

WORKDIR app

RUN apt-get update && apt-get upgrade -y
RUN apt-get -y install python3-pip
RUN apt-get -y install default-libmysqlclient-dev
RUN pip install flask
RUN pip install flask-mysqldb

COPY ./app/ ./

CMD /usr/local/bin/flask run --host=0.0.0.0 --port=5000 --app=appli.py
