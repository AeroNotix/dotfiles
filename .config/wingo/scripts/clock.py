import sys
import datetime
import time

while 1:
    print datetime.datetime.now().strftime("%H:%M")
    sys.stdout.flush()
    time.sleep(60)
