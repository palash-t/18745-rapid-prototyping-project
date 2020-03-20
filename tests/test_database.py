# !/usr/bin/env python

import pytest
from database.database import get_db, \
							  find_gyro_by_id, \
							  find_accels_by_id, \
							  find_biometric_by_id, \
							  find_game_by_id, \
							  find_test_by_id, \
							  find_all_gyros, \
							  find_all_accels, \
							  find_all_biometric, \
							  find_all_game, \
							  find_all_test, \
							  insert_gyro, \
							  insert_accel, \
							  insert_biometric, \
							  insert_game, \
							  insert_test, \
							  find_gyro_by_patient_id, \
							  find_accels_by_patient_id, \
							  find_biometric_by_patient_id, \
							  find_game_by_patient_id, \
							  find_test_by_patient_id, \
							  find_by_gyro_id, \
							  find_by_accel_id, \
							  find_by_game_id, \
							  find_by_test_id, \
							  query_gyros_by_time, \
							  query_accels_by_time, \
							  query_biometric_by_time, \
							  query_game_by_time, \
							  query_test_by_time

@pytest.fixture
def database():
    db = get_db()
    return db


def test_find_gyro_by_id(database, gyro_id):
	result = find_by_gyro_id(database, gyro_id)[0]
	result_id = result['id']
	result_gyro_id = result['gyro_id']
	assert str(result_gyro_id) == gyro_id
	result_description = result['description']
	result_patient_id = result['patient_id']
	result_x = result['x']
	result_y = result['y']
	result_z = result['z']

	gyro = find_gyro_by_id(database, result_id)
	assert gyro['id'] == result_id
	assert str(gyro['gyro_id']) == gyro_id
	assert gyro['description'] == result_description
	assert gyro['patient_id'] == result_patient_id
	assert gyro['x'] == result_x
	assert gyro['y'] == result_y
	assert gyro['z'] == result_z

def test_find_accels_by_id(database, accel_id):
	assert find_accels_by_id(database, accel_id) is not None

def test_find_biometric_by_id(database, patient_id):
	assert find_biometric_by_id(database, patient_id) is not None

def test_find_game_by_id(database, game_id):
	assert find_game_by_id(database, game_id) is not None

def test_find_test_by_id(database, test_id):
	assert find_test_by_id(database, test_id) is not None

def test_find_all_gyros(database):
	results = find_all_gyros(database)
	assert results is not None
	for result in results:
		assert result['id'] is not None
		assert result["description"] is not None
		assert result['patient_id'] is not None
		assert result['gyro_id'] is not None
		assert result['x'] is not None
		assert result['y'] is not None
		assert result['z'] is not None

def test_find_all_accels(database):
	results = find_all_accels(database)
	assert results is not None
	for result in results:
		assert result['id'] is not None
		assert result["description"] is not None
		assert result['patient_id'] is not None
		assert result['accel_id'] is not None
		assert result['x'] is not None
		assert result['y'] is not None
		assert result['z'] is not None		

def test_find_all_biometric(database):
	results = find_all_biometric(database)
	assert results is not None
	for result in results:
		assert result['id'] is not None
		assert result['patient_id'] is not None
		assert result['heart_rate'] is not None
		assert result['blood_pressure'] is not None

def test_find_all_game(database):
	results = find_all_game(database)
	assert results is not None
	for result in results:
		assert result['id'] is not None
		assert result["description"] is not None
		assert result['patient_id'] is not None
		assert result['game_score'] is not None
		assert result['time_played'] is not None

def test_find_all_test(database):
	results = find_all_test(database)
	assert results is not None
	for result in results:
		assert result['id'] is not None
		assert result["description"] is not None
		assert result['patient_id'] is not None
		assert result['test_score'] is not None

def test_insert_gyro(database, gyro_id, gyro_desc, patient_id, gyro_x, gyro_y, gyro_z):
	assert insert_gyro(database, gyro_id, gyro_desc, patient_id, gyro_x, gyro_y, gyro_z) is True

def test_insert_accel(database, accel_id, accel_desc, patient_id, accel_x, accel_y, accel_z):
	assert insert_accel(database, accel_id, accel_desc, patient_id, accel_x, accel_y, accel_z) is True

def test_insert_biometric(database, patient_id, heart_rate, blood_pressure):
	assert insert_biometric(database, patient_id, heart_rate, blood_pressure) is True

def test_insert_game(database, game_id, game_desc, patient_id, game_score, time_played):
	assert insert_game(database, game_id, game_desc, patient_id, game_score, time_played) is True

def test_insert_test(database, test_id, test_desc, patient_id, test_score):
	assert insert_test(database, test_id, test_desc, patient_id, test_score) is True

def test_find_gyro_by_patient_id(database, patient_id):
	results = find_gyro_by_patient_id(database, patient_id)
	assert results is not None
	for result in results:
		assert result['id'] is not None
		assert result["description"] is not None
		assert str(result['patient_id']) == patient_id
		assert result['gyro_id'] is not None
		assert result['x'] is not None
		assert result['y'] is not None
		assert result['z'] is not None

def test_find_accels_by_patient_id(database, patient_id):
	results = find_accels_by_patient_id(database, patient_id)
	assert results is not None
	for result in results:
		assert result['id'] is not None
		assert result["description"] is not None
		assert str(result['patient_id']) == patient_id
		assert result['accel_id'] is not None
		assert result['x'] is not None
		assert result['y'] is not None
		assert result['z'] is not None		

def test_find_biometric_by_patient_id(database, patient_id):
	results = find_biometric_by_patient_id(database, patient_id)
	assert results is not None
	for result in results:
		assert result['id'] is not None
		assert str(result['patient_id']) == patient_id
		assert result['heart_rate'] is not None
		assert result['blood_pressure'] is not None

def test_find_game_by_patient_id(database, patient_id):
	results = find_game_by_patient_id(database, patient_id)
	assert results is not None
	for result in results:
		assert result['id'] is not None
		assert result["description"] is not None
		assert str(result['patient_id']) == patient_id
		assert result['game_score'] is not None
		assert result['time_played'] is not None

def test_find_test_by_patient_id(database, patient_id):
	results = find_test_by_patient_id(database, patient_id)
	assert results is not None
	for result in results:
		assert result['id'] is not None
		assert result["description"] is not None
		assert str(result['patient_id']) == patient_id
		assert result['test_score'] is not None

def test_find_by_gyro_id(database, gyro_id):
	results = find_by_gyro_id(database, gyro_id)
	for result in results:
		assert result['id'] is not None

def test_find_by_accel_id(database, accel_id):
	results = find_by_accel_id(database, accel_id)
	for result in results:
		assert result['id'] is not None

def test_find_by_game_id(database, game_id):
	results = find_by_game_id(database, game_id)
	for result in results:
		assert result['id'] is not None

def test_find_by_test_id(database, test_id):
	results = find_by_test_id(database, test_id)
	for result in results:
		assert result['id'] is not None

def test_query_gyros_by_time(database, start_time, end_time):
	# assert query_gyros_by_time(database, start_time, end_time) is not None
	pass

def test_query_accels_by_time(database, start_time, end_time):
	# assert query_accels_by_time(database, start_time, end_time) is not None
	pass

def test_query_biometric_by_time(database, start_time, end_time):
	# assert query_biometric_by_time(database, start_time, end_time) is not None
	pass

def test_query_game_by_time(database, start_time, end_time):
	# assert query_game_by_time(database, start_time, end_time) is not None
	pass

def test_query_test_by_time(database, start_time, end_time):
		pass# assert query_test_by_time(database, start_time, end_time) is not None
