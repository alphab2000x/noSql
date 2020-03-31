FROM ubuntu

WORKDIR .

RUN apt-get -y update

RUN apt-get -y install python3 \
&& apt-get -y install python3-pip \
&& apt-get install -y git \
&& apt-get install -y vim
RUN pip3 freeze > requirements.txt \
&& pip3 install -r requirements.txt \
&& git config --global user.name barry \
&& git config --global user.email barrys.alpha@gmail.com \
&& git clone https://github.com/alphab2000x/noSql.git

CMD ["jupyter", "notebook", "--ip=127.0.0.1", "--port=8888", "--allow-root", "--no-browser"]

EXPOSE 8000