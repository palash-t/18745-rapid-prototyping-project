# !/usr/bin/env python

import pytest
import uuid
from database.database import get_db, \
							  find_one_gyro, \
							  find_one_accel, \
							  find_one_biometric, \
							  find_one_game, \
							  find_one_test, \
							  find_one_emotion, \
							  find_one_personal_check_in, \
							  find_one_medication


@pytest.fixture
def gyro_id():
	db = get_db()
	return str(find_one_gyro(db)['gyro_id'])

@pytest.fixture
def accel_id():
	db = get_db()
	return str(find_one_accel(db)['accel_id'])

@pytest.fixture
def patient_id():
	db = get_db()
	return str(find_one_biometric(db)['patient_id'])

@pytest.fixture
def game_id():
	db = get_db()
	return str(find_one_game(db)['game_id'])

@pytest.fixture
def test_id():
	db = get_db()
	return str(find_one_test(db)['test_id'])

@pytest.fixture
def gyro_desc():
	db = get_db()
	return str(find_one_gyro(db)['description'])

@pytest.fixture
def gyro_x():
	db = get_db()
	return str(find_one_gyro(db)['x'])

@pytest.fixture
def gyro_y():
	db = get_db()
	return str(find_one_gyro(db)['y'])

@pytest.fixture
def gyro_z():
	db = get_db()
	return str(find_one_gyro(db)['z'])

@pytest.fixture
def accel_desc():
	db = get_db()
	return str(find_one_accel(db)['description'])

@pytest.fixture
def accel_x():
	db = get_db()
	return str(find_one_accel(db)['x'])

@pytest.fixture
def accel_y():
	db = get_db()
	return str(find_one_accel(db)['y'])

@pytest.fixture
def accel_z():
	db = get_db()
	return str(find_one_accel(db)['z'])

@pytest.fixture
def heart_rate():
	db = get_db()
	return str(find_one_biometric(db)['heart_rate'])

@pytest.fixture
def systolic_blood_pressure():
	db = get_db()
	return str(find_one_biometric(db)['systolic_blood_pressure'])

@pytest.fixture
def diastolic_blood_pressure():
	db = get_db()
	return str(find_one_biometric(db)['diastolic_blood_pressure'])

@pytest.fixture
def game_desc():
	db = get_db()
	return str(find_one_game(db)['description'])

@pytest.fixture
def left_hand_score():
	db = get_db()
	return str(find_one_game(db)['left_hand_score'])

@pytest.fixture
def right_hand_score():
	db = get_db()
	return str(find_one_game(db)['right_hand_score'])

@pytest.fixture
def time_played():
	db = get_db()
	return str(find_one_game(db)['time_played'])

@pytest.fixture
def test_id():
	db = get_db()
	return str(find_one_test(db)['test_id'])

@pytest.fixture
def test_desc():
	db = get_db()
	return str(find_one_test(db)['description'])

@pytest.fixture
def test_score():
	db = get_db()
	return str(find_one_test(db)['test_score'])

@pytest.fixture
def dominant_emotion():
	db = get_db()
	return str(find_one_emotion(db)['dominant_emotion'])

@pytest.fixture
def category():
	db = get_db()
	return str(find_one_personal_check_in(db)['category'])

@pytest.fixture
def medication_patient_id():
	db = get_db()
	return str(find_one_medication(db)['patient_id'])

@pytest.fixture
def device_id():
	db = get_db()
	return str(find_one_medication(db)['device_id'])

@pytest.fixture
def personal_check_in_patient_id():
	db = get_db()
	return str(find_one_personal_check_in(db)['patient_id'])

@pytest.fixture
def many_gyros():
	data = [{
		"gyro_id": uuid.uuid4(),
		"description": "test1",
		"patient_id": uuid.uuid4(),
		"x": 7,
		"y": 89,
		"z": 3
	},
	{
		"gyro_id": uuid.uuid4(),
		"description": "test2",
		"patient_id": uuid.uuid4(),
		"x": 6,
		"y": 3,
		"z": 2
	},
	{
		"gyro_id": uuid.uuid4(),
		"description": "test3",
		"patient_id": uuid.uuid4(),
		"x": 420,
		"y": 45,
		"z": 1
	},
	{
		"gyro_id": uuid.uuid4(),
		"description": "test4",
		"patient_id": uuid.uuid4(),
		"x": 3,
		"y": 75,
		"z": 12
	}]

	return data

@pytest.fixture
def many_accels():
	data = [{
		"accel_id": uuid.uuid4(),
		"description": "test1",
		"patient_id": uuid.uuid4(),
		"x": 7,
		"y": 89,
		"z": 3
	},
	{
		"accel_id": uuid.uuid4(),
		"description": "test2",
		"patient_id": uuid.uuid4(),
		"x": 6,
		"y": 3,
		"z": 2
	},
	{
		"accel_id": uuid.uuid4(),
		"description": "test3",
		"patient_id": uuid.uuid4(),
		"x": 420,
		"y": 45,
		"z": 1
	},
	{
		"accel_id": uuid.uuid4(),
		"description": "test4",
		"patient_id": uuid.uuid4(),
		"x": 3,
		"y": 75,
		"z": 12
	}]

	return data

@pytest.fixture
def many_biometrics():
	data = [{
		"patient_id": uuid.uuid4(),
		"heart_rate": 120,
		"systolic_blood_pressure": 140,
		"diastolic_blood_pressure": 69
	},
	{
		"patient_id": uuid.uuid4(),
		"heart_rate": 100,
		"systolic_blood_pressure": 420,
		"diastolic_blood_pressure": 69
	},
	{
		"patient_id": uuid.uuid4(),
		"heart_rate": 90,
		"systolic_blood_pressure": 7,
		"diastolic_blood_pressure": 96
	},
	{
		"patient_id": uuid.uuid4(),
		"heart_rate": 120,
		"systolic_blood_pressure": 89,
		"diastolic_blood_pressure": 69
	}]

	return data

@pytest.fixture
def many_games():
	data = [{
		"game_id": uuid.uuid4(),
		"description": "test1",
		"patient_id": uuid.uuid4(),
		"left_hand_score": 140,
		"right_hand_score": 99,
		"time_played": 50
	},
	{
		"game_id": uuid.uuid4(),
		"description": "test2",
		"patient_id": uuid.uuid4(),
		"left_hand_score": 50,
		"right_hand_score": 99,
		"time_played": 100
	},
	{
		"game_id": uuid.uuid4(),
		"description": "test3",
		"patient_id": uuid.uuid4(),
		"left_hand_score": 80,
		"right_hand_score": 199,
		"time_played": 30
	},
	{
		"game_id": uuid.uuid4(),
		"description": "test4",
		"patient_id": uuid.uuid4(),
		"left_hand_score": 65,
		"right_hand_score": 90,
		"time_played": 80
	}]

	return data

@pytest.fixture
def many_tests():
	data = [{
		"test_id": uuid.uuid4(),
		"description": "test1",
		"patient_id": uuid.uuid4(),
		"test_score": 140
	},
	{
		"test_id": uuid.uuid4(),
		"description": "test2",
		"patient_id": uuid.uuid4(),
		"test_score": 99
	},
	{
		"test_id": uuid.uuid4(),
		"description": "test3",
		"patient_id": uuid.uuid4(),
		"test_score": 50
	},
	{
		"test_id": uuid.uuid4(),
		"description": "test4",
		"patient_id": uuid.uuid4(),
		"test_score": 69
	}]

	return data

@pytest.fixture
def many_emotions():
	data = [{
		"patient_id": uuid.uuid4(),
		"dominant_emotion": "anger",
		"neutral": 0.1,
		"anger": 0.2,
		"happiness": 0.5,
		"surprise": 0.6,
		"sadness": 0.7
	},
	{
		"patient_id": uuid.uuid4(),
		"dominant_emotion": "sadness",
		"neutral": 0.3,
		"anger": 0.4,
		"happiness": 0.8,
		"surprise": 0.2,
		"sadness": 0.1
	},
	{
		"patient_id": uuid.uuid4(),
		"dominant_emotion": "sadness",
		"neutral": 0.3,
		"anger": 0.7,
		"happiness": 0.1,
		"surprise": 0.2,
		"sadness": 0.9
	},
	{
		"patient_id": uuid.uuid4(),
		"dominant_emotion": "happiness",
		"neutral": 0.8,
		"anger": 0.1,
		"happiness": 0.3,
		"surprise": 0.2,
		"sadness": 0.9
	}]
	
	return data

@pytest.fixture
def many_personal_check_ins():
	data = [{
		"patient_id": uuid.uuid4(),
		"category": "food",
		"value": "apple",
	},
	{
		"patient_id": uuid.uuid4(),
		"category": "food",
		"value": "banana",
	},
	{
		"patient_id": uuid.uuid4(),
		"category": "car",
		"value": "ford",
	},
	{
		"patient_id": uuid.uuid4(),
		"category": "car",
		"value": "chevy",
	}]
	
	return data

@pytest.fixture
def many_medications():
	data = [{
		"patient_id": uuid.uuid4(),
		"device_id": uuid.uuid4(),
		"scheduled_time": "evening",
		"response": True,
	},
	{
		"patient_id": uuid.uuid4(),
		"device_id": uuid.uuid4(),
		"scheduled_time": "morning",
		"response": False,
	},
	{
		"patient_id": uuid.uuid4(),
		"device_id": uuid.uuid4(),
		"scheduled_time": "afternoon",
		"response": True,
	},
	{
		"patient_id": uuid.uuid4(),
		"device_id": uuid.uuid4(),
		"scheduled_time": "evening",
		"response": True,
	}]
	
	return data