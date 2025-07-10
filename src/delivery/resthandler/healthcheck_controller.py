from fastapi import APIRouter
from shared.variables.base import ENVIRONMENT, APP_VERSION, APP_HASH, VERSION
from shared.variables.constant import DEFAULT_NOT_FOUND_RESPONSE

router = APIRouter(
    prefix="",
    tags=["general"],
    responses=DEFAULT_NOT_FOUND_RESPONSE,
)

@router.get("/healthcheck")
async def healthcheck():
  return {
    "environment": ENVIRONMENT,
    "app_version": APP_VERSION,
    "app_hash": APP_HASH,
    "version": VERSION
  }