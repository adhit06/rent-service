from sqlalchemy import Column, String
from sqlalchemy.orm import relationship

from models.base import Base
from shared.variables.constant import PG_DB_SCHEMA

class Brand(Base):
    __tablename__ = 'brand'
    __table_args__ = {'schema': PG_DB_SCHEMA}

    id = Column(String, primary_key=True)
    name = Column(String, nullable=False)
    description = Column(String)

    products = relationship("Product", back_populates="brand")