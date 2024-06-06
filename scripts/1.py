
import sys
from os import path, popen, remove
from time import sleep
from requests import post, head, Session, ConnectionError
from getpass import getpass

# Read the curl output from stdin
curl_output = sys.stdin.read()

# Find the index of the first occurrence of '?'
magic_start_index = curl_output.find('?')

# Extract the substring starting from the index after '?' to the end of the string
magic_and_remainder = curl_output[magic_start_index + 1:]

# Find the index of the first occurrence of '"'
magic_end_index = magic_and_remainder.find('";</script></body></html>')

# Extract the substring from the start to the index before '"'
magic = magic_and_remainder[:magic_end_index]

print(magic)

