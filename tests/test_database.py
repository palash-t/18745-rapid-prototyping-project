# !/usr/bin/env python

import pytest
import uuid
import datetime
from database.database import get_db, \
							  find_gyro_by_id, \
							  find_accel_by_id, \
							  find_biometric_by_id, \
							  find_game_by_id, \
							  find_test_by_id, \
							  find_emotion_by_id, \
							  find_medication_by_id, \
							  find_all_gyros, \
							  find_all_accels, \
							  find_all_biometric, \
							  find_all_game, \
							  find_all_test, \
							  find_all_emotion, \
							  find_all_medication, \
							  insert_gyro, \
							  insert_accel, \
							  insert_biometric, \
							  insert_game, \
							  insert_test, \
							  insert_emotion, \
							  insert_medication, \
							  insert_many_gyros, \
							  insert_many_accels, \
							  insert_many_biometrics, \
							  insert_many_games, \
							  insert_many_tests, \
							  insert_many_emotions, \
							  insert_many_medications, \
							  find_gyro_by_patient_id, \
							  find_accels_by_patient_id, \
							  find_biometric_by_patient_id, \
							  find_game_by_patient_id, \
							  find_test_by_patient_id, \
							  find_emotion_by_patient_id, \
							  find_medication_by_patient_id, \
							  find_medication_by_device_id, \
							  find_by_gyro_id, \
							  find_by_accel_id, \
							  find_by_game_id, \
							  find_by_test_id, \
							  find_by_dominant_emotion, \
							  query_gyros_by_time, \
							  query_accels_by_time, \
							  query_biometric_by_time, \
							  query_game_by_time, \
							  query_test_by_time, \
							  query_emotion_by_time, \
							  query_medication_by_time

@pytest.fixture
def database():
    db = get_db()
    return db


# def test_find_gyro_by_id(database, gyro_id):
# 	result = find_by_gyro_id(database, gyro_id)[0]
# 	result_id = result['id']
# 	result_gyro_id = result['gyro_id']
# 	assert str(result_gyro_id) == gyro_id
# 	result_description = result['description']
# 	result_patient_id = result['patient_id']
# 	result_x = result['x']
# 	result_y = result['y']
# 	result_z = result['z']

# 	gyro = find_gyro_by_id(database, result_id)
# 	assert gyro['id'] == result_id
# 	assert gyro['gyro_id'] == result_gyro_id
# 	assert gyro['description'] == result_description
# 	assert gyro['patient_id'] == result_patient_id
# 	assert gyro['x'] == result_x
# 	assert gyro['y'] == result_y
# 	assert gyro['z'] == result_z

# def test_find_accels_by_id(database, accel_id):
# 	result = find_by_accel_id(database, accel_id)[0]
# 	result_id = result['id']
# 	result_accel_id = result['accel_id']
# 	assert str(result_accel_id) == accel_id
# 	result_description = result['description']
# 	result_patient_id = result['patient_id']
# 	result_x = result['x']
# 	result_y = result['y']
# 	result_z = result['z']

# 	accel = find_accel_by_id(database, result_id)
# 	assert accel['id'] == result_id
# 	assert accel['accel_id'] == result_accel_id
# 	assert accel['description'] == result_description
# 	assert accel['patient_id'] == result_patient_id
# 	assert accel['x'] == result_x
# 	assert accel['y'] == result_y
# 	assert accel['z'] == result_z

# def test_find_biometric_by_id(database, patient_id):
# 	result = find_biometric_by_patient_id(database, patient_id)[0]
# 	result_id = result['id']
# 	result_patient_id = result['patient_id']
# 	assert str(result_patient_id) == patient_id
# 	result_blood_pressure = result['blood_pressure']
# 	result_heart_rate = result['heart_rate']

# 	biometric = find_biometric_by_id(database, result_id)
# 	assert biometric['id'] == result_id
# 	assert biometric['patient_id'] == result_patient_id
# 	assert biometric['blood_pressure'] == result_blood_pressure
# 	assert biometric['heart_rate'] == result_heart_rate

# def test_find_game_by_id(database, game_id):
# 	result = find_by_game_id(database, game_id)[0]
# 	result_id = result['id']
# 	result_game_id = result['game_id']
# 	assert str(result_game_id) == game_id
# 	result_description = result['description']
# 	result_patient_id = result['patient_id']
# 	result_left_hand_score = result['left_hand_score']
# 	result_right_hand_score = result['right_hand_score']
# 	result_time_played = result['time_played']

# 	game = find_game_by_id(database, result_id)
# 	assert game['id'] == result_id
# 	assert game['patient_id'] == result_patient_id
# 	assert game['description'] == result_description
# 	assert game['right_hand_score'] == result_right_hand_score
# 	assert game['left_hand_score'] == result_left_hand_score
# 	assert game['time_played'] == result_time_played

# def test_find_test_by_id(database, test_id):
# 	result = find_by_test_id(database, test_id)[0]
# 	result_id = result['id']
# 	result_test_id = result['test_id']
# 	assert str(result_test_id) == test_id
# 	result_description = result['description']
# 	result_patient_id = result['patient_id']
# 	result_test_score = result['test_score']

# 	test = find_test_by_id(database, result_id)
# 	assert test['id'] == result_id
# 	assert test['patient_id'] == result_patient_id
# 	assert test['description'] == result_description
# 	assert test['test_score'] == result_test_score

# def test_find_all_gyros(database):
# 	results = find_all_gyros(database)
# 	assert results is not None
# 	for result in results:
# 		assert result['id'] is not None
# 		assert result["description"] is not None
# 		assert result['patient_id'] is not None
# 		assert result['gyro_id'] is not None
# 		assert result['x'] is not None
# 		assert result['y'] is not None
# 		assert result['z'] is not None

# def test_find_all_accels(database):
# 	results = find_all_accels(database)
# 	assert results is not None
# 	for result in results:
# 		assert result['id'] is not None
# 		assert result["description"] is not None
# 		assert result['patient_id'] is not None
# 		assert result['accel_id'] is not None
# 		assert result['x'] is not None
# 		assert result['y'] is not None
# 		assert result['z'] is not None		

# def test_find_all_biometric(database):
# 	results = find_all_biometric(database)
# 	assert results is not None
# 	for result in results:
# 		assert result['id'] is not None
# 		assert result['patient_id'] is not None
# 		assert result['heart_rate'] is not None
# 		assert result['blood_pressure'] is not None

# def test_find_all_game(database):
# 	results = find_all_game(database)
# 	assert results is not None
# 	for result in results:
# 		assert result['id'] is not None
# 		assert result["description"] is not None
# 		assert result['patient_id'] is not None
# 		assert result['right_hand_score'] is not None
# 		assert result['left_hand_score'] is not None
# 		assert result['time_played'] is not None

# def test_find_all_test(database):
# 	results = find_all_test(database)
# 	assert results is not None
# 	for result in results:
# 		assert result['id'] is not None
# 		assert result["description"] is not None
# 		assert result['patient_id'] is not None
# 		assert result['test_score'] is not None

# def test_find_all_emotion(database):
# 	results = find_all_emotion(database)
# 	assert results is not None
# 	for result in results:
# 		assert result['id'] is not None
# 		assert result['patient_id'] is not None
# 		assert result['dominant_emotion'] is not None
# 		assert result['neutral'] is not None
# 		assert result['anger'] is not None
# 		assert result['happiness'] is not None
# 		assert result['surprise'] is not None
# 		assert result['sadness'] is not None

def test_find_all_medication(database):
	results = find_all_medication(database)
	assert results is not None
	for result in results:
		assert result['id'] is not None
		assert result['patient_id'] is not None
		assert result['device_id'] is not None
		assert result['scheduled_time'] is not None
		assert result['response'] is not None

# def test_insert_gyro(database):
# 	gyro_id = uuid.uuid4()
# 	gyro_description = "test gyro insert"
# 	patient_id = uuid.uuid4()
# 	x = 17
# 	y = 43
# 	z = 3

# 	assert insert_gyro(database, gyro_id, gyro_description, patient_id, x, y, z) is True

# 	results = find_by_gyro_id(database, gyro_id)
# 	for result in results:
# 		if result['gyro_id'] == gyro_id:
# 			assert result['description'] == gyro_description
# 			assert result['patient_id'] == patient_id
# 			assert result['x'] == x
# 			assert result['y'] == y
# 			assert result['z'] == z

# def test_insert_accel(database):
# 	accel_id = uuid.uuid4()
# 	accel_description = "test accel insert"
# 	patient_id = uuid.uuid4()
# 	x = 4
# 	y = 87
# 	z = 32

# 	assert insert_gyro(database, accel_id, accel_description, patient_id, x, y, z) is True

# 	results = find_by_accel_id(database, accel_id)
# 	for result in results:
# 		if result['accel_id'] == accel_id:
# 			assert result['description'] == accel_description
# 			assert result['patient_id'] == patient_id
# 			assert result['x'] == x
# 			assert result['y'] == y
# 			assert result['z'] == z

# def test_insert_biometric(database):
# 	patient_id = uuid.uuid4()
# 	heart_rate = 43
# 	blood_pressure = 120

# 	assert insert_biometric(database, patient_id, heart_rate, blood_pressure) is True

# 	results = find_biometric_by_patient_id(database, patient_id)
# 	assert results is not None
# 	for result in results:
# 		if result['patient_id'] == patient_id:
# 			assert result['blood_pressure'] == blood_pressure
# 			assert result['heart_rate'] == heart_rate

# def test_insert_game(database):
# 	game_id = uuid.uuid4()
# 	patient_id = uuid.uuid4()
# 	game_desc = "this is a cool test game"
# 	right_hand_score = 11
# 	left_hand_score = 33
# 	time_played = 65

# 	assert insert_game(database, game_id, game_desc, patient_id, left_hand_score, right_hand_score, time_played) is True

# 	results = find_by_game_id(database, game_id)
# 	assert results is not None
# 	for result in results:
# 		if result['game_id'] == game_id:
# 			assert result['patient_id'] == patient_id
# 			assert result['description'] == game_desc
# 			assert result['left_hand_score'] == left_hand_score
# 			assert result['right_hand_score'] == right_hand_score
# 			assert result['time_played'] == time_played

# def test_insert_test(database, test_id, test_desc, patient_id, test_score):
# 	test_id = uuid.uuid4()
# 	patient_id = uuid.uuid4()
# 	test_desc = "this is a cool test for cool testing of this cool api"
# 	test_score = 420

# 	assert insert_test(database, test_id, test_desc, patient_id, test_score) is True

# 	results = find_by_test_id(database, test_id)
# 	assert results is not None
# 	for result in results:
# 		if result['test_id'] == test_id:
# 			assert result['patient_id'] == patient_id
# 			assert result['description'] == test_desc
# 			assert result['test_score'] == test_score

# def test_insert_emotion(database):
# 	patient_id = uuid.uuid4()
# 	dominant_emotion = "anger"
# 	neutral = 0.3
# 	anger = 0.4
# 	happiness = 0.1
# 	surprise = 0.1
# 	sadness = 0.1

# 	assert insert_emotion(database, patient_id, dominant_emotion, neutral, anger, happiness, surprise, sadness) is True

def test_insert_medication(database):
	patient_id = uuid.uuid4()
	device_id = uuid.uuid4()
	scheduled_time = "morning"
	response = true
	assert insert_medication(database, id, patient_id, device_id, scheduled_time, response) is True

	results = find_medication_by_patient_id(database, patient_id)
	assert results is not None
	for result in results:
		if result['patient_id'] == patient_id:
			assert result['device_id'] == device_id
			assert result['scheduled_time'] == scheduled_time
			assert result['response'] == response

def test_insert_many_gyros(database, many_gyros):

	gyro_id = many_gyros[1]["gyro_id"]
	description = many_gyros[1]["description"]
	patient_id = many_gyros[1]["patient_id"]
	x = many_gyros[1]["x"]
	y = many_gyros[1]["y"]
	z = many_gyros[1]["z"]
	
	num_gyros = len(find_all_gyros(database))

	num_added_gyros = len(many_gyros)

	assert insert_many_gyros(database, many_gyros) is True

	new_num_gyros = len(find_all_gyros(database))

	assert new_num_gyros == num_gyros + num_added_gyros

	results = find_by_gyro_id(database, gyro_id)
	for result in results:
		if result['patient_id'] == patient_id:
			assert result['description'] == description
			assert result['patient_id'] == patient_id
			assert result['x'] == x
			assert result['y'] == y
			assert result['z'] == z

def test_insert_many_accels(database, many_accels):

	accel_id = many_accels[1]["accel_id"]
	description = many_accels[1]["description"]
	patient_id = many_accels[1]["patient_id"]
	x = many_accels[1]["x"]
	y = many_accels[1]["y"]
	z = many_accels[1]["z"]
	
	num_accels = len(find_all_accels(database))

	num_added_accels = len(many_accels)

	assert insert_many_accels(database, many_accels) is True

	new_num_accels = len(find_all_accels(database))

	assert new_num_accels == num_accels + num_added_accels

	results = find_by_accel_id(database, accel_id)
	for result in results:
		if result['patient_id'] == patient_id:
			assert result['description'] == description
			assert result['patient_id'] == patient_id
			assert result['x'] == x
			assert result['y'] == y
			assert result['z'] == z

def test_insert_many_biometrics(database, many_biometrics):

	patient_id = many_biometrics[1]["patient_id"]
	heart_rate = many_biometrics[1]["heart_rate"]
	blood_pressure = many_biometrics[1]["blood_pressure"]
	
	num_biometric = len(find_all_biometric(database))

	num_added_biometric = len(many_biometrics)

	assert insert_many_biometrics(database, many_biometrics) is True

	new_num_biometric = len(find_all_biometric(database))

	assert new_num_biometric == num_biometric + num_added_biometric

	results = find_biometric_by_patient_id(database, patient_id)
	for result in results:
		if result['patient_id'] == patient_id:
			assert result['heart_rate'] == heart_rate
			assert result['blood_pressure'] == blood_pressure
			
def test_insert_many_games(database, many_games):

	game_id = many_games[1]["game_id"]
	description = many_games[1]["description"]
	patient_id = many_games[1]["patient_id"]
	left_hand_score = many_games[1]["left_hand_score"]
	right_hand_score = many_games[1]["right_hand_score"]
	time_played = many_games[1]["time_played"]
	
	num_game = len(find_all_game(database))

	num_added_game = len(many_games)

	assert insert_many_games(database, many_games) is True

	new_num_game = len(find_all_game(database))

	assert new_num_game == num_game + num_added_game

	results = find_by_game_id(database, game_id)
	for result in results:
		if result['patient_id'] == patient_id:
			assert result['game_id'] == game_id
			assert result['patient_id'] == patient_id
			assert result['left_hand_score'] == left_hand_score
			assert result['right_hand_score'] == right_hand_score
			assert result['time_played'] == time_played

def test_insert_many_tests(database, many_tests):

	test_id = many_tests[1]["test_id"]
	description = many_tests[1]["description"]
	patient_id = many_tests[1]["patient_id"]
	test_score = many_tests[1]["test_score"]
	
	num_test = len(find_all_test(database))

	num_added_test = len(many_tests)

	assert insert_many_tests(database, many_tests) is True

	new_num_test = len(find_all_test(database))

	assert new_num_test == num_test + num_added_test

	results = find_by_test_id(database, test_id)
	for result in results:
		if result['patient_id'] == patient_id:
			assert result['test_id'] == test_id
			assert result['description'] == description
			assert result['patient_id'] == patient_id
			assert result['test_score'] == test_score

def test_insert_many_emotions(database, many_emotions):

	patient_id = many_emotions[1]["patient_id"]
	dominant_emotion = many_emotions[1]["dominant_emotion"]
	neutral = many_emotions[1]["neutral"]
	anger = many_emotions[1]["anger"]
	happiness = many_emotions[1]["happiness"]
	surprise = many_emotions[1]["surprise"]
	sadness = many_emotions[1]["sadness"]
	
	num_emotion = len(find_all_emotion(database))

	num_added_emotion = len(many_emotions)

	assert insert_many_emotions(database, many_emotions) is True

	new_num_emotion = len(find_all_emotion(database))

	assert new_num_emotion == num_emotion + num_added_emotion

	results = find_emotion_by_patient_id(database, patient_id)
	for result in results:
		if result['patient_id'] == patient_id:
			assert result['dominant_emotion'] == dominant_emotion
			assert str(result['neutral']) == str(neutral)
			assert str(result['anger']) == str(anger)
			assert str(result['happiness']) == str(happiness)
			assert str(result['surprise']) == str(surprise)
			assert str(result['sadness']) == str(sadness)


def test_insert_many_medications(database, many_medications):

	patient_id = many_medications[1]["patient_id"]
	device_id = many_medications[1]["device_id"]
	scheduled_time = many_medications[1]["scheduled_time"]
	response = many_medications[1]["response"]
	
	num_test = len(find_all_test(database))

	num_added_test = len(many_tests)

	assert insert_many_medications(database, many_tests) is True

	new_num_test = len(find_all_medication(database))

	assert new_num_test == num_test + num_added_test

	results = find_medication_by_patient_id(database, patient_id)
	for result in results:
		if result['patient_id'] == patient_id:
			assert result['device_id'] == device_id
			assert result['scheduled_time'] == scheduled_time
			assert result['response'] == response


# def test_find_gyro_by_patient_id(database, patient_id):
# 	results = find_gyro_by_patient_id(database, patient_id)
# 	assert results is not None
# 	for result in results:
# 		assert result['id'] is not None
# 		assert result["description"] is not None
# 		assert str(result['patient_id']) == patient_id
# 		assert result['gyro_id'] is not None
# 		assert result['x'] is not None
# 		assert result['y'] is not None
# 		assert result['z'] is not None

# def test_find_accels_by_patient_id(database, patient_id):
# 	results = find_accels_by_patient_id(database, patient_id)
# 	assert results is not None
# 	for result in results:
# 		assert result['id'] is not None
# 		assert result["description"] is not None
# 		assert str(result['patient_id']) == patient_id
# 		assert result['accel_id'] is not None
# 		assert result['x'] is not None
# 		assert result['y'] is not None
# 		assert result['z'] is not None		

# def test_find_biometric_by_patient_id(database, patient_id):
# 	results = find_biometric_by_patient_id(database, patient_id)
# 	assert results is not None
# 	for result in results:
# 		assert result['id'] is not None
# 		assert str(result['patient_id']) == patient_id
# 		assert result['heart_rate'] is not None
# 		assert result['blood_pressure'] is not None

# def test_find_game_by_patient_id(database, patient_id):
# 	results = find_game_by_patient_id(database, patient_id)
# 	assert results is not None
# 	for result in results:
# 		assert result['id'] is not None
# 		assert result['game_id'] is not None
# 		assert result["description"] is not None
# 		assert str(result['patient_id']) == patient_id
# 		assert result['left_hand_score'] is not None
# 		assert result['right_hand_score'] is not None
# 		assert result['time_played'] is not None

# def test_find_test_by_patient_id(database, patient_id):
# 	results = find_test_by_patient_id(database, patient_id)
# 	assert results is not None
# 	for result in results:
# 		assert result['id'] is not None
# 		assert result['test_id'] is not None
# 		assert result["description"] is not None
# 		assert str(result['patient_id']) == patient_id
# 		assert result['test_score'] is not None

# def test_find_emotion_by_patient_id(database, patient_id):
# 	results = find_emotion_by_patient_id(database, patient_id)
# 	assert results is not None
# 	for result in results:
# 		assert result['patient_id'] is not None
# 		assert result['dominant_emotion'] is not None
# 		assert result['neutral'] is not None
# 		assert result['anger'] is not None
# 		assert result['happiness'] is not None
# 		assert result['surprise'] is not None
# 		assert result['sadness'] is not None
# 		assert str(result['patient_id']) == patient_id

def test_find_medication_by_patient_id(database, patient_id):
	results = find_medication_by_patient_id(database, patient_id)
	assert results is not None
	for result in results:
		assert result['patient_id'] is not None
		assert result['device_id'] is not None
		assert result['scheduled_time'] is not None
		assert result['response'] is not None

def test_find_medication_by_device_id(database, device_id):
	results = find_medication_by_device_id(database, device_id)
	assert results is not None
	for result in results:
		assert result['patient_id'] is not None
		assert result['device_id'] is not None
		assert result['scheduled_time'] is not None
		assert result['response'] is not None


# def test_find_by_gyro_id(database, gyro_id):
# 	results = find_by_gyro_id(database, gyro_id)
# 	assert results is not None
# 	for result in results:
# 		assert result['id'] is not None
# 		assert result["description"] is not None
# 		assert result['patient_id'] is not None
# 		assert str(result['gyro_id']) == gyro_id
# 		assert result['x'] is not None
# 		assert result['y'] is not None
# 		assert result['z'] is not None

# def test_find_by_accel_id(database, accel_id):
# 	results = find_by_accel_id(database, accel_id)
# 	assert results is not None
# 	for result in results:
# 		assert result['id'] is not None
# 		assert result["description"] is not None
# 		assert result['patient_id'] is not None
# 		assert str(result['accel_id']) == accel_id
# 		assert result['x'] is not None
# 		assert result['y'] is not None
# 		assert result['z'] is not None	

# def test_find_by_game_id(database, game_id):
# 	results = find_by_game_id(database, game_id)
# 	assert results is not None
# 	for result in results:
# 		assert result['id'] is not None
# 		assert str(result['game_id']) == game_id
# 		assert result["description"] is not None
# 		assert result['patient_id'] is not None
# 		assert result['left_hand_score'] is not None
# 		assert result['right_hand_score'] is not None
# 		assert result['time_played'] is not None

# def test_find_by_test_id(database, test_id):
# 	results = find_by_test_id(database, test_id)
# 	assert results is not None
# 	for result in results:
# 		assert result['id'] is not None
# 		assert str(result['test_id']) == test_id
# 		assert result["description"] is not None
# 		assert result['patient_id'] is not None
# 		assert result['test_score'] is not None

# def test_find_by_dominant_emotion(database, dominant_emotion):
# 	results = find_by_dominant_emotion(database, dominant_emotion)
# 	assert results is not None
# 	for result in results:
# 		assert result['patient_id'] is not None
# 		assert result['dominant_emotion'] == dominant_emotion
# 		assert result['neutral'] is not None
# 		assert result['anger'] is not None
# 		assert result['happiness'] is not None
# 		assert result['surprise'] is not None
# 		assert result['sadness'] is not None
# 		assert result['patient_id'] is not None

# def test_query_gyros_by_time(database):
# 	# This time frame should return all results in the table
# 	start_time = str(datetime.datetime(2015, 3, 18, 16, 19, 6, 204031))
# 	end_time = str(datetime.datetime(2025, 3, 18, 16, 19, 6, 204031))

# 	results = query_gyros_by_time(database, start_time, end_time)
# 	assert results is not None

# 	all_gyros = find_all_gyros(database)
# 	assert len(all_gyros) == len(results)

# 	assert results[0]['id'] is not None
# 	assert results[0]['patient_id'] is not None 

# 	# This time frame should return no results
# 	start_time = str(datetime.datetime(2015, 3, 18, 16, 19, 6, 204031))
# 	end_time = str(datetime.datetime(2016, 3, 18, 16, 19, 6, 204031))
# 	results = query_gyros_by_time(database, start_time, end_time)
# 	assert results == []

# def test_query_accels_by_time(database):
# 	# This time frame should return all results in the table
# 	start_time = str(datetime.datetime(2015, 3, 18, 16, 19, 6, 204031))
# 	end_time = str(datetime.datetime(2025, 3, 18, 16, 19, 6, 204031))

# 	results = query_accels_by_time(database, start_time, end_time)
# 	assert results is not None

# 	all_accels = find_all_accels(database)
# 	assert len(all_accels) == len(results)

# 	assert results[0]['id'] is not None
# 	assert results[0]['patient_id'] is not None 

# 	# This time frame should return no results
# 	start_time = str(datetime.datetime(2015, 3, 18, 16, 19, 6, 204031))
# 	end_time = str(datetime.datetime(2016, 3, 18, 16, 19, 6, 204031))
# 	results = query_accels_by_time(database, start_time, end_time)
# 	assert results == []

# def test_query_biometric_by_time(database):
# 	# This time frame should return all results in the table
# 	start_time = str(datetime.datetime(2015, 3, 18, 16, 19, 6, 204031))
# 	end_time = str(datetime.datetime(2025, 3, 18, 16, 19, 6, 204031))

# 	results = query_biometric_by_time(database, start_time, end_time)
# 	assert results is not None

# 	all_biometric = find_all_biometric(database)
# 	assert len(all_biometric) == len(results)

# 	assert results[0]['id'] is not None
# 	assert results[0]['patient_id'] is not None 

# 	# This time frame should return no results
# 	start_time = str(datetime.datetime(2015, 3, 18, 16, 19, 6, 204031))
# 	end_time = str(datetime.datetime(2016, 3, 18, 16, 19, 6, 204031))
# 	results = query_biometric_by_time(database, start_time, end_time)
# 	assert results == []

# def test_query_game_by_time(database):
# 	# This time frame should return all results in the table
# 	start_time = str(datetime.datetime(2015, 3, 18, 16, 19, 6, 204031))
# 	end_time = str(datetime.datetime(2025, 3, 18, 16, 19, 6, 204031))

# 	results = query_game_by_time(database, start_time, end_time)
# 	assert results is not None

# 	all_games = find_all_game(database)
# 	assert len(all_games) == len(results)

# 	assert results[0]['id'] is not None
# 	assert results[0]['patient_id'] is not None 

# 	# This time frame should return no results
# 	start_time = str(datetime.datetime(2015, 3, 18, 16, 19, 6, 204031))
# 	end_time = str(datetime.datetime(2016, 3, 18, 16, 19, 6, 204031))
# 	results = query_game_by_time(database, start_time, end_time)
# 	assert results == []

# def test_query_test_by_time(database):
# 	# This time frame should return all results in the table
# 	start_time = str(datetime.datetime(2015, 3, 18, 16, 19, 6, 204031))
# 	end_time = str(datetime.datetime(2025, 3, 18, 16, 19, 6, 204031))

# 	results = query_test_by_time(database, start_time, end_time)
# 	assert results is not None

# 	all_tests = find_all_test(database)
# 	assert len(all_tests) == len(results)

# 	assert results[0]['id'] is not None
# 	assert results[0]['patient_id'] is not None 

# 	# This time frame should return no results
# 	start_time = str(datetime.datetime(2015, 3, 18, 16, 19, 6, 204031))
# 	end_time = str(datetime.datetime(2016, 3, 18, 16, 19, 6, 204031))
# 	results = query_test_by_time(database, start_time, end_time)
# 	assert results == []

# def test_query_emotion_by_time(database):
# 	# This time frame should return all results in the table
# 	start_time = str(datetime.datetime(2015, 3, 18, 16, 19, 6, 204031))
# 	end_time = str(datetime.datetime(2025, 3, 18, 16, 19, 6, 204031))

# 	results = query_emotion_by_time(database, start_time, end_time)
# 	assert results is not None

# 	all_emotion = find_all_emotion(database)
# 	assert len(all_emotion) == len(results)

# 	assert results[0]['id'] is not None
# 	assert results[0]['patient_id'] is not None 

# 	# This time frame should return no results
# 	start_time = str(datetime.datetime(2015, 3, 18, 16, 19, 6, 204031))
# 	end_time = str(datetime.datetime(2016, 3, 18, 16, 19, 6, 204031))
# 	results = query_emotion_by_time(database, start_time, end_time)
# 	assert results == []


def test_query_medication_by_time(database):
	# This time frame should return all results in the table
	start_time = str(datetime.datetime(2015, 3, 18, 16, 19, 6, 204031))
	end_time = str(datetime.datetime(2025, 3, 18, 16, 19, 6, 204031))

	results = query_medication_by_time(database, start_time, end_time)
	assert results is not None

	all_medication = find_all_medication(database)
	assert len(all_medication) == len(results)

	assert results[0]['id'] is not None
	assert results[0]['patient_id'] is not None 

	# This time frame should return no results
	start_time = str(datetime.datetime(2015, 3, 18, 16, 19, 6, 204031))
	end_time = str(datetime.datetime(2016, 3, 18, 16, 19, 6, 204031))
	results = query_medication_by_time(database, start_time, end_time)
	assert results == []