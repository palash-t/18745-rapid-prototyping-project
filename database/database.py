#!/usr/bin/env python

# author: Sam Nelson (samueljn)

###############################################
### API for interacting with RPCS DB Server ###
### ------------- DO NOT EDIT ------------- ###
###############################################

import os
import logging

from sqlalchemy import create_engine

from logger import setup_logging

USERNAME = os.getenv('postgres', 'postgres')
PASSWORD = os.getenv('admin', 'admin')
DB_NAME = os.getenv('engine_db', 'engine_db')
DB_HOST = os.getenv('localhost', 'localhost')
DB_PORT = os.getenv('5432', '5432')


def get_db(db_name='engine_db'):
    """Get the DB engine

    Returns:
        slqalchemy.engine
    """
    database_uri = 'postgresql+psycopg2://{}:{}@{}:{}/{}'.format(USERNAME,
                                                                 PASSWORD,
                                                                 DB_HOST,
                                                                 DB_PORT,
                                                                 db_name)
    setup_logging()
    logger = logging.getLogger(__name__)
    logger.info('Connecting to  postgresql+psycopg2://%s:*****@%s:%s/%s',
                USERNAME, DB_HOST, DB_PORT, db_name)

    engine = create_engine(database_uri)
    return engine


def validate_db(database, *db_names):
    if database.url.database not in db_names:
        logger = logging.getLogger(__name__)
        error_msg = 'Not connected to one of "{}"'.format(db_names)
        logger.error(error_msg)
        raise ValueError(error_msg)


def rows_to_dicts(rows):
    """Convert a row object to a list of dicts

    Args:
        rows (sqlalchemy.ResultProxy): Result from sqlalchemy query

    Returns:
        list(dicts) | []: Dicts with column names as keys. If no rows,
            an empty list is returned.
    """
    dict_rows = []
    for row in rows:
        dict_rows.append(dict(row))
    return dict_rows


def find_gyro_by_id(db, _id):
    """find one row in the gyros table that matches the given id

    Args:
        db (slqalchemy.engine): the database engine
        _id (uuid): unique id for row

    Returns:
        result(dict): Dict with column names as keys. If no row,
            an empty dict is returned.
    """
    logger = logging.getLogger(__name__)

    validate_db(db, 'engine_db')

    logger.info("Fetching one row from gyros table")

    query = '''
         SELECT *
           FROM gyros
          WHERE id = %s;
    '''
    data = (_id)

    try:
        result = db.execute(query, data)
    except Exception as ex:
        logger.error("Failed to execute query")
        raise ex

    return result

def find_accels_by_id(db, _id):
    """find one row in the accels table that matches the given id

    Args:
        db (slqalchemy.engine): the database engine
        _id (uuid): unique id for row

    Returns:
        result(dict): Dict with column names as keys. If no row,
            an empty dict is returned.
    """
    logger = logging.getLogger(__name__)

    validate_db(db, 'engine_db')

    logger.info("Fetching one row from accels table")

    query = '''
         SELECT *
           FROM accels
          WHERE id = %s;
    '''
    data = (_id)

    try:
        result = db.execute(query, data)
    except Exception as ex:
        logger.error("Failed to execute query")
        raise ex

    return result

def find_biometric_by_id(db, _id):
    """find one row in the biometric table that matches the given id

    Args:
        db (slqalchemy.engine): the database engine
        _id (uuid): unique id for row

    Returns:
        result(dict): Dict with column names as keys. If no row,
            an empty dict is returned.
    """
    logger = logging.getLogger(__name__)

    validate_db(db, 'engine_db')

    logger.info("Fetching one row from biometric table")

    query = '''
         SELECT *
           FROM biometric
          WHERE id = %s;
    '''
    data = (_id)

    try:
        result = db.execute(query, data)
    except Exception as ex:
        logger.error("Failed to execute query")
        raise ex

    return result

def find_game_by_id(db, _id):
    """find one row in the game table that matches the given id

    Args:
        db (slqalchemy.engine): the database engine
        _id (uuid): unique id for row

    Returns:
        result(dict): Dict with column names as keys. If no row,
            an empty dict is returned.
    """
    logger = logging.getLogger(__name__)

    validate_db(db, 'engine_db')

    logger.info("Fetching one row from game table")

    query = '''
         SELECT *
           FROM game
          WHERE id = %s;
    '''
    data = (_id)

    try:
        result = db.execute(query, data)
    except Exception as ex:
        logger.error("Failed to execute query")
        raise ex

    return result

def find_test_by_id(db, _id):
    """find one row in the test table that matches the given id

    Args:
        db (slqalchemy.engine): the database engine
        _id (uuid): unique id for row

    Returns:
        result(dict): Dict with column names as keys. If no row,
            an empty dict is returned.
    """
    logger = logging.getLogger(__name__)

    validate_db(db, 'engine_db')

    logger.info("Fetching one row from test table")

    query = '''
         SELECT *
           FROM test
          WHERE id = %s;
    '''
    data = (_id)

    try:
        result = db.execute(query, data)
    except Exception as ex:
        logger.error("Failed to execute query")
        raise ex
    return result

def find_all_gyros(db):
    """find all rows in the gyros table

    Args:
        db (slqalchemy.engine): the database engine

    Returns:
        list(dicts) | []: Dicts with column names as keys. If no rows,
            an empty list is returned.
    """
    logger = logging.getLogger(__name__)
    validate_db(db, 'engine_db')
    logger.info("Fetching all rows from gyros table")
    query = '''
         SELECT *
           FROM gyros;
    '''
    try:
        result = db.execute(query)
    except Exception as ex:
        logger.error("Failed to execute query")
        raise ex
    dicts = rows_to_dicts(result)
    return dicts

def find_all_accels(db):
    """find all rows in the accels table

    Args:
        db (slqalchemy.engine): the database engine

    Returns:
        list(dicts) | []: Dicts with column names as keys. If no rows,
            an empty list is returned.
    """
    logger = logging.getLogger(__name__)
    validate_db(db, 'engine_db')
    logger.info("Fetching all rows from accels table")
    query = '''
         SELECT *
           FROM accels;
    '''
    try:
        result = db.execute(query)
    except Exception as ex:
        logger.error("Failed to execute query")
        raise ex
    dicts = rows_to_dicts(result)
    return dicts

def find_all_biometric(db):
    """find all rows in the biometric table

    Args:
        db (slqalchemy.engine): the database engine

    Returns:
        list(dicts) | []: Dicts with column names as keys. If no rows,
            an empty list is returned.
    """
    logger = logging.getLogger(__name__)
    validate_db(db, 'engine_db')
    logger.info("Fetching all rows from biometric table")
    query = '''
         SELECT *
           FROM biometric;
    '''
    try:
        result = db.execute(query)
    except Exception as ex:
        logger.error("Failed to execute query")
        raise ex
    dicts = rows_to_dicts(result)
    return dicts

def find_all_game(db):
    """find all rows in the game table

    Args:
        db (slqalchemy.engine): the database engine

    Returns:
        list(dicts) | []: Dicts with column names as keys. If no rows,
            an empty list is returned.
    """
    logger = logging.getLogger(__name__)
    validate_db(db, 'engine_db')
    logger.info("Fetching all rows from game table")
    query = '''
         SELECT *
           FROM game;
    '''
    try:
        result = db.execute(query)
    except Exception as ex:
        logger.error("Failed to execute query")
        raise ex
    dicts = rows_to_dicts(result)
    return dicts

def find_all_test(db):
    """find all rows in the test table

    Args:
        db (slqalchemy.engine): the database engine

    Returns:
        list(dicts) | []: Dicts with column names as keys. If no rows,
            an empty list is returned.
    """
    logger = logging.getLogger(__name__)
    validate_db(db, 'engine_db')
    logger.info("Fetching all rows from test table")
    query = '''
         SELECT *
           FROM test;
    '''
    try:
        result = db.execute(query)
    except Exception as ex:
        logger.error("Failed to execute query")
        raise ex
    dicts = rows_to_dicts(result)
    return dicts

def insert_gyro(db, gyro_id, description, patient_id, x, y, z):
    """insert row into the gyros table

    Args:
        db (slqalchemy.engine): the database engine
        all table columns

    Returns:
            true on success, false on failure
    """
    logger = logging.getLogger(__name__)

    validate_db(db, 'engine_db')

    logger.info("Inserting row into gyros table")

    query = '''
         INSERT INTO gyros (gyro_id, description, patient_id, x, y, z)
           VALUES (%s, %s, %s, %s, %s, %s);
    '''
    data = (gyro_id, description, patient_id, x, y, z)

    try:
        db.execute(query, data)
    except Exception as ex:
        logger.error("Failed to execute insert query for gyros table")
        raise ex
        return False

    return True

def insert_accel(db, accel_id, description, patient_id, x, y, z):
    """insert row into the accels table

    Args:
        db (slqalchemy.engine): the database engine
        all table columns

    Returns:
            true on success, false on failure
    """
    logger = logging.getLogger(__name__)

    validate_db(db, 'engine_db')

    logger.info("Inserting row into accels table")

    query = '''
         INSERT INTO accels (accel_id, description, patient_id, x, y, z)
           VALUES (%s, %s, %s, %s, %s, %s);
    '''
    data = (accel_id, description, patient_id, x, y, z)

    try:
        db.execute(query, data)
    except Exception as ex:
        logger.error("Failed to execute insert query for accels table")
        raise ex
        return False

    return True

def insert_biometric(db, patient_id, heart_rate, blood_pressure):
    """insert row into the biometric table

    Args:
        db (slqalchemy.engine): the database engine
        all table columns

    Returns:
            true on success, false on failure
    """
    logger = logging.getLogger(__name__)

    validate_db(db, 'engine_db')

    logger.info("Inserting row into biometric table")

    query = '''
         INSERT INTO biometric (patient_id, heart_rate, blood_pressure)
           VALUES (%s, %s, %s);
    '''
    data = (patient_id, heart_rate, blood_pressure)

    try:
        db.execute(query, data)
    except Exception as ex:
        logger.error("Failed to execute insert query for biometric table")
        raise ex
        return False

    return True

def insert_game(db, game_id, description, patient_id, game_score, time_played):
    """insert row into the game table

    Args:
        db (slqalchemy.engine): the database engine
        all table columns

    Returns:
            true on success, false on failure
    """
    logger = logging.getLogger(__name__)

    validate_db(db, 'engine_db')

    logger.info("Inserting row into game table")

    query = '''
         INSERT INTO accels (game_id, description, patient_id, game_score, time_played)
           VALUES (%s, %s, %s, %s, %s);
    '''
    data = (game_id, description, patient_id, game_score, time_played)

    try:
        db.execute(query, data)
    except Exception as ex:
        logger.error("Failed to execute insert query for game table")
        raise ex
        return False

    return True

def insert_test(db, test_id, description, patient_id, test_score):
    """insert row into the test table

    Args:
        db (slqalchemy.engine): the database engine
        all table columns

    Returns:
            true on success, false on failure
    """
    logger = logging.getLogger(__name__)

    validate_db(db, 'engine_db')

    logger.info("Inserting row into test table")

    query = '''
         INSERT INTO accels (test_id, description, patient_id, test_score)
           VALUES (%s, %s, %s, %s);
    '''
    data = (test_id, description, patient_id, test_score)

    try:
        db.execute(query, data)
    except Exception as ex:
        logger.error("Failed to execute insert query for test table")
        raise ex
        return False

    return True

def find_gyro_by_patient_id(db, patient_id):
    """find all rows in the gyros table that matches the given patient_id

    Args:
        db (slqalchemy.engine): the database engine
        patient_id (uuid): id for patient

    Returns:
        list(dicts) | []: Dicts with column names as keys. If no rows,
            an empty list is returned.
    """
    logger = logging.getLogger(__name__)

    validate_db(db, 'engine_db')

    logger.info("Fetching rows from the gyros table by patient_id")

    query = '''
         SELECT *
           FROM gyros
          WHERE patient_id = %s;
    '''
    data = (patient_id)

    try:
        result = db.execute(query, data)
    except Exception as ex:
        logger.error("Failed to execute query")
        raise ex

    dicts = rows_to_dicts(result) 
    return dicts

def find_accels_by_patient_id(db, patient_id):
    """find all rows in the accels table that matches the given patient_id

    Args:
        db (slqalchemy.engine): the database engine
        patient_id (uuid): id for patient

    Returns:
        list(dicts) | []: Dicts with column names as keys. If no rows,
            an empty list is returned.
    """
    logger = logging.getLogger(__name__)

    validate_db(db, 'engine_db')

    logger.info("Fetching rows from the accels table by patient_id")

    query = '''
         SELECT *
           FROM accels
          WHERE patient_id = %s;
    '''
    data = (patient_id)

    try:
        result = db.execute(query, data)
    except Exception as ex:
        logger.error("Failed to execute query")
        raise ex

    dicts = rows_to_dicts(result) 
    return dicts

def find_biometric_by_patient_id(db, patient_id):
    """find all rows in the biometric table that matches the given patient_id

    Args:
        db (slqalchemy.engine): the database engine
        patient_id (uuid): id for patient

    Returns:
        list(dicts) | []: Dicts with column names as keys. If no rows,
            an empty list is returned.
    """
    logger = logging.getLogger(__name__)

    validate_db(db, 'engine_db')

    logger.info("Fetching rows from the biometric table by patient_id")

    query = '''
         SELECT *
           FROM biometric
          WHERE patient_id = %s;
    '''
    data = (patient_id)

    try:
        result = db.execute(query, data)
    except Exception as ex:
        logger.error("Failed to execute query")
        raise ex

    dicts = rows_to_dicts(result) 
    return dicts

def find_game_by_patient_id(db, patient_id):
    """find all rows in the game table that matches the given patient_id

    Args:
        db (slqalchemy.engine): the database engine
        patient_id (uuid): id for patient

    Returns:
        list(dicts) | []: Dicts with column names as keys. If no rows,
            an empty list is returned.
    """
    logger = logging.getLogger(__name__)

    validate_db(db, 'engine_db')

    logger.info("Fetching rows from the game table by patient_id")

    query = '''
         SELECT *
           FROM game
          WHERE patient_id = %s;
    '''
    data = (patient_id)

    try:
        result = db.execute(query, data)
    except Exception as ex:
        logger.error("Failed to execute query")
        raise ex

    dicts = rows_to_dicts(result) 
    return dicts

def find_test_by_patient_id(db, patient_id):
    """find all rows in the test table that matches the given patient_id

    Args:
        db (slqalchemy.engine): the database engine
        patient_id (uuid): id for patient

    Returns:
        list(dicts) | []: Dicts with column names as keys. If no rows,
            an empty list is returned.
    """
    logger = logging.getLogger(__name__)

    validate_db(db, 'engine_db')

    logger.info("Fetching rows from the test table by patient_id")

    query = '''
         SELECT *
           FROM test
          WHERE patient_id = %s;
    '''
    data = (patient_id)

    try:
        result = db.execute(query, data)
    except Exception as ex:
        logger.error("Failed to execute query")
        raise ex

    dicts = rows_to_dicts(result) 
    return dicts

def find_by_gyro_id(db, gyro_id):
    """find all rows in a given table that match the given gyro_id

    Args:
        db (slqalchemy.engine): the database engine
        gyro_id (uuid): id of the given gyroscope

    Returns:
        list(dicts) | []: Dicts with column names as keys. If no rows,
            an empty list is returned.
    """
    logger = logging.getLogger(__name__)

    validate_db(db, 'engine_db')

    logger.info("Fetching rows from gyros table by gryo_id")

    query = '''
         SELECT *
           FROM gyros
          WHERE gyro_id = %s;
    '''
    data = (gyro_id)

    try:
        result = db.execute(query, data)
    except Exception as ex:
        logger.error("Failed to execute query")
        raise ex

    dicts = rows_to_dicts(result) 
    return dicts

def find_by_accel_id(db, accel_id):
    """find all rows in a given table that match the given accel_id

    Args:
        db (slqalchemy.engine): the database engine
        accel_id (uuid): id of the given accelerometer

    Returns:
        list(dicts) | []: Dicts with column names as keys. If no rows,
            an empty list is returned.
    """
    logger = logging.getLogger(__name__)

    validate_db(db, 'engine_db')

    logger.info("Fetching rows from accels table by accel_id")

    query = '''
         SELECT *
           FROM accels
          WHERE accel_id = %s;
    '''
    data = (accel_id)

    try:
        result = db.execute(query, data)
    except Exception as ex:
        logger.error("Failed to execute query")
        raise ex

    dicts = rows_to_dicts(result) 
    return dicts

def find_by_game_id(db, game_id):
    """find all rows in a given table that match the given game_id

    Args:
        db (slqalchemy.engine): the database engine
        game_id (uuid): id of the given game

    Returns:
        list(dicts) | []: Dicts with column names as keys. If no rows,
            an empty list is returned.
    """
    logger = logging.getLogger(__name__)

    validate_db(db, 'engine_db')

    logger.info("Fetching rows from game table by game_id")

    query = '''
         SELECT *
           FROM game
          WHERE game_id = %s;
    '''
    data = (game_id)

    try:
        result = db.execute(query, data)
    except Exception as ex:
        logger.error("Failed to execute query")
        raise ex

    dicts = rows_to_dicts(result) 
    return dicts

def find_by_test_id(db, test_id):
    """find all rows in a given table that match the given test_id

    Args:
        db (slqalchemy.engine): the database engine
        test_id (uuid): id of the given test

    Returns:
        list(dicts) | []: Dicts with column names as keys. If no rows,
            an empty list is returned.
    """
    logger = logging.getLogger(__name__)

    validate_db(db, 'engine_db')

    logger.info("Fetching rows from test table by test_id")

    query = '''
         SELECT *
           FROM test
          WHERE test_id = %s;
    '''
    data = (test_id)

    try:
        result = db.execute(query, data)
    except Exception as ex:
        logger.error("Failed to execute query")
        raise ex

    dicts = rows_to_dicts(result) 
    return dicts

def query_gyros_by_time(db, start_time, end_time):
    """find all rows in gyros table that where recorded between a given start and end time

    Args:
        db (slqalchemy.engine): the database engine
        start_time (timestamp)
        end_time (timestamp)

    Returns:
        list(dicts) | []: Dicts with column names as keys. If no rows,
            an empty list is returned.
    """
    logger = logging.getLogger(__name__)

    validate_db(db, 'engine_db')

    logger.info("Fetching rows from gyros table by time")

    query = '''
         SELECT *
           FROM gyros
          WHERE created_at BETWEEN %s AND %s;
    '''
    data = (start_time, end_time)

    try:
        result = db.execute(query, data)
    except Exception as ex:
        logger.error("Failed to execute query")
        raise ex

    dicts = rows_to_dicts(result) 
    return dicts

def query_accels_by_time(db, start_time, end_time):
    """find all rows in accels table that where recorded between a given start and end time

    Args:
        db (slqalchemy.engine): the database engine
        start_time (timestamp)
        end_time (timestamp)

    Returns:
        list(dicts) | []: Dicts with column names as keys. If no rows,
            an empty list is returned.
    """
    logger = logging.getLogger(__name__)

    validate_db(db, 'engine_db')

    logger.info("Fetching rows from accels table by time")

    query = '''
         SELECT *
           FROM accels
          WHERE created_at BETWEEN %s AND %s;
    '''
    data = (start_time, end_time)

    try:
        result = db.execute(query, data)
    except Exception as ex:
        logger.error("Failed to execute query")
        raise ex

    dicts = rows_to_dicts(result) 
    return dicts

def query_biometric_by_time(db, start_time, end_time):
    """find all rows in biometric table that where recorded between a given start and end time

    Args:
        db (slqalchemy.engine): the database engine
        start_time (timestamp)
        end_time (timestamp)

    Returns:
        list(dicts) | []: Dicts with column names as keys. If no rows,
            an empty list is returned.
    """
    logger = logging.getLogger(__name__)

    validate_db(db, 'engine_db')

    logger.info("Fetching rows from biometric table by time")

    query = '''
         SELECT *
           FROM biometric
          WHERE created_at BETWEEN %s AND %s;
    '''
    data = (start_time, end_time)

    try:
        result = db.execute(query, data)
    except Exception as ex:
        logger.error("Failed to execute query")
        raise ex

    dicts = rows_to_dicts(result) 
    return dicts

def query_game_by_time(db, start_time, end_time):
    """find all rows in game table that where recorded between a given start and end time

    Args:
        db (slqalchemy.engine): the database engine
        start_time (timestamp)
        end_time (timestamp)

    Returns:
        list(dicts) | []: Dicts with column names as keys. If no rows,
            an empty list is returned.
    """
    logger = logging.getLogger(__name__)

    validate_db(db, 'engine_db')

    logger.info("Fetching rows from game table by time")

    query = '''
         SELECT *
           FROM game
          WHERE created_at BETWEEN %s AND %s;
    '''
    data = (start_time, end_time)

    try:
        result = db.execute(query, data)
    except Exception as ex:
        logger.error("Failed to execute query")
        raise ex

    dicts = rows_to_dicts(result) 
    return dicts

def query_test_by_time(db, start_time, end_time):
    """find all rows in test table that where recorded between a given start and end time

    Args:
        db (slqalchemy.engine): the database engine
        start_time (timestamp)
        end_time (timestamp)

    Returns:
        list(dicts) | []: Dicts with column names as keys. If no rows,
            an empty list is returned.
    """
    logger = logging.getLogger(__name__)

    validate_db(db, 'engine_db')

    logger.info("Fetching rows from test table by time")

    query = '''
         SELECT *
           FROM test
          WHERE created_at BETWEEN %s AND %s;
    '''
    data = (start_time, end_time)

    try:
        result = db.execute(query, data)
    except Exception as ex:
        logger.error("Failed to execute query")
        raise ex

    dicts = rows_to_dicts(result) 
    return dicts



# # # Find one functions are mainly for testing purposes, they are not optimized for performance # # #

def find_one_gyro(db):
    """find one random row in the gyros table

    Args:
        db (slqalchemy.engine): the database engine

    Returns:
        result(dict): Dict with column names as keys. If no row,
            an empty dict is returned.
    """
    logger = logging.getLogger(__name__)
    validate_db(db, 'engine_db')
    logger.info("Fetching random row from gyros table")
    query = '''
         SELECT *
           FROM gyros;
    '''
    try:
        result = db.execute(query)
    except Exception as ex:
        logger.error("Failed to execute query")
        raise ex
    dicts = rows_to_dicts(result) 
    return dicts

def find_one_accel(db):
    """find one random row in the accels table

    Args:
        db (slqalchemy.engine): the database engine

    Returns:
        result(dict): Dict with column names as keys. If no row,
            an empty dict is returned.
    """
    logger = logging.getLogger(__name__)
    validate_db(db, 'engine_db')
    logger.info("Fetching random row from accels table")
    query = '''
         SELECT *
           FROM accels;
    '''
    try:
        result = db.execute(query)
    except Exception as ex:
        logger.error("Failed to execute query")
        raise ex
    dicts = rows_to_dicts(result) 
    return dicts

def find_one_biometric(db):
    """find one random row in the biometric table

    Args:
        db (slqalchemy.engine): the database engine

    Returns:
        result(dict): Dict with column names as keys. If no row,
            an empty dict is returned.
    """
    logger = logging.getLogger(__name__)
    validate_db(db, 'engine_db')
    logger.info("Fetching random row from biometric table")
    query = '''
         SELECT *
           FROM biometric;
    '''
    try:
        result = db.execute(query)
    except Exception as ex:
        logger.error("Failed to execute query")
        raise ex
    dicts = rows_to_dicts(result) 
    return dicts

def find_one_game(db):
    """find one random row in the game table

    Args:
        db (slqalchemy.engine): the database engine

    Returns:
        result(dict): Dict with column names as keys. If no row,
            an empty dict is returned.
    """
    logger = logging.getLogger(__name__)
    validate_db(db, 'engine_db')
    logger.info("Fetching random row from game table")
    query = '''
         SELECT *
           FROM game;
    '''
    try:
        result = db.execute(query)
    except Exception as ex:
        logger.error("Failed to execute query")
        raise ex
    dicts = rows_to_dicts(result) 
    return dicts

def find_one_test(db):
    """find one random row in the test table

    Args:
        db (slqalchemy.engine): the database engine

    Returns:
        result(dict): Dict with column names as keys. If no row,
            an empty dict is returned.
    """
    logger = logging.getLogger(__name__)
    validate_db(db, 'engine_db')
    logger.info("Fetching random row from test table")
    query = '''
         SELECT *
           FROM test;
    '''
    try:
        result = db.execute(query)
    except Exception as ex:
        logger.error("Failed to execute query")
        raise ex
    dicts = rows_to_dicts(result)
    return dicts