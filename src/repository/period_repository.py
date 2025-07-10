import uuid
from sqlalchemy import select, and_
from sqlalchemy.future import select
from sqlalchemy.orm import joinedload, selectinload, contains_eager
from configs.database import db_async_conn
from models.period import Period
from models.offer_period_mapping import OfferPeriodMapping

class PeriodRepository:
    def __init__(self):
        super().__init__()

        self.__db = db_async_conn

    async def get_period(self, id, status, duration=None):
        async with self.__db.get_reader_session() as session:
            query = select(Period.duration).join(OfferPeriodMapping)

            filters = []
            filters.append(OfferPeriodMapping.offer_id == uuid.UUID(id))
            filters.append(Period.status == status)

            if duration:
                filters.append(Period.duration == duration)

            if filters:
                query = query.where(and_(*filters))

            periods_result = await session.execute(query)
            
            return periods_result.fetchall()
