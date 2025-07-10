from typing import List, Optional
from pydantic import BaseModel
class BaseDomain:
    def __init__(self, *args, **kwargs):
        self.name = kwargs.get("name", None)
        self.sort = kwargs.get("sort", "discount_price")
        self.order_by = kwargs.get("order_by", "asc")
        self.page = kwargs.get("page", 1)
        self.size = kwargs.get("size", 5)
        self.country = kwargs.get("country", "sg")
        self.offset = (self.page - 1) * self.size

class BaseFilter(BaseModel):
    name: Optional[str] = ""
    page: Optional[int] = 1
    size: Optional[int] = 5
    sort: Optional[str] = "discount_price"
    order_by: Optional[str] = "asc"