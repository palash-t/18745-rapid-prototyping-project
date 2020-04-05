# rapid-prototyping-project

## Project Description

The APIs in this repository are the access point for Hardware and Dashboards to access data stored within this database. As Algorithms are specified and Dashboards gets nearer to completion, additional processing steps will be added. The schema can be located in schemas.json.

Ask Sam Nelson, Scott Mionis, or Palash Thakur for questions regarding the code.

## Checklist for adding an api function or adding to the schema

1. Add the table to the `init_engine_db.sql`, use other tables as examples
2. Add necessary functions to `database.py` with DETAILED docstrings. See other functions for examples.
3. Add dummy test data to `test_data.sql`
4. Add a tests to exercise each new function appropriately.
5. Add the function header and the doc string to `API.md`

## Local Setup

If you want to run the tests, just make sure you have docker installed and run the following command from the repo root
```
task run-tests
```

## Information in the section below is outdated

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

Source passwords
```
source secrets.sh
```

Run tests (NOTE: this will blow the local database away and reseed with test_data.sql)
```
task run-tests
```