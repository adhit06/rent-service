import uvicorn

from abc import ABC, abstractmethod
from uuid import uuid4
from shared.utils.current_thread import CurrentThread
from shared.variables.base import (
  APP_PORT, 
  APP_NUM_WORKERS, 
  APP_KEEPALIVE, 
  LOG_LEVEL,
)

class RestHandler():
  def __init__(self) -> None:
    current_thread = CurrentThread()
    current_thread.set('trace_id', uuid4())
  
  def __call__(self):
    return uvicorn.run(
      "api.router:app",
      host="0.0.0.0",
      port=int(APP_PORT), 
      reload=False, 
      log_level=LOG_LEVEL, 
      workers=int(APP_NUM_WORKERS),
      timeout_keep_alive=APP_KEEPALIVE,
    )