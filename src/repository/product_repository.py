import uuid
from sqlalchemy import select, and_, or_, func, asc, desc
from sqlalchemy.future import select
from sqlalchemy.orm import joinedload, selectinload, contains_eager
from configs.database import db_async_conn
from models.product import Product
from models.variant import Variant
from models.brand import Brand
from models.offer import Offer
from models.category import Category
from models.country import Country
from models.period import Period
from models.offer_period_mapping import OfferPeriodMapping

class ProductRepository:
    def __init__(self):
        super().__init__()
        self.__db = db_async_conn

    async def get_product(self, id: str, country: str):
        async with self.__db.get_reader_session() as session:
            query = (
                select(Product)
                .join(Product.variants)
                .join(Variant.offers)
                .join(Offer.country)
                .outerjoin(OfferPeriodMapping, Offer.id == OfferPeriodMapping.offer_id)
                .outerjoin(Period, Period.id == OfferPeriodMapping.period_id)
                .options(
                    contains_eager(Product.variants)
                        .contains_eager(Variant.offers)
                        .contains_eager(Offer.country),
                    joinedload(Product.brand),
                    joinedload(Product.category).joinedload(Category.parent),
                )
                .where(
                    Product.id == uuid.UUID(id),
                    Country.code == country,
                    Product.status == True,
                    Offer.status == True,
                    Variant.status == True,
                    Period.status == True
                )
            )

            result = await session.execute(query)

            return result.unique().scalar_one_or_none()