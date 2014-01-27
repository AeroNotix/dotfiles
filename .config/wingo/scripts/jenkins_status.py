import sys
from time import sleep

from requests.auth import HTTPBasicAuth
import requests

JENKINS_URL = "http://derbrain.com:8080/"
JOB_NAME = "ubic"
USERNAME = "AeroNotix"
API_TOKEN = "060d41d0ad74493a1eae98ba7ff93e38"

while 1:
    resp = requests.get(
        "%sjob/%s/lastBuild/api/json" % (JENKINS_URL, JOB_NAME),
        auth=HTTPBasicAuth(USERNAME, API_TOKEN)
    )
    if resp.json()['result'] == "SUCCESS":
        print 'jenkins: success'
    else:
        print 'jenkins: fail'
    sys.stdout.flush()
    sleep(10)
