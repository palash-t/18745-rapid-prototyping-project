## THESE ARE FUNCTIONS THAT STILL NEED TO BE IMPLEMENTED AND TESTED

### find_personal_check_in_by_id(db, id)
    """find one row in the personal_check_in table that matches the given primary key id

    Args:
        db (slqalchemy.engine): the database engine
        _id (str(uuid)): unique id for row, same as the primary key

    Returns:
        result(dict): Dict with column names as keys. If no row,
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

### insert_personal_check_in(db, patient_id, category, value)
    """insert row into the personal_check_in table

    Args:
        db (slqalchemy.engine): the database engine
        all table columns

    Returns:
            true on success, false on failure
    """

### insert_many_personal_check_ins(db, rows):
    """insert many rows into the personal_check_in table

    Args:
        db (slqalchemy.engine): the database engine
        rows list(dicts): a list of dictionaries, each dictionary represents a row.

    Returns:
            true on success, false on failure
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


## Functions below this line are mainly for testing purposes, they are not optimized for performance, but can still be used in production

### def find_one_personal_check_in(db)
    """find one random row in the personal_check_in table

    Args:
        db (slqalchemy.engine): the database engine

    Returns:
        result(dict): Dict with column names as keys. If no row,
            an empty dict is returned.
    """