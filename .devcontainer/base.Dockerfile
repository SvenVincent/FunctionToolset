FROM docker.inceptio.tech/seabird/devops/davinci_py_env:1.0.3
LABEL "auth"="shiwen.wang" \
      "mail"="shiwen.wang@inceptio.ai"
COPY library-scripts/requirements.txt /tmp/library-scripts/
COPY first-run-notice.txt /usr/local/etc/vscode-dev-containers/
COPY library-scripts/sources.list /etc/apt/
USER root
RUN apt-get update \
      && DEBIAN_FRONTEND=noninteractive apt-get -y install software-properties-common expect unzip && \
      add-apt-repository -y ppa:deadsnakes/ppa &&  apt-get update && \
      apt-get install python3.8 python3.8-venv python3.8-dev python3-pip postgresql python-psycopg2 libpq-dev -y && \
      python3.8 -m pip install --upgrade pip && python3.8 -m pip install lxml  && python3.8 -m pip install psycopg2 && \
      python3.8 -m pip install -r /tmp/library-scripts/requirements.txt
USER vscode