#!/usr/bin/python

import argparse

class Filesystem:
    def __init__(self, diskfile):
        self.diskfile = diskfile

        try:
            self.disk_fd = fopen(diskfile, 'rw')
        except: pass

    def readfromdisk(self):
        pass

    def writetodisk(self):
        fclose(self.disk_fd)

    def list_files(self):
        pass

    def add_file(self, files):
        pass

    def remove_file(self, files):
        pass

    def print_file(self, filename):
        pass

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('disk-image')
    parser.add_argument('action', help='ls, add, rm, print')
    parser.add_argument('file', nargs='?');
    args = vars(parser.parse_args())

    fs = Filesystem(args['disk-image'])
    if   args['action'] == 'ls':
        fs.list_files()
    elif args['action'] == 'add':
        if args.file != None:
            fs.add_file(args.file)
    elif args['action'] == 'rm':
        if args.file != None:
            fs.remove_file(args.file)
    elif args['action'] == 'print':
        if args.file != None:
            fs.print_file(args.file)

    fs.writetodisk()
