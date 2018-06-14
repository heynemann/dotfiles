#!/usr/bin/env python

import sys
try:
    from urllib2 import urlopen
except ImportError:
    from urllib.request import urlopen

import json

data = {}
raw_data = "raw_data"
parsed_data = "parsed_data"
file_names = "file_names"


def exit():
    sys.exit("----")


def load():
    data[raw_data] = urlopen(
        "https://api.github.com/repos/github/gitignore/git/trees/HEAD")
    data[parsed_data] = json.loads(data[raw_data].read())
    data[file_names] = [
        filename['path'].split('.gitignore')[0]
        for filename in data[parsed_data]['tree']
    ]


def help():
    print("""
NAME
       download-gitignore - download .gitignore files from github.com/github/gitignore repo

USAGE
    download-gitignore [list|download] [number] [destination path]
""")


def list_files():
    load()
    for i in range(data[file_names].__len__()):
        print("%d - %s" % (i, data[file_names][i]))
    print("""
USE
    download-gitignore [download|d] [number] [path]
    to download a file
    """)


def download(number, path):
    from subprocess import call
    load()
    base_url = "https://raw.github.com/github/gitignore/master/"
    file_name = data[file_names][number] + ".gitignore"
    params = ["wget", base_url + file_name, "-O", "\"" + path + "\""]
    print("Calling %s..." % params)
    call(["wget", base_url + file_name, "-O", path])


def main():
    try:
        if sys.argv[1] == "help":
            help()
            exit()
        elif sys.argv[1] == "list" or sys.argv[1] == "l":
            list_files()
        elif sys.argv[1] == "download" or sys.argv[1] == "d":
            download(int(sys.argv[2]), sys.argv[3])
    except IndexError:
        help()
        exit()


if __name__ == '__main__':
    main()
