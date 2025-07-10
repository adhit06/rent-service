from src.domain.base_domain import BaseDomain, BaseFilter
from typing import List, Optional
from pydantic import BaseModel

class VariantDomain(BaseDomain):
    
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

        self.period = kwargs.get("period", [])
        self.brand = kwargs.get("brand", None)
        self.category = kwargs.get("category", [])
        self.start_price = kwargs.get("start_price", None)
        self.end_price = kwargs.get("end_price", None)

class VariantFilterRequest(BaseFilter):
    country: Optional[str] = "sg"
    period: Optional[int] = []
    category: Optional[List[str]] = []
    brand: Optional[str] = None
    start_price: Optional[float] = None
    end_price: Optional[float] = None