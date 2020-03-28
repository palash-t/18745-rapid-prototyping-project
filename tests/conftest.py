# !/usr/bin/env python

import pytest
from database.database import get_db, \
							  find_one_gyro, \
							  find_one_accel, \
							  find_one_biometric, \
							  find_one_game, \
							  find_one_test, \
							  find_one_emotion


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
def blood_pressure():
	db = get_db()
	return str(find_one_biometric(db)['blood_pressure'])

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