from uuid import UUID
from sqlalchemy import Column, String, ForeignKey, JSON
from sqlalchemy.orm import relationship

from models.base import Base
from models.brand import Brand
from models.category import Category
from models.variant import Variant
from shared.variables.constant import PG_DB_SCHEMA

class Product(Base):
    __tablename__ = 'product'
    __table_args__ = {'schema': PG_DB_SCHEMA}

    name = Column(String, nullable=False)
    description = Column(String)
    specs = Column(JSON)
    brand_id = Column(String, ForeignKey(f"{PG_DB_SCHEMA}.brand.id"))
    category_id = Column(String, ForeignKey(f"{PG_DB_SCHEMA}.category.id"))

    brand = relationship("Brand", back_populates="products")
    category = relationship("Category", back_populates="products")
    variants = relationship("Variant", back_populates="product")