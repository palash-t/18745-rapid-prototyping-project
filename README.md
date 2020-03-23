# rapid-prototyping-project

## Project Description

The APIs in this repository are the access point for Hardware and Dashboards to access data stored within this database. As Algorithms are specified and Dashboards gets nearer to completion, additional processing steps will be added. The schema can be located in schemas.json.

Ask Sam Nelson, Scott Mionis, or Palash Thakur for questions regarding the code.

## Local Setup

Install postgres
```
sudo apt update
sudo apt install postgresql postgresql-contrib
```
Install pip dependencies
```
sudo pip install -r requirements.txt
```

Verify the installation is working
```
sudo -u postgres psql -c "SELECT version();"
```

Now there is a postgres server running locally on your machine.

Run tests (NOTE: this will blow the local database away and reseed with test_data.sql)
```
task run-tests
```