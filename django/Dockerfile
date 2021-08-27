FROM python:3.9

# for pip
ENV HOME=/tmp

RUN set -ex &&\
    apt-get update &&\
    apt-get install -y dumb-init &&\
    apt-get clean &&\
    rm -rf /var/lib/apt/*

RUN set -ex &&\
    pip install --no-cache-dir --upgrade pip &&\
    pip install --no-cache-dir pipenv==2021.5.29

WORKDIR /django

COPY Pipfile* .

RUN set -ex \
    && pipenv install

COPY . .

RUN set -ex &&\
    python -m compileall .

WORKDIR /django/digitalocean_apps

USER nobody

CMD ["dumb-init", "./run.sh"]
