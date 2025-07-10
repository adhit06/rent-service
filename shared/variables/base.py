import os

from dotenv import load_dotenv

load_dotenv()

ENVIRONMENT     = os.getenv("ENVIRONMENT", "development")
APP_NUM_WORKERS = os.getenv("APP_NUM_WORKERS", 3)
APP_HASH        = os.getenv("APP_HASH")
APP_VERSION     = os.getenv("APP_VERSION") # this is should be tag version on the deployment
APP_PORT        = os.getenv("PORT")
APP_KEEPALIVE   = int(os.getenv("KEEPALIVE"))
VERSION         = "v1"

LOG_LEVEL = "debug"