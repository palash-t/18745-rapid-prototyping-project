#!/usr/bin/env python

from database import get_db, \
					 insert_gyro
from uuid import uuid4


def main():
	db = get_db()
	ret = insert_gyro(db, uuid4(), "blank description", uuid4(), 1.0, 2.1, 1.3)


if __name__ == '__main__':
    main()