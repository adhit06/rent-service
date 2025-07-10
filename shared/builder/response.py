import orjson

from fastapi.responses import JSONResponse 
from pydantic import BaseModel
from uuid import UUID
from shared.variables.constant import API_RESPONSE_MESSAGE

from typing import (
  Any, 
  Dict,
  List,
  Union,
  Optional
)

class ApiBaseResponse(BaseModel):
  data: Union[List[Any], Dict[str, Any], Any, None]
  meta: Optional[Dict[str, Any]]

class ApiSuccessResponse(ApiBaseResponse):
  code: int = 200
  success: bool = True
  message: str = API_RESPONSE_MESSAGE["SUCCESS"]

class ApiFailedResponse(ApiBaseResponse):
  code: int = 500
  success: bool = False
  message: str = API_RESPONSE_MESSAGE["FAILED"]

class ApiResponse(JSONResponse):
  media_type: str = "application/json"

  def render(self, content: Union[ApiSuccessResponse, ApiFailedResponse]) -> bytes:
    return orjson.dumps(content, option=orjson.OPT_INDENT_2)