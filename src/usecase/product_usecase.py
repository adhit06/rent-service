import asyncio

from shared.utils.logger import logger as LOG
from src.repository.product_repository import ProductRepository
from src.repository.period_repository import PeriodRepository

class ProductUsecaseImplementation:
    def __init__(self, *args, **kwargs) -> None:
        super().__init__()

        self.__product_repo = ProductRepository()
        self.__period_repo = PeriodRepository()

    async def get_product(self, id, country):
        message = None
        product, = await asyncio.gather(self.__product_repo.get_product(id, country.upper()))

        if not product:
            return None, "Product Not Found"

        # Prepare response
        category_path = []
        if product.category:
            category_path.append({
                "name": product.category.parent.name if product.category.parent else None,
                "level": product.category.parent.level if product.category.parent else None
            })
            category_path.append({
                "name": product.category.name,
                "level": product.category.level
            })

        data = {
            "name": product.name,
            "description": product.description,
            "specs": product.specs,
            "category": [cat for cat in category_path if cat["name"]],
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
                # Fetch related periods
                periods, = await asyncio.gather(
                    self.__period_repo.get_period(id=str(offer.id), status=True)
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

            data["variants"].append(variant_data)
        
        return data, message
