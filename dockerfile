FROM python:3.8-slim-buster

WORKDIR /python-docker

COPY requirements.txt requirements.txt

COPY . .

CMD [echo"container up"]



