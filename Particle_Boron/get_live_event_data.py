import sys
sys.path.append('../database')
from database import *
import pycurl
from io import BytesIO
import json
import uuid
import time
import requests
from collections import OrderedDict
para_dic = dict()
accel_para_list = ['ax','ay', 'az']
gyro_para_list = ['gx','gy', 'gz']
para_name = {'ax' : "Accel X", 'ay' : "Accel Y", 'az' : "Accel Z", 'gx' : "Gyro X", 'gy' : "Gyro Y", 'gz' : "Gyro Z"}
cur_time_stamp = "2020-04-10T22:48:39.711Z"
expect_accel = False
para_dic["accel_id"] = uuid.uuid4()
para_dic["gyro_id"] = uuid.uuid4()
para_dic["patient_id"] = uuid.uuid4()
para_dic["description"] = "testing data"
print("get para_dic " + str(para_dic))
accel_id = para_dic['accel_id']
gyro_id = para_dic['gyro_id']
description = para_dic['description']
patient_id = para_dic['patient_id']
db = get_db()
# while True:
url = 'https://api.particle.io/v1/devices/e00fce686d200543393e0bba/events?access_token=35f5e67b960946849b604517030d0bc0f48d6753'
with requests.get(url, stream=True) as response:
    for line in response.iter_lines(decode_unicode=True):
        if line == ":ok":
            pass
        elif line == "event: accel":
            expect_accel = True
        elif line == "event: gyro":
            expect_accel = False

        if expect_accel and "data" in line:
            
            format_value = json.loads(line[6:])
            accel_list = format_value['data'].split("#")
            cur_time_stamp = format_value["published_at"]
            for index, val in enumerate(accel_list):
                print(para_name[accel_para_list[index]] + ": " +  str(val) + "   Time Stamp: " + format_value["published_at"])
                para_dic[accel_para_list[index]] = float(val)
            ax = para_dic['ax']
            ay = para_dic['ay']
            az = para_dic['az']
            insert_accel(db, accel_id, description, patient_id, ax, ay, az)
            # retrieved_accel = find_by_accel_id(db, accel_id)
            # for dic in retrieved_accel:
            #     if retrieved_accel != None and dic['x'] == para_dic['ax'] and dic['y'] == para_dic['ay'] and dic['z'] == para_dic['az']:
            #         print("Insert accel data successful!")

            
        elif (not expect_accel) and "data" in line:
            format_value = json.loads(line[6:])
            gyro_list = format_value['data'].split("#")
            cur_time_stamp = format_value["published_at"]
            for index, val in enumerate(gyro_list):
                print(para_name[gyro_para_list[index]] + ": " +  str(val) + "   Time Stamp: " + format_value["published_at"])
                para_dic[gyro_para_list[index]] = float(val)
            gx = para_dic['gx']
            gy = para_dic['gy']
            gz = para_dic['gz']
            insert_gyro(db, gyro_id, description, patient_id, gx, gy, gz)
            # retrieved_gyro =  find_by_gyro_id(db, gyro_id)
            # for dic in retrieved_gyro:
            #     if retrieved_gyro != None and (dic['x'] == para_dic['gx'] and dic['y'] == para_dic['gy'] and dic['z'] == para_dic['gz']):
            #         print("Insert gyro data successful!")


        # source for secrets and DB info
        
        # db, accel_id, description, patient_id, x, y, z
        
    # time.sleep(1)