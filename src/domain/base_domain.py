class BaseDomain:
    def __init__(self, *args, **kwargs):
        self.name = kwargs.get("name", None)
        self.sort = kwargs.get("sort", "discount_price")
        self.order_by = kwargs.get("order_by", "asc")
        self.page = kwargs.get("page", 1)
        self.size = kwargs.get("size", 5)
        self.country = kwargs.get("country", "sg")
        self.offset = (self.page - 1) * self.size