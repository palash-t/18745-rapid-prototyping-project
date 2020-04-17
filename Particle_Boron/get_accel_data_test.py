# on AWS python script
# 0. install dependencies (pycurl)
# 1. Make APIs to Particle Device Cloud -> Get published Sensor Data
# 2. (optional) Make data format alignment -> database schema
# 3. Make APIs calls to Database to insert dataframe
# 4. Verify data correctly inserted



# particle cloud (STRUCT)

# struct sensor_data
# {
#     const char* accel_id;
#     const char* description;
#     const char* patient_id;
#     const float x;
#     const float y;
#     const float z;
# };

# Publish to Device Cloud

# AWS's python script. Get struct -> unfold python varibles


import sys
sys.path.append('../database')
from database import *
import pycurl
from io import BytesIO
import json
import uuid

#### Set up HTTP cURL #####


para_list =  ['ax','ay','az','gx','gy','gz']
para_dic = dict()


for p in para_list:
    b_obj = BytesIO() 
    crl = pycurl.Curl()
    url = 'https://api.particle.io/v1/devices/e00fce686d200543393e0bba/' + p + '?access_token=3a45f46a1ebf53a33f0e3b70c576f5d05da776a4'
    crl.setopt(crl.URL, url)
    crl.setopt(crl.WRITEDATA, b_obj)
    crl.perform()
    crl.close()
    sensor_data =b_obj.getvalue()
    
    print("Sensor Value " + str(sensor_data))
    format_value = json.loads(sensor_data)
    if 'result' in format_value:
        print("Format data " + str(format_value["result"]))
        para_dic[p] = float(format_value['result'])
    else:
        para_dic[p] = 0.0




# mock accel_id, patient_id, description
para_dic["accel_id"] = uuid.uuid4()
para_dic["gyro_id"] = uuid.uuid4()
para_dic["patient_id"] = uuid.uuid4()
para_dic["description"] = "testing accel data"
    #json_list.append(sensor_value)
#print('jsonlist')
#print(json_list)

# Set URL value
# curl -G https://api.particle.io/v1/devices/e00fce686d200543393e0bba/command -d access_token=3a45f46a1ebf53a33f0e3b70c576f5d05da776a4


# Perform a file transfer 
#crl.perform() 

# End curl session
#crl.close()

# Get the content stored in the BytesIO object (in byte characters) 
# Decode the bytes stored in get_body to HTML and print the result
mock_value = '{"cmd":"VarReturn","name":"x","result":1.1,"coreInfo":{"last_app":"","last_heard":"2020-04-02T23:04:39.659Z","connected":true,"last_handshake_at":"2020-04-02T23:03:16.391Z","deviceID":"e00fce686d200543393e0bba","product_id":13}}'

accel_id = para_dic['accel_id']
gyro_id = para_dic['gyro_id']
description = para_dic['description']
patient_id = para_dic['patient_id']
ax = para_dic['ax']
ay = para_dic['ay']
az = para_dic['az']
gx = para_dic['gx']
gy = para_dic['gy']
gz = para_dic['gz']

# source for secrets and DB info
db = get_db()


# db, accel_id, description, patient_id, x, y, z
insert_accel(db, accel_id, description, patient_id, ax, ay, az)
insert_gyro(db, gyro_id, description, patient_id, gx, gy, gz)


# verify data
retrieved_accel = []
print("accel_id to find: ", accel_id)
retrieved_accel = find_by_accel_id(db, accel_id)
print(str(retrieved_accel) + "retrieved_accel list")
retrieved_gyro =  find_by_gyro_id(db, gyro_id)
print(str(retrieved_gyro) + "retrieved_gyro list")
print(retrieved_accel)
for dic in retrieved_accel:
    if retrieved_accel != None and dic['x'] == para_dic['ax'] and dic['y'] == para_dic['ay'] and dic['z'] == para_dic['az']:
        print("insert accel tests have passed")

for dic in retrieved_gyro:
    if retrieved_gyro != None and (dic['x'] == para_dic['gx'] and dic['y'] == para_dic['gy'] and dic['z'] == para_dic['gz']):
        print("insert gyro tests have passed")