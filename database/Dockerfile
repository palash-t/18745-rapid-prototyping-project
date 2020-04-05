# Database API

####################################################################################################
# stage: deps
#

FROM python:3.6-slim as deps

COPY database database/

# ENV PYTHONDONTWRITEBYTECODE=1

# ENV PYTHONPATH=$PYTHONPATH:/18745-rapid-prototyping-project/src/

RUN apt-get update \
    && apt-get install --no-install-recommends -y \
        build-essential \
        libpq-dev \
        musl-dev \
        python3-dev \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt /tmp/
RUN pip install -r /tmp/requirements.txt
COPY . /tmp/


####################################################################################################
# stage: devtest
#

FROM deps as dev-test

RUN pip install \
        pytest \
        pytest-cov

EXPOSE 5432
ENV PATH=$PATH:/database

COPY tests tests/

CMD ["pytest", "tests/"]

####################################################################################################
# stage: prod
#

# FROM deps as prod

# EXPOSE 5432
# CMD ["python", "-c", "import database.database;"]
