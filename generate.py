#!/usr/bin/env python3
import argparse
import os
import os.path
import shutil
import urllib.parse

parser = argparse.ArgumentParser(description='generate HTML directory from reveal.js Markdown source')
parser.add_argument('-i', '--id', dest='id', default='presentation', help='reveal.js id in website')
parser.add_argument('-r', '--root', dest='root', default='/', help='reveal.js root in website')
parser.add_argument('-o', '--theme', dest='theme', default='simple', help='reveal.js theme to use')
parser.add_argument('-t', '--template', dest='template', default='template.html', help='template file to generate from')
parser.add_argument('-a', '--res', dest='res', default='', help='resource folder for presentation')
parser.add_argument('infile', nargs='?', default='presentation.md', help='input markdown file')
parser.add_argument('outdir', nargs='?', default='.', help='output directory')

args = parser.parse_args()

# copy resources or make an empty directory
if os.path.exists(args.res):
    shutil.copytree(args.res, args.outdir)
else:
    os.makedirs(args.outdir)

# copy file to output directory
shutil.copy(args.infile, args.outdir)

with open(os.path.join(args.outdir, 'index.html'), 'w') as index:
    with open(args.template, 'r') as template:
        # get the title
        with open(args.infile, 'r') as presentation:
            title = presentation.readline()

        # clean up the title
        title = title.strip()

        if title[0] == '#':
            title = title[1:]

        title = title.strip()

        # template given file
        index.write(template.read().format(id=urllib.parse.quote(args.id, safe=''), title=title, root=urllib.parse.quote(args.root), theme=args.theme, presentation=os.path.basename(args.infile)))
