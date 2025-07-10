import json
from typing import Any
from fastapi import Request, HTTPException
from pydantic import ValidationError
from fastapi.exceptions import RequestValidationError

from shared.builder.response import ApiResponse, ApiFailedResponse
from shared.utils.current_thread import CurrentThread
from shared.utils.logger import logger as LOG
from shared.variables.constant import SERVICE_NAME

async def request_validator_handler(request: Request, exc: Any):
  current_thread = CurrentThread()
  trace_id       = current_thread.get('trace_id')

  http_code = getattr(request.state, "code", 500)
  message   = getattr(request.state, "message", None)
  data      = None

  LOG.info(f"Message {message}")

  # custom message
  if message is None:
    if isinstance(exc, ValidationError):
      http_code = 400    
      message = "Bad Request"
      data = json.loads(exc.json())
    elif isinstance(exc, RequestValidationError):
      http_code = 400
      message = "Bad Request"
      data = exc.errors()   
    elif isinstance(exc, HTTPException):
      message = exc.detail
      http_code = exc.http_code
    elif isinstance(exc, str):
      http_code = 500
      message = "Internal Server Error"

  if http_code == 401:
    message = "Unauthorized"
    
  LOG.error(f"{SERVICE_NAME} HTTP Error: [http_code={http_code}] [message={message}] [data={data}]")
  LOG.error(exc, exc_info=exc)

  meta = request.query_params
  meta = {**meta, **request.path_params}

  meta['trace_id'] = request.headers.get("trace-id")
  if not meta['trace_id']:
    meta['trace_id'] = trace_id

  response = ApiFailedResponse(
    code=http_code,
    message=message,
    data=data,
    meta=meta,
  )

  response = json.loads(response.json())

  return ApiResponse(
    content=response,
    status_code=response['code'],
  )