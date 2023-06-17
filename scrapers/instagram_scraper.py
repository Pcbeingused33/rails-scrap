from traceback import print_tb
from instagrapi import Client
import json
from bs4 import BeautifulSoup
import requests
import pdb
import csv
from time import sleep


#         break

counter = 0
total_array = []

with open('url_strings.csv', 'r') as csv_file:
    csv_reader = csv.reader(csv_file)
    for elem in csv_reader:
        rango = len(elem)
        # x number of elements on csv


while counter in range (rango):
    with open('url_strings.csv', 'r') as csv_file:
        csv_reader = csv.reader(csv_file)

        for line in csv_reader:
            url1 =  line[counter].replace("https://www.instagram.com/", "")
            url =  url1.replace("/", "")
            counter += 1
            # print(url)

            cl = Client()
            ACCOUNT_USERNAME="docnightxz@gmail.com"
            ACCOUNT_PASSWORD="acgocrfox69"
            cl.login(ACCOUNT_USERNAME, ACCOUNT_PASSWORD)

            user_id = cl.user_id_from_username(url)
            medias = cl.user_clips(user_id, 20)

            l = str(medias)
            l = l.split(",")
            total = 0
            for e in l:
                if "play_count" in e:
                    e = e.replace(" play_count=","")
                    # print(caja)
                    total += int(e)
                # else:
                #     pass
        total_array.append(total)
        print(total_array)
        sleep(10)
            # with open("ig_views.csv","a+") as f:
            #     f.write(str(total_array)+",")

with open('ig_views.csv', mode='w') as url_string_file:
    url_string_writer = csv.writer(url_string_file)

    url_string_writer.writerow(total_array)



    # ['name', ' url', ' views']
        # ['abb', 'https://www.instagram.com/justoreylo/reels/']


# csv name, url, views

# a python program
# => CSV con todos los nombres += urls
# devolver del programa into new_CSV
# name + views


# while True:
#     print("""
#     _____
#     /  ___|
#     \ `--.  ___ _ __ __ _ _ __   ___ _ __
#     `--. \/ __| '__/ _` | '_ \ / _ \ '__|
#     /\__/ / (__| | | (_| | |_) |  __/ |
#     \____/ \___|_|  \__,_| .__/ \___|_|
#                         | |
#                         |_|

#         """)

#     print("======================================")

# meter totales en csv
# csv a vista
