from glob import glob
from fastapi import FastAPI, HTTPException
from pydantic import ValidationError
from fastapi.exceptions import RequestValidationError
from contextlib import asynccontextmanager

from shared.utils.logger import logger
from shared.variables.constant import SERVICE_NAME
from shared.middleware.exception_handler import request_validator_handler
from configs.database import db_connect, db_disconnect

@asynccontextmanager
async def lifespan(app: FastAPI):
    logger.info(f"{SERVICE_NAME} Application Started")
    await db_connect()
    yield
    logger.info(f"{SERVICE_NAME} Application Shutdown")
    await db_disconnect()

app = FastAPI(lifespan=lifespan)

for router in glob("src/delivery/resthandler/*.py"):
    package = router.replace(".py", "").replace("/", ".").replace("\\", ".")
    name = "router"
    router = getattr(__import__(package, fromlist=[name]), name)
    app.include_router(router)
    

for exception_type in [
  ValidationError, 
  HTTPException, 
  Exception,
  RequestValidationError
]:
  app.exception_handler(exception_type)(request_validator_handler)