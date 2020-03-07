#!/usr/bin/env python

import os
import logging

from sqlalchemy import create_engine

from logger import setup_logging

USERNAME = os.getenv('POSTGRES_USER', 'postgres')
PASSWORD = os.getenv('POSTGRES_PASSWORD', 'admin')
DB_NAME = os.getenv('POSTGRES_DB', 'engine_db')
DB_HOST = os.getenv('POSTGRES_HOST', 'localhost')
DB_PORT = os.getenv('DB_PORT', '5432')


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


def find_by_id(db, _id, table):
    """find one row in a given table and db that matches the given id

    Args:
        db (slqalchemy.engine): the database engine
        _id (uuid): unique id for row
        table (string): name of table

    Returns:
        result(dict): Dict with column names as keys. If no row,
            an empty dict is returned.
    """
    logger = logging.getLogger(__name__)

    validate_db(database, 'engine_db')

    logger.info("Fetching one row from {} table".format(table))

    query = '''
         SELECT "*"
           FROM %s
          WHERE id = %s;
    '''
    data = (table, _id)

    result = db.execute(query, data)
    return result


def find_all(db, table):
    """find all rows in a given table and db

    Args:
        db (slqalchemy.engine): the database engine
        table (string): name of table

    Returns:
        list(dicts) | []: Dicts with column names as keys. If no rows,
            an empty list is returned.
    """
    logger = logging.getLogger(__name__)

    validate_db(database, 'engine_db')

    logger.info("Fetching all rows from {} table".format(table))

    query = '''
         SELECT "*"
           FROM %s;
    '''
    data = (table)

    result = db.execute(query, data)
    dicts = rows_to_dicts(result) 
    return result


#### >>>>>>>>>> TODO <<<<<<<<< ###

def insert_gyro(db, gyro_id, description, patient_id, x, y, z):
    """find all rows in a given table and db

    Args:
        db (slqalchemy.engine): the database engine
        all table columns

    Returns:
            true on success, false on failure
    """

def insert_accel(db, accel_id, description, patient_id, x, y, z):
    """find all rows in a given table and db

    Args:
        db (slqalchemy.engine): the database engine
        all table columns

    Returns:
            true on success, false on failure
    """

def insert_biometric(db, patient_id, heart_rate, blood_pressure):
    """find all rows in a given table and db

    Args:
        db (slqalchemy.engine): the database engine
        all table columns

    Returns:
            true on success, false on failure
    """

def insert_game(db, game_id, description, patient_id, game_score, time_played):
    """find all rows in a given table and db

    Args:
        db (slqalchemy.engine): the database engine
        all table columns

    Returns:
            true on success, false on failure
    """

def insert_test(db, game_id, description, patient_id, test_score):
    """find all rows in a given table and db

    Args:
        db (slqalchemy.engine): the database engine
        all table columns

    Returns:
            true on success, false on failure
    """

def find_by_patient_id(db, patient_id, table):
    """find all rows in a given table that match the given patient_id

    Args:
        db (slqalchemy.engine): the database engine
        patient_id (uuid): id of the given patient
        table (string): name of table

    Returns:
        list(dicts) | []: Dicts with column names as keys. If no rows,
            an empty list is returned.
    """

def find_by_gyro_id(db, gyro_id):
    """find all rows in a given table that match the given gyro_id

    Args:
        db (slqalchemy.engine): the database engine
        gyro_id (uuid): id of the given gyroscope

    Returns:
        list(dicts) | []: Dicts with column names as keys. If no rows,
            an empty list is returned.
    """

def find_by_accel_id(db, accel_id):
    """find all rows in a given table that match the given accel_id

    Args:
        db (slqalchemy.engine): the database engine
        accel_id (uuid): id of the given accelerometer

    Returns:
        list(dicts) | []: Dicts with column names as keys. If no rows,
            an empty list is returned.
    """

def find_by_game_id(db, game_id):
    """find all rows in a given table that match the given game_id

    Args:
        db (slqalchemy.engine): the database engine
        game_id (uuid): id of the given game

    Returns:
        list(dicts) | []: Dicts with column names as keys. If no rows,
            an empty list is returned.
    """

def find_by_test_id(db, test_id):
    """find all rows in a given table that match the given test_id

    Args:
        db (slqalchemy.engine): the database engine
        test_id (uuid): id of the given test

    Returns:
        list(dicts) | []: Dicts with column names as keys. If no rows,
            an empty list is returned.
    """

def find_by_time(db, table, start_time, end_time):
    """find all rows in a given table that where recorded between a given start and end time

    Args:
        db (slqalchemy.engine): the database engine
        tabel (string): name of the table
        start_time (timestamp)
        end_time (timestamp)

    Returns:
        list(dicts) | []: Dicts with column names as keys. If no rows,
            an empty list is returned.
    """