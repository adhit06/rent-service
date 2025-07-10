from uuid import UUID
from sqlalchemy import Column, String, ForeignKey
from sqlalchemy.orm import relationship

from models.base import Base
from shared.variables.constant import PG_DB_SCHEMA

class Category(Base):
    __tablename__ = 'category'
    __table_args__ = {'schema': PG_DB_SCHEMA}

    name = Column(String, nullable=False)
    level = Column(String)
    parent_id = Column(String, ForeignKey(f"{PG_DB_SCHEMA}.category.id"), nullable=True)

    parent = relationship("Category", remote_side="Category.id", backref="children")
    products = relationship("Product", back_populates="category")