from traceback import print_tb
from instagrapi import Client
import json
from bs4 import BeautifulSoup
import requests
import pdb
import csv
from time import sleep

cl = Client()
ACCOUNT_USERNAME="docnightxz@gmail.com"
ACCOUNT_PASSWORD="acgocrfox69"
cl.login(ACCOUNT_USERNAME, ACCOUNT_PASSWORD)

user_id = cl.user_id_from_username(url)
medias = cl.user_clips(user_id, 20)

l = str(medias)
l = l.split(",")
