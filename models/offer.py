from uuid import UUID
from sqlalchemy import Column, String, ForeignKey, JSON, DECIMAL, Integer
from sqlalchemy.orm import relationship

from models.base import Base
from shared.variables.constant import PG_DB_SCHEMA

class Offer(Base):
    __tablename__ = 'offer'
    __table_args__ = {'schema': PG_DB_SCHEMA}

    sku_no = Column(String, nullable=False, unique=True)
    normal_price = Column(DECIMAL, nullable=False)
    discount_price = Column(DECIMAL)
    quantity = Column(Integer)
    warranty_period = Column(Integer)
    country_id = Column(String, ForeignKey(f"{PG_DB_SCHEMA}.country.id"))
    variant_id = Column(String, ForeignKey(f"{PG_DB_SCHEMA}.variant.id"))
    additional_information = Column(JSON)

    country = relationship("Country")
    variant = relationship("Variant", back_populates="offers")
    periods = relationship("OfferPeriodMapping", back_populates="offer")
