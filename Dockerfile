# First stage: build the Python app
FROM python:3.11.9-bookworm AS build

# install dependencies
COPY ./requirements.txt .
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# copy project source code
COPY ./ecommerce_project /ecommerce_project

# set working directory
WORKDIR /ecommerce_project

# entrypoint shell scripts to be executed
COPY ./entrypoint.sh /
ENTRYPOINT ["sh", "/entrypoint.sh"]