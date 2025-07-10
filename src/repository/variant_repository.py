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
from src.domain.variant_domain import VariantDomain

class VariantRepository:
    def __init__(self):
        super().__init__()
        self.__db = db_async_conn
    
    async def get_variant(self, domain: VariantDomain):
        async with self.__db.get_reader_session() as session:
            total = 0
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
            )

            filters = []
            if domain.country:
                filters.append(Country.code.ilike(domain.country))

            if domain.period:
                filters.append(Period.duration == domain.period)

            if domain.name:
                filters.append(func.concat(Product.name, " ", Variant.name).ilike(f"%{domain.name}%"))

            if domain.brand:
                filters.append(Variant.product.has(Product.brand_id == uuid.UUID(domain.brand)))

            if domain.category:
                filters.append(Product.category_id.in_([uuid.UUID(category_id) for category_id in domain.category]))

            if domain.start_price is not None:
                filters.append(Offer.discount_price >= domain.start_price)

            if domain.end_price is not None:
                filters.append(Offer.discount_price <= domain.end_price)

            if filters:
                query = query.where(and_(*filters))

            # Sorting
            if domain.sort == "discount_price":
                sort_column = Offer.discount_price
            else:
                sort_column = Variant.name

            query = query.order_by(asc(sort_column) if domain.order_by.lower() == "asc" else desc(sort_column))
            query = query.offset(domain.offset).limit(domain.size)

            count_query = query.with_only_columns(
                func.count(Product.id.distinct())
            ).order_by(None)

            total_result = await session.execute(count_query)
            total = total_result.scalar() or 0

            result = await session.execute(query)
            variants = result.scalars().unique().all()

            return variants, total