import uuid
import shortuuid
import asyncio
import json

from fastapi import APIRouter, Header, Request
from shared.utils.logger import logger as LOG
from shared.utils.current_thread import CurrentThread
from shared.variables.constant import DEFAULT_NOT_FOUND_RESPONSE
from shared.builder.response import ApiSuccessResponse, ApiFailedResponse
from src.usecase.variant_usecase import VariantUsecaseImplementation
from src.domain.variant_domain import VariantDomain, VariantFilterRequest

router = APIRouter(
    prefix="/variant",
    tags=["General"],
    responses=DEFAULT_NOT_FOUND_RESPONSE,
)

@router.post("/{country}")
async def get_variant(
    request: Request,
    country: str,
    payload: VariantFilterRequest,
    trace_id: str = Header(default=None, alias="trace-id")
  ):
  message = None
  request = VariantDomain(**payload.dict())
  usecase = VariantUsecaseImplementation()

  if country and len(country) == 0:
    message = "Country is required"

  if message:
    request.state.code = 400
    request.state.message = message
    return ApiFailedResponse(message=message, code=400)

  if trace_id is None:
    current_thread = CurrentThread()
    trace_id = current_thread.get('trace_id')

  (data, message, total), = await asyncio.gather(usecase.get_variant(request))

  meta = {
    "country" : country,
    "trace_id": trace_id,
    "page" : request.page,
    "size" : request.size,
    "total" : total,
  }
  
  return ApiSuccessResponse(data=data, meta=meta)
