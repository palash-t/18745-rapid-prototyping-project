import sys
sys.path.append('../database')
from database import *
import pycurl
from io import BytesIO
import json
import uuid
import time

para_list =  ['ax','ay','az','gx','gy','gz']
para_dic = dict()
para_name = {'ax' : "Accel X", 'ay' : "Accel Y", 'az' : "Accel Z", 'gx' : "Gyro X", 'gy' : "Gyro Y", 'gz' : "Gyro Z"}


while True:
    for p in para_list:
        b_obj = BytesIO() 
        crl = pycurl.Curl()
        url = 'https://api.particle.io/v1/devices/e00fce686d200543393e0bba/' + p + '?access_token=3a45f46a1ebf53a33f0e3b70c576f5d05da776a4'
        crl.setopt(crl.URL, url)
        crl.setopt(crl.WRITEDATA, b_obj)
        crl.perform()
        crl.close()
        sensor_data =b_obj.getvalue()
        cur_time_stamp = "2020-04-10T22:48:39.711Z"
        format_value = json.loads(sensor_data)
        if 'result' in format_value and 'last_heard' in format_value["coreInfo"] :
            cur_time_stamp = format_value["coreInfo"]["last_heard"]
            print(para_name[p] + ": " +  str(format_value["result"]) + "   Time Stamp: " + format_value["coreInfo"]["last_heard"] )
            para_dic[p] = float(format_value['result'])
        else:
            para_dic[p] = 0.0
            print(para_name[p] + ": 0.0" + "   Time Stamp: " + cur_time_stamp)

    para_dic["accel_id"] = uuid.uuid4()
    para_dic["gyro_id"] = uuid.uuid4()
    para_dic["patient_id"] = uuid.uuid4()
    para_dic["description"] = "testing accel data"


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


    retrieved_accel = find_by_accel_id(db, accel_id)
    retrieved_gyro =  find_by_gyro_id(db, gyro_id)

    for dic in retrieved_accel:
        if retrieved_accel != None and dic['x'] == para_dic['ax'] and dic['y'] == para_dic['ay'] and dic['z'] == para_dic['az']:
            print("Insert accel data successful!")

    for dic in retrieved_gyro:
        if retrieved_gyro != None and (dic['x'] == para_dic['gx'] and dic['y'] == para_dic['gy'] and dic['z'] == para_dic['gz']):
            print("Insert gyro data successful!")

    time.sleep(1)