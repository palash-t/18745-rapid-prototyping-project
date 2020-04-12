# rapid-prototyping-project

## Project Description

The APIs in this repository are the access point for Hardware and Dashboards to access data stored within this database. As Algorithms are specified and Dashboards gets nearer to completion, additional processing steps will be added. The schema can be located in schemas.json.

The Embedded System consists of a Particle Boron LTE board that publish/subscribe IMU and other sensor data to the cloud. By leveraging the cellular feature of Particle Boron, the Dashboard will be able to visualize realtime sensor data readings from the PD patient. On AWS EC2, we are able to leverage both the Particle Cloud's API and our own cloud platform API to transport sensor data into our own SQL database for further processings and visualizations. 

Ask Sam Nelson, Scott Mionis, or Palash Thakur for questions regarding the database code.

Ask Jiaqi Zou for questions regarding the embedded system code. 

<img src="https://github.com/palash-t/18745-rapid-prototyping-project/blob/master/docs/embedded_pic.jpg" height="480" width="480">

## Checklist for adding an api function or adding to the schema

1. Add the table to the `init_engine_db.sql`, use other tables as examples
2. Add necessary functions to `database.py` with DETAILED docstrings. See other functions for examples.
3. Add dummy test data to `test_data.sql`
4. Add a tests to exercise each new function appropriately.
5. Add the function header and the doc string to `API.md`

## Local Setup

Install task
```
sudo apt install snapd -y
$(shell echo "export PATH=${PATH}:/snap/bin" >> ~/.bashrc)
sudo snap install task --classic
sudo wget -O /usr/share/bash-completion/completions/task.bash https://raw.githubusercontent.com/go-task/task/v2.7.1/completion/bash/task.bash
echo "Run \"source ~/.bashrc\" to get tab completion"
```

To run the tests, just make sure you have docker installed and run the following command from the repo root
```
task run-tests
```

## Embedded Setup

Go to Particle Web IDE: https://build.particle.io/ to import the .ino code.
Connect to the Particle Boron Device and after activation, retrieve device ID and access token.

Make sure node and npm are installed.
```
$ node -v
$ npm -v
```
Install Particle-CLI tool.
```
$ npm install -g particle-cli
$ particle update-cli
$ particle login
```
Getting a Published variable or accessing a published function:
```
$ particle get variable_name
$ particle call device_id function_name param
```
Flashing the Boron board over cloud in Web IDE is recommended. But flashing Boron over UART is:
```
$ particle flash --usb firmware.bin
$ particle flash my_new_device_name tinker
```

To retrieve the device published stream, Run following command in terminal.
```
$ curl https://api.particle.io/v1/devices/e00fce686d200543393e0bba/events?access_token=35f5e67b960946849b604517030d0bc0f48d6753

$ curl https://api.particle.io/v1/devices/e00fce686d200543393e0bba/ax?access_token=35f5e67b960946849b604517030d0bc0f48d6753
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

