import logging

from shared.utils.context_filter import ContextFilter
from shared.variables.constant import SERVICE_NAME

handler   = logging.StreamHandler()
formatter = logging.Formatter(f'[{SERVICE_NAME.replace("_", " ").upper()}][%(asctime)s][TraceId: %(trace_id)s][%(levelname)s] %(filename)s:%(lineno)s : %(message)s', "%Y-%m-%d %H:%M:%S")

handler.setFormatter(formatter)

logger = logging.getLogger(__name__)
logger.setLevel(logging.INFO)
logger.addFilter(ContextFilter())
logger.addHandler(handler)