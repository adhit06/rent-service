## Healthcheck Endpoint
curl --location 'http://localhost:8000/healthcheck'

## Get Single Product
curl --location 'http://localhost:8000/product/my/0197ee11-3043-75b5-94b2-d2ed87197e80' \
--header 'Content-Type: application/json'

## Retrieve Multiple Products Based on Filter Payload
curl --location 'http://localhost:8000/variant/my' \
--header 'Content-Type: application/json' \
--data '{
    "name": "Plus 8/128GB Platinum",
    "country": "my",
    "period": 6,
    "category": [
        "0197ede8-ff94-7027-9b0e-b721882b28d4",
        "0197ede4-9f11-7e23-9447-522f810eee79"
    ],
    "brand": "0197edc1-e16e-7022-aa9b-ae725a8bd90e",
    "start_price": 10,
    "end_price": 500,
    "page": 1,
    "size": 5,
    "sort": "discount_price",
    "order_by": "asc"
}'