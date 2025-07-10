import json
from sqlalchemy.ext.asyncio import create_async_engine, AsyncSession
from sqlalchemy.orm import sessionmaker
from contextlib import asynccontextmanager

from shared.variables.database import *

class DatabaseConnection(object):

    def __init__(self, *args, **kwargs):
        super().__init__()
        self.__write_engine  = None
        self.__read_engine   = None
        self.__write_session = None
        self.__read_session  = None

    async def connect(self):
        self.__write_engine = create_async_engine(
            WRITER_HOST,
            echo=False,
            pool_size=DATABASE_POOLSIZE,
            max_overflow=0,
            pool_pre_ping=True,
            pool_recycle=1800,
            json_serializer=lambda obj: json.dumps(obj),
            json_deserializer=lambda s: json.loads(s)
        )

        self.__read_engine = create_async_engine(
            READER_HOST,
            echo=False,
            pool_size=DATABASE_POOLSIZE,
            max_overflow=0,
            pool_pre_ping=True,
            pool_recycle=1800,
            json_serializer=lambda obj: json.dumps(obj),
            json_deserializer=lambda s: json.loads(s)
        )

        self.__write_session = sessionmaker(
            bind=self.__write_engine,
            class_=AsyncSession,
            expire_on_commit=False
        )

        self.__read_session = sessionmaker(
            bind=self.__read_engine,
            class_=AsyncSession,
            expire_on_commit=False
        )

    async def disconnect(self):
        if self.__write_engine:
            await self.__write_engine.dispose()
        if self.__read_engine:
            await self.__read_engine.dispose()
    
    @asynccontextmanager
    async def get_writer_session(self):
        session = self.__write_session()
        try:
            yield session
            await session.commit()
        except Exception:
            await session.rollback()
            raise
        finally:
            # sent back the connection to the pool
            await session.close()

    @asynccontextmanager
    async def get_reader_session(self):
        session = self.__read_session()
        try:
            yield session
        finally:
            # sent back the connection to the pool
            await session.close()

db_async_conn = DatabaseConnection()

async def db_connect():
    await db_async_conn.connect()

async def db_disconnect():
    await db_async_conn.disconnect()