import uuid
import shortuuid
import asyncio

from fastapi import APIRouter, Header, Request
from shared.utils.logger import logger as LOG
from shared.utils.current_thread import CurrentThread
from shared.variables.constant import DEFAULT_NOT_FOUND_RESPONSE
from shared.builder.response import ApiSuccessResponse, ApiFailedResponse
from src.usecase.product_usecase import ProductUsecaseImplementation

router = APIRouter(
    prefix="/product",
    tags=["General"],
    responses=DEFAULT_NOT_FOUND_RESPONSE,
)

@router.get("/{country}/{id}")
async def get_product(
    request: Request,
    country: str,
    id: str,
    trace_id: str = Header(default=None, alias="trace-id")
  ):
  message = None
  usecase = ProductUsecaseImplementation()

  if country and len(country) == 0:
    message = "Country is required"

  if id and len(id) == 0:
    message = "Id is required"
  else:
    try:
      uuid.UUID(id)
    except Exception:
      message = "Invalid Id"

  if message:
    request.state.code = 400
    request.state.message = message
    return ApiFailedResponse(message=message, code=400)
  
  LOG.info("Bawah")

  if trace_id is None:
    current_thread = CurrentThread()
    trace_id = current_thread.get('trace_id')

  (data, message), = await asyncio.gather(usecase.get_product(id, country))

  meta = {
    "id": id,
    "country" : country,
    "trace_id": trace_id,
  }
  
  return ApiSuccessResponse(data=data, meta=meta)