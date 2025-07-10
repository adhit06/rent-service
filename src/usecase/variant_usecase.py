import asyncio
import json
from fastapi.encoders import jsonable_encoder
from collections import defaultdict
from shared.utils.logger import logger as LOG
from src.repository.variant_repository import VariantRepository
from src.repository.period_repository import PeriodRepository
from src.domain.variant_domain import VariantDomain

class VariantUsecaseImplementation:
    def __init__(self, *args, **kwargs) -> None:
        super().__init__()

        self.__variant_repo = VariantRepository()
        self.__period_repo = PeriodRepository()

    async def get_variant(self, domain: VariantDomain):
        message = None
        data    = []
        (products, total), = await asyncio.gather(self.__variant_repo.get_variant(domain))

        if not products and len(products) == 0:
            return None, "Product Not Found"
        
        for product in products:
            category_path = []
            if product.category:
                if product.category.parent:
                    category_path.append({
                        "name": product.category.parent.name,
                        "level": product.category.parent.level
                    })
                category_path.append({
                    "name": product.category.name,
                    "level": product.category.level
                })

            product_data = {
                "name": product.name,
                "description": product.description,
                "specs": product.specs,
                "category": category_path,
                "brand": product.brand.name if product.brand else None,
                "variants": []
            }

            for variant in product.variants:
                variant_data = {
                    "name": variant.name,
                    "attributes": variant.attributes,
                    "offers": []
                }

                for offer in variant.offers:
                    # Fetch periods (many-to-many)
                    periods, = await asyncio.gather(
                        self.__period_repo.get_period(id=str(offer.id), status=True, duration=domain.period)
                    )
                    durations = [row[0] for row in periods]

                    offer_data = {
                        "sku_no": offer.sku_no,
                        "normal_price": float(offer.normal_price),
                        "discount_price": float(offer.discount_price),
                        "quantity": offer.quantity,
                        "warranty": offer.warranty_period,
                        "country": {
                            "name": offer.country.name,
                            "code": offer.country.code,
                            "currency_code": offer.country.currency_code
                        },
                        "period": durations
                    }

                    variant_data["offers"].append(offer_data)

                product_data["variants"].append(variant_data)

            data.append(product_data)


        return data, message, total
