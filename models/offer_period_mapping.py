from uuid import UUID
from sqlalchemy import Column, String, ForeignKey, JSON, DECIMAL, Integer
from sqlalchemy.orm import relationship

from models.base import Base
from shared.variables.constant import PG_DB_SCHEMA

class OfferPeriodMapping(Base):
    __tablename__ = 'offer_period_mapping'
    __table_args__ = {'schema': PG_DB_SCHEMA}

    period_id = Column(String, ForeignKey(f"{PG_DB_SCHEMA}.period.id"), primary_key=True)
    offer_id = Column(String, ForeignKey(f"{PG_DB_SCHEMA}.offer.id"), primary_key=True)

    period = relationship("Period", back_populates="offers")
    offer = relationship("Offer", back_populates="periods")