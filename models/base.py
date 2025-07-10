import datetime
from uuid import UUID

from uuid_extensions import uuid7, uuid7str
from sqlalchemy import Column, DateTime, String, Boolean
from sqlalchemy.sql import func
from sqlalchemy.orm import DeclarativeBase
from pydantic import BaseModel

class Base(DeclarativeBase):
    """ class Config:
        orm_mode = True
        json_encoders = {
            UUID: lambda u: str(u),
        } """

    id = Column(String, primary_key=True)
    status = Column(Boolean, nullable=True)
    created_at = Column(DateTime(timezone=True), server_default=func.now())
    updated_at = Column(DateTime(timezone=True), onupdate=func.now())
    created_by = Column(String, nullable=True)
    updated_by = Column(String, nullable=True)