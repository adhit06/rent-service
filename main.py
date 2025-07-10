from glob import glob
from shared.utils.logger import logger
from api.handler import RestHandler

if __name__ == "__main__":
    rent_service = RestHandler()
    rent_service()