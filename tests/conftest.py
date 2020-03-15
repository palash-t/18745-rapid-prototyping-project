# !/usr/bin/env python

import pytest
from database.database import get_db \
							  find_one_gyro \
							  find_one_accel \
							  find_one_biometric \
							  find_one_game \
							  find_one_test


@pytest.fixture
def gyro_id():
	db = get_db()
	return

@pytest.fixture
def accel_id():
	db = get_db()
	return

@pytest.fixture
def patient_id():
	db = get_db()
	return

@pytest.fixture
def game_id():
	db = get_db()
	return

@pytest.fixture
def test_id():
	db = get_db()
	return

@pytest.fixture
def gyro_desc():
	db = get_db()
	return

@pytest.fixture
def gyro_x():
	db = get_db()
	return

@pytest.fixture
def gyro_y():
	db = get_db()
	return

@pytest.fixture
def gyro_z():
	db = get_db()
	return

@pytest.fixture
def accel_desc():
	db = get_db()
	return

@pytest.fixture
def accel_x():
	db = get_db()
	return

@pytest.fixture
def accel_y():
	db = get_db()
	return

@pytest.fixture
def accel_z():
	db = get_db()
	return

@pytest.fixture
def heart_rate():
	db = get_db()
	return

@pytest.fixture
def blood_pressure():
	db = get_db()
	return

@pytest.fixture
def game_id():
	db = get_db()
	return

@pytest.fixture
def game_desc():
	db = get_db()
	return

@pytest.fixture
def game_score():
	db = get_db()
	return

@pytest.fixture
def time_played():
	db = get_db()
	return

@pytest.fixture
def test_id():
	db = get_db()
	return

@pytest.fixture
def test_desc():
	db = get_db()
	return

@pytest.fixture
def test_score():
	db = get_db()
	return

@pytest.fixture
def start_time():
	db = get_db()
	return

@pytest.fixture
def end_time():
	db = get_db()
	return