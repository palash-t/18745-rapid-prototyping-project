# rapid-prototyping-project

## Local Setup

Install postgres
```
sudo apt update
sudo apt install postgresql postgresql-contrib
```
Install pip dependencies
```sudo pip install -r requirements.txt```

Verify the installation is working
```sudo -u postgres psql -c "SELECT version();"```

Now there is a postgres server running locally on your machine.

Run tests (NOTE: this will blow the local database away and reseed with test_data.sql)
```task run-tests```