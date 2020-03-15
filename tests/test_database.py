# !/usr/bin/env python

import pytest
from database.database import get_db \
							  find_one_accel \
							  find_gyro_by_id
							  find_accels_by_id \
							  find_biometric_by_id \
							  find_game_by_id \
							  find_test_by_id \
							  find_all_gyros \
							  find_all_accels \
							  find_all_biometric \
							  find_all_game \
							  find_all_test \
							  insert_gyro \
							  insert_accel \
							  insert_biometric \
							  insert_game \
							  insert_test \
							  find_gyro_by_patient_id \
							  find_accels_by_patient_id \
							  find_biometric_by_patient_id \
							  find_game_by_patient_id \
							  find_test_by_patient_id \
							  find_by_gyro_id \
							  find_by_accel_id \
							  find_by_game_id \
							  find_by_test_id \
							  query_gyros_by_time \
							  query_accels_by_time \
							  query_biometric_by_time \
							  query_game_by_time \
							  query_test_by_time

@pytest.fixture
def database():
    db = get_db()
    return db


def test_find_gyro_by_id(database, gyro_id):


def test_find_accels_by_id(database, accel_id):


def test_find_biometric_by_id(database, patient_id):


def test_find_game_by_id(database, game_id):


def test_find_test_by_id(database, test_id):


def test_find_all_gyros(database):


def test_find_all_accels(database):


def test_find_all_biometric(database):


def test_find_all_game(database):


def test_find_all_test(database):


def test_insert_gyro(database, gyro_id, gyro_desc, patient_id, gyro_x, gyro_y, gyro_z):


def test_insert_accel(database, accel_id, accel_desc, patient_id, accel_x, accel_y, accel_z):


def test_insert_biometric(database, patient_id, heart_rate, blood_pressure):


def test_insert_game(database, game_id, game_desc, patient_id, game_score, time_played):


def test_insert_test(database, test_id, test_desc, patient_id, test_score):


def test_find_gyro_by_patient_id(database, patient_id):


def test_find_accels_by_patient_id(database, patient_id):


def test_find_biometric_by_patient_id(database, patient_id):


def test_find_game_by_patient_id(database, patient_id):


def test_find_test_by_patient_id(database, patient_id):


def test_find_by_gyro_id(database, gyro_id):


def test_find_by_accel_id(database, accel_id):


def test_find_by_game_id(database, game_id):


def test_find_by_test_id(database, test_id):


def test_query_gyros_by_time(database, start_time, end_time):


def test_query_accels_by_time(database, start_time, end_time):


def test_query_biometric_by_time(database, start_time, end_time):


def test_query_game_by_time(database, start_time, end_time):


def test_query_test_by_time(database, start_time, end_time):