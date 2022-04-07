FROM docker:20-git

RUN apk -U --no-cache --virtual add python3 py3-pip vault jq curl docker-cli python3-dev libffi-dev build-base
RUN pip3 install --upgrade pip

COPY requirements.txt .
RUN pip3 install -r requirements.txt

COPY requirements.yml .
RUN ansible-galaxy collection install -r requirements.yml

RUN molecule --version
RUN molecule drivers
RUN ansible-lint --version
RUN docker --version
RUN git --version
