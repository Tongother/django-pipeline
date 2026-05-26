FROM ubuntu:latest

EXPOSE 8000

WORKDIR /usr/src/app

RUN apt update && apt install -y python3 python3-pip python3-venv

RUN python3 -m venv .venv

COPY requirements.txt ./

RUN .venv/bin/pip install -r requirements.txt

COPY . ./

ENTRYPOINT [ ".venv/bin/python", "manage.py", "runserver", "0.0.0.0:8000" ]