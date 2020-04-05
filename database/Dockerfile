# Database API

####################################################################################################
# stage: deps
#

FROM python:3.6-slim as deps

ENV PYTHONDONTWRITEBYTECODE=1

ENV PYTHONPATH=$PYTHONPATH:/18745-rapid-prototyping-project/src/

RUN apt-get update \
    && apt-get install --no-install-recommends -y \
        build-essential \
        musl-dev \
        python3-dev \
    && rm -rf /var/lib/apt/lists/*

RUN pip install -r requirements.txt


####################################################################################################
# stage: devtest
#

FROM deps as dev-test

RUN pip install \
        pytest \
        pytest-cov

EXPOSE 5432
ENV PATH=$PATH:/holo
CMD ["/database"]

####################################################################################################
# stage: prod
#

FROM deps as prod

EXPOSE 5432
CMD ["python", "-c", "import database.database;"]
