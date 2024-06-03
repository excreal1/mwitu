import sys
from os import path, popen, remove
from time import sleep
from requests import post, head, Session, ConnectionError
from getpass import getpass

session = Session()
# Read the curl output from stdin
curl_output = sys.stdin.read()

# Find the index of the first occurrence of '?'
magic_start_index = curl_output.find('?')

# Extract the substring starting from the index after '?' to the end of the string
magic_and_remainder = curl_output[magic_start_index + 1:]

# Find the index of the first occurrence of '"'
magic_end_index = magic_and_remainder.find('"')

# Extract the substring from the start to the index before '"'
magic = magic_and_remainder[:magic_end_index]

redirected_url = "https://portal.uonbi.ac.ke:1003/"

headers = \
        {'User-Agent': 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36'}

payload = {
    '4Tredir': 'http://google.com/',
    'magic': str(magic),
    'username': 'bcm354252023',
    'password': '21587Db9e202',
    }

print(magic)
print("Connecting..")
res = session.post(redirected_url, headers=headers, data=payload)
