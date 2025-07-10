from sqlalchemy import Column, String, Integer
from sqlalchemy.orm import relationship

from models.base import Base
from shared.variables.constant import PG_DB_SCHEMA

class Period(Base):
    __tablename__ = 'period'
    __table_args__ = {'schema': PG_DB_SCHEMA}

    id = Column(String, primary_key=True)
    duration = Column(Integer, nullable=False)

    offers = relationship("OfferPeriodMapping", back_populates="period")