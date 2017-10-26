#!/usr/bin/env python

import sys
import json
import time
import os.path


TIMEIT_PATH = os.path.expanduser('~/.timeit')


def main(pid, op, name):
    if op == 'start':
        store_time_start(pid, name)
        return

    if op == 'finish':
        store_time_finish(pid, name)
        return

    if op == 'show':
        show(pid)
        return

    print('Operation %s is not supported. Please use "start", "finish" or "show"')
    sys.exit(1)


def get_data():
    data = None

    if os.path.exists(TIMEIT_PATH):
        with open(TIMEIT_PATH, 'r') as f:
            contents = f.read()

        data = json.loads(contents)
    if data is None:
        data = {}

    return data


def save_data(data):
    with open(TIMEIT_PATH, 'w') as f:
        f.write(json.dumps(data))


def store_time_start(pid, name):
    data = get_data()

    if pid not in data:
        data[pid] = {}

    if name not in data[pid]:
        data[pid][name] = {}

    data[pid][name]['start'] = time.time()

    save_data(data)


def store_time_finish(pid, name):
    data = get_data()

    if pid not in data or name not in data[pid]:
        print('%s process or %s name was not found in timeit file. Skipping measurement.' % (pid, name))
        return

    data[pid][name]['finish'] = time.time()

    save_data(data)


def show(pid):
    data = get_data()

    if pid not in data:
        print('Process %s was not found in timings. Are you sure you are using the right one?' % pid)
        sys.exit(1)

    details = data[pid]
    total = 0
    for name, values in details.items():
        if 'start' not in values or 'finish' not in values:
            print('Could not find both start and finish values for %s section. Ignoring...' % (name))
            continue
        ellapsed = values['finish'] - values['start']
        total += ellapsed
        print ('Time for %s: %.2f seconds' % (name, ellapsed))

    print ('Total time: %.2f seconds' % (total))


if __name__ == '__main__':
    if len(sys.argv) < 4 and sys.argv[2] != 'show':
        print('Starting or Finishing takes 3 args: shell ID, operation and name')
        sys.exit(1)

    if (sys.argv[2] == 'show'):
        main(sys.argv[1], sys.argv[2], None)
    else:
        main(sys.argv[1], sys.argv[2], sys.argv[3])
