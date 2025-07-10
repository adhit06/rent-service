
from sqlalchemy import Column, String

from models.base import Base
from shared.variables.constant import PG_DB_SCHEMA

class Country(Base):
    __tablename__ = 'country'
    __table_args__ = {'schema': PG_DB_SCHEMA}

    id = Column(String, primary_key=True, index=True)
    name = Column(String, nullable=False)
    code = Column(String, nullable=False)
    currency_code = Column(String, nullable=False)