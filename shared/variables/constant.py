SERVICE_NAME = "Rent Service"
PG_DB_SCHEMA = "public"

API_RESPONSE_MESSAGE = {
  "SUCCESS": "Success",
  "FAILED": "Failed",
  "DATA_NOT_FOUND": "Data not found",
  "NOT_FOUND": "Not found",
}

DEFAULT_NOT_FOUND_RESPONSE = {
404 : {
        "success": False,
        "message": API_RESPONSE_MESSAGE['NOT_FOUND']
    }
}