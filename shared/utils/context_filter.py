import logging
from shared.utils.current_thread import CurrentThread

class ContextFilter(logging.Filter):

    def filter(self, record):
        current_thread = CurrentThread()
        record.trace_id = current_thread.get('trace_id')
        return True
