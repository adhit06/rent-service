from uuid import UUID
from sqlalchemy import Column, String, ForeignKey, JSON
from sqlalchemy.orm import relationship

from models.base import Base
from shared.variables.constant import PG_DB_SCHEMA

class Variant(Base):
    __tablename__ = 'variant'
    __table_args__ = {'schema': PG_DB_SCHEMA}

    name = Column(String, nullable=False)
    description = Column(String)
    attributes = Column(JSON)
    product_id = Column(String, ForeignKey(f"{PG_DB_SCHEMA}.product.id"))

    product = relationship("Product", back_populates="variants")
    offers = relationship("Offer", back_populates="variant")