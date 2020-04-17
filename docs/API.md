# Database API
API that handles the interfacing of data and the postgresql database server

### get_db(db_name='engine_db')
    """Get the DB engine

    Returns:
        slqalchemy.engine
    """

### find_gyro_by_id(db, id)
    """find one row in the gyros table that matches the given primary key id

    Args:
        db (slqalchemy.engine): the database engine
        id (str(uuid)): unique id for row, same as the primary key

    Returns:
        result(dict): Dict with column names as keys. If no row,
            an empty list is returned.
    """

### find_accel_by_id(db, id)
    """find one row in the accels table that matches the given primary key id

    Args:
        db (slqalchemy.engine): the database engine
        id (str(uuid)): unique id for row, same as the primary key

    Returns:
        result(dict): Dict with column names as keys. If no row,
            an empty list is returned.
    """

### find_biometric_by_id(db, id)
    """find one row in the biometric table that matches the given primary key id

    Args:
        db (slqalchemy.engine): the database engine
        id (str(uuid)): unique id for row, same as the primary key

    Returns:
        result(dict): Dict with column names as keys. If no row,
            an empty list is returned.
    """

### find_game_by_id(db, id)
    """find one row in the game table that matches the given primary key id

    Args:
        db (slqalchemy.engine): the database engine
        id (str(uuid)): unique id for row, same as the primary key

    Returns:
        result(dict): Dict with column names as keys. If no row,
            an empty list is returned.
    """

### find_test_by_id(db, id)
    """find one row in the test table that matches the given primary key id

    Args:
        db (slqalchemy.engine): the database engine
        _id (str(uuid)): unique id for row, same as the primary key

    Returns:
        result(dict): Dict with column names as keys. If no row,
            an empty list is returned.
    """

### find_emotion_by_id(db, id)
    """find one row in the emotion table that matches the given primary key id

    Args:
        db (slqalchemy.engine): the database engine
        _id (uuid): unique id for row, same as the primary key

    Returns:
        result(dict): Dict with column names as keys. If no row,
            an empty list is returned.
    """

### find_medication_by_id(db, id)
    """find one row in the medication table that matches the given primary key id

    Args:
        db (slqalchemy.engine): the database engine
        _id (uuid): unique id for row, same as the primary key

    Returns:
        result(dict): Dict with column names as keys. If no row,
            an empty list is returned.
    """

### find_all_gyros(db)
    """find all rows in the gyros table

    Args:
        db (slqalchemy.engine): the database engine

    Returns:
        list(dicts) | []: Dicts with column names as keys. If no rows,
            an empty list is returned.
    """

### find_all_accels(db)
    """find all rows in the accels table

    Args:
        db (slqalchemy.engine): the database engine

    Returns:
        list(dicts) | []: Dicts with column names as keys. If no rows,
            an empty list is returned.
    """

### find_all_biometric(db)
    """find all rows in the biometric table

    Args:
        db (slqalchemy.engine): the database engine

    Returns:
        list(dicts) | []: Dicts with column names as keys. If no rows,
            an empty list is returned.
    """

### find_all_game(db)
    """find all rows in the game table

    Args:
        db (slqalchemy.engine): the database engine

    Returns:
        list(dicts) | []: Dicts with column names as keys. If no rows,
            an empty list is returned.
    """

### find_all_test(db)
    """find all rows in the test table

    Args:
        db (slqalchemy.engine): the database engine

    Returns:
        list(dicts) | []: Dicts with column names as keys. If no rows,
            an empty list is returned.
    """

### find_all_emotion(db)
    """find all rows in the emotion table

    Args:
        db (slqalchemy.engine): the database engine

    Returns:
        list(dicts) | []: Dicts with column names as keys. If no rows,
            an empty list is returned.
    """

### find_all_personal_check_in(db)
    """find all rows in the personal_check_in table

    Args:
        db (slqalchemy.engine): the database engine

    Returns:
        list(dicts) | []: Dicts with column names as keys. If no rows,
            an empty list is returned.
    """

### find_all_medication(db)
    """find all rows in the medication table

    Args:
        db (slqalchemy.engine): the database engine

    Returns:
        list(dicts) | []: Dicts with column names as keys. If no rows,
            an empty list is returned.
    """

### insert_gyro(db, gyro_id, description, patient_id, x, y, z)
    """insert row into the gyros table

    Args:
        db (slqalchemy.engine): the database engine
        all table columns (see schema for info)

    Returns:
            true on success, false on failure
    """

### insert_accel(db, accel_id, description, patient_id, x, y, z)
    """insert row into the accels table

    Args:
        db (slqalchemy.engine): the database engine
        all table columns (see schema for info)

    Returns:
            true on success, false on failure
    """

### insert_biometric(db, patient_id, heart_rate, sbp, dbp)
    """insert row into the biometric table

    Args:
        db (slqalchemy.engine): the database engine
        all table columns (see schema for info)

    Returns:
            true on success, false on failure
    """

### insert_game(db, game_id, description, patient_id, left_hand_score, right_hand_score, time_played)
    """insert row into the game table

    Args:
        db (slqalchemy.engine): the database engine
        all table columns (see schema for info)

    Returns:
            true on success, false on failure
    """

### insert_test(db, test_id, description, patient_id, test_score)
    """insert row into the test table

    Args:
        db (slqalchemy.engine): the database engine
        all table columns (see schema for info)

    Returns:
            true on success, false on failure
    """

### insert_emotion(db, patient_id, dominant_emotion, neutral, anger, happiness, surprise, sadness)
    """insert row into the emotion table

    Args:
        db (slqalchemy.engine): the database engine
        all table columns

    Returns:
            true on success, false on failure
    """

### insert_personal_check_in(db, patient_id, category, value)
    """insert row into the personal_check_in table

    Args:
        db (slqalchemy.engine): the database engine
        all table columns

    Returns:
            true on success, false on failure
    """

### insert_medication(id, patient_id, device_id, scheduled_time, response)
    """insert row into the medication table

    Args:
        db (slqalchemy.engine): the database engine
        all table columns

    Returns:
            true on success, false on failure
    """

### insert_many_gyros(db, rows)
    """insert many rows into the gyros table

    Args:
        db (slqalchemy.engine): the database engine
        rows list(dicts): a list of dictionaries, each dictionary represents a row.

    Returns:
            true on success, false on failure
    """

### insert_many_accels(db, rows)
    """insert many rows into the accel table

    Args:
        db (slqalchemy.engine): the database engine
        rows list(dicts): a list of dictionaries, each dictionary represents a row.

    Returns:
            true on success, false on failure
    """

### insert_many_biometrics(db, rows)
    """insert many rows into the biometric table

    Args:
        db (slqalchemy.engine): the database engine
        rows list(dicts): a list of dictionaries, each dictionary represents a row.

    Returns:
            true on success, false on failure
    """

### insert_many_games(db, rows)
    """insert many rows into the game table

    Args:
        db (slqalchemy.engine): the database engine
        rows list(dicts): a list of dictionaries, each dictionary represents a row.

    Returns:
            true on success, false on failure
    """

### insert_many_tests(db, rows)
    """insert many rows into the test table

    Args:
        db (slqalchemy.engine): the database engine
        rows list(dicts): a list of dictionaries, each dictionary represents a row.

    Returns:
            true on success, false on failure
    """

### insert_many_emotions(db, rows)
    """insert many rows into the emotion table

    Args:
        db (slqalchemy.engine): the database engine
        rows list(dicts): a list of dictionaries, each dictionary represents a row.

    Returns:
            true on success, false on failure
    """

### insert_many_personal_check_ins(db, rows)
    """insert many rows into the personal_check_in table

    Args:
        db (slqalchemy.engine): the database engine
        rows list(dicts): a list of dictionaries, each dictionary represents a row.

    Returns:
            true on success, false on failure
    """

### insert_many_medications(db, rows)
    """insert many rows into the medication table

    Args:
        db (slqalchemy.engine): the database engine
        rows list(dicts): a list of dictionaries, each dictionary represents a row.

    Returns:
            true on success, false on failure
    """

### find_gyro_by_patient_id(db, patient_id)
    """find all rows in the gyros table that matches the given patient_id

    Args:
        db (slqalchemy.engine): the database engine
        patient_id (str(uuid)): id for patient

    Returns:
        list(dicts) | []: Dicts with column names as keys. If no rows,
            an empty list is returned.
    """

### find_accels_by_patient_id(db, patient_id)
    """find all rows in the accels table that matches the given patient_id

    Args:
        db (slqalchemy.engine): the database engine
        patient_id (str(uuid)): id for patient

    Returns:
        list(dicts) | []: Dicts with column names as keys. If no rows,
            an empty list is returned.
    """

### find_biometric_by_patient_id(db, patient_id)
    """find all rows in the biometric table that matches the given patient_id

    Args:
        db (slqalchemy.engine): the database engine
        patient_id (str(uuid)): id for patient

    Returns:
        list(dicts) | []: Dicts with column names as keys. If no rows,
            an empty list is returned.
    """

### find_game_by_patient_id(db, patient_id)
    """find all rows in the game table that matches the given patient_id

    Args:
        db (slqalchemy.engine): the database engine
        patient_id (str(uuid)): id for patient

    Returns:
        list(dicts) | []: Dicts with column names as keys. If no rows,
            an empty list is returned.
    """

### find_test_by_patient_id(db, patient_id)
    """find all rows in the test table that matches the given patient_id

    Args:
        db (slqalchemy.engine): the database engine
        patient_id (str(uuid)): id for patient

    Returns:
        list(dicts) | []: Dicts with column names as keys. If no rows,
            an empty list is returned.
    """

### find_emotion_by_patient_id(db, patient_id)
    """find all rows in the emotion table that matches the given patient_id

    Args:
        db (slqalchemy.engine): the database engine
        patient_id (uuid): id for patient

    Returns:
        list(dicts) | []: Dicts with column names as keys. If no rows,
            an empty list is returned.
    """

### find_personal_check_in_by_patient_id_and_category(db, patient_id, category)
    """find all rows in the personal_check_in table that matches the given patient_id and category

    Args:
        db (slqalchemy.engine): the database engine
        patient_id (str(uuid)): id for patient
        category (str): string representing a category (i.e. "sports")

    Returns:
        list(dicts) | []: Dicts with column names as keys. If no rows,
            an empty list is returned.
    """

### find_medication_by_patient_id(db, patient_id)
    """find all rows in the medication table that matches the given patient_id

    Args:
        db (slqalchemy.engine): the database engine
        patient_id (uuid): id for patient

    Returns:
        list(dicts) | []: Dicts with column names as keys. If no rows,
            an empty list is returned.
    """

### find_medication_by_device_id(db, device_id)
    """find all rows in the medication table that matches the given device_id

    Args:
        db (slqalchemy.engine): the database engine
        patient_id (uuid): id for patient

    Returns:
        list(dicts) | []: Dicts with column names as keys. If no rows,
            an empty list is returned.
    """

### find_by_gyro_id(db, gyro_id)
    """find all rows in a given table that match the given gyro_id

    Args:
        db (slqalchemy.engine): the database engine
        gyro_id (str(uuid)): id of the given gyroscope

    Returns:
        list(dicts) | []: Dicts with column names as keys. If no rows,
            an empty list is returned.
    """

### find_by_accel_id(db, accel_id)
    """find all rows in a given table that match the given accel_id

    Args:
        db (slqalchemy.engine): the database engine
        accel_id (str(uuid)): id of the given accelerometer

    Returns:
        list(dicts) | []: Dicts with column names as keys. If no rows,
            an empty list is returned.
    """

### find_by_game_id(db, game_id)
    """find all rows in a given table that match the given game_id

    Args:
        db (slqalchemy.engine): the database engine
        game_id (str(uuid)): id of the given game

    Returns:
        list(dicts) | []: Dicts with column names as keys. If no rows,
            an empty list is returned.
    """

### find_by_test_id(db, test_id)
    """find all rows in a given table that match the given test_id

    Args:
        db (slqalchemy.engine): the database engine
        test_id (str(uuid)): id of the given test

    Returns:
        list(dicts) | []: Dicts with column names as keys. If no rows,
            an empty list is returned.
    """

### find_by_dominant_emotion(db, dominant_emotion)
    """find all rows in the emotion table that match the given dominant_emotion

    Args:
        db (slqalchemy.engine): the database engine
        dominant_emotion (string): dominant emotion

    Returns:
        list(dicts) | []: Dicts with column names as keys. If no rows,
            an empty list is returned.
    """

### query_gyros_by_time(db, start_time, end_time)
    """find all rows in gyros table that where recorded between a given start and end time

    Args:
        db (slqalchemy.engine): the database engine
        start_time (timestamp)
        end_time (timestamp)

    Returns:
        list(dicts) | []: Dicts with column names as keys. If no rows,
            an empty list is returned.
    """

### query_accels_by_time(db, start_time, end_time)
    """find all rows in accels table that where recorded between a given start and end time

    Args:
        db (slqalchemy.engine): the database engine
        start_time (timestamp)
        end_time (timestamp)

    Returns:
        list(dicts) | []: Dicts with column names as keys. If no rows,
            an empty list is returned.
    """

### query_biometric_by_time(db, start_time, end_time)
    """find all rows in biometric table that where recorded between a given start and end time

    Args:
        db (slqalchemy.engine): the database engine
        start_time (timestamp)
        end_time (timestamp)

    Returns:
        list(dicts) | []: Dicts with column names as keys. If no rows,
            an empty list is returned.
    """

### query_game_by_time(db, start_time, end_time)
    """find all rows in game table that where recorded between a given start and end time

    Args:
        db (slqalchemy.engine): the database engine
        start_time (timestamp)
        end_time (timestamp)

    Returns:
        list(dicts) | []: Dicts with column names as keys. If no rows,
            an empty list is returned.
    """

### query_test_by_time(db, start_time, end_time)
    """find all rows in test table that where recorded between a given start and end time

    Args:
        db (slqalchemy.engine): the database engine
        start_time (timestamp)
        end_time (timestamp)

    Returns:
        list(dicts) | []: Dicts with column names as keys. If no rows,
            an empty list is returned.
    """

### query_emotion_by_time(db, start_time, end_time)
    """find all rows in emotion table that where recorded between a given start and end time

    Args:
        db (slqalchemy.engine): the database engine
        start_time (timestamp)
        end_time (timestamp)

    Returns:
        list(dicts) | []: Dicts with column names as keys. If no rows,
            an empty list is returned.
    """

### query_personal_check_in_by_time(db, start_time, end_time)
    """find all rows in personal_check_in table that where recorded between a given start and end time

    Args:
        db (slqalchemy.engine): the database engine
        start_time (timestamp)
        end_time (timestamp)

    Returns:
        list(dicts) | []: Dicts with column names as keys. If no rows,
            an empty list is returned.
    """

### query_medication_by_time(db, start_time, end_time)
    """find all rows in medication table that where recorded between a given start and end time

    Args:
        db (slqalchemy.engine): the database engine
        start_time (timestamp)
        end_time (timestamp)

    Returns:
        list(dicts) | []: Dicts with column names as keys. If no rows,
            an empty list is returned.
    """

## Find one functions are mainly for testing purposes, they are not optimized for performance, but can still be used in production

### find_one_gyro(db)
    """find one random row in the gyros table

    Args:
        db (slqalchemy.engine): the database engine

    Returns:
        result(dict): Dict with column names as keys. If no row,
            an empty dict is returned.
    """

### find_one_accel(db)
    """find one random row in the accels table

    Args:
        db (slqalchemy.engine): the database engine

    Returns:
        result(dict): Dict with column names as keys. If no row,
            an empty dict is returned.
    """

### find_one_biometric(db)
    """find one random row in the biometric table

    Args:
        db (slqalchemy.engine): the database engine

    Returns:
        result(dict): Dict with column names as keys. If no row,
            an empty dict is returned.
    """

### find_one_game(db)
    """find one random row in the game table

    Args:
        db (slqalchemy.engine): the database engine

    Returns:
        result(dict): Dict with column names as keys. If no row,
            an empty dict is returned.
    """

### find_one_test(db)
    """find one random row in the test table

    Args:
        db (slqalchemy.engine): the database engine

    Returns:
        result(dict): Dict with column names as keys. If no row,
            an empty dict is returned.
    """

### def find_one_emotion(db)
    """find one random row in the emotion table

    Args:
        db (slqalchemy.engine): the database engine

    Returns:
        result(dict): Dict with column names as keys. If no row,
            an empty dict is returned.
    """

### find_one_personal_check_in(db)
    """find one random row in the personal_check_in table

    Args:
        db (slqalchemy.engine): the database engine

    Returns:
        result(dict): Dict with column names as keys. If no row,
            an empty dict is returned.
    """

### def find_one_medication(db)
    """find one random row in the medication table

    Args:
        db (slqalchemy.engine): the database engine

    Returns:
        result(dict): Dict with column names as keys. If no row,
            an empty dict is returned.
    """