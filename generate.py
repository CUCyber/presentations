#!/usr/bin/env python3
import argparse
import os
import shutil

parser = argparse.ArgumentParser(description="generate HTML directory from reveal.js Markdown source")
parser.add_argument('-r', '--root', dest='root', default='/', help='reveal.js root in website')
parser.add_argument('-o', '--theme', dest='theme', default='simple', help='reveal.js theme to use')
parser.add_argument('-t', '--template', dest='template', default='template.html', help='template file to generate from')
parser.add_argument('-a', '--res', dest='res', default='', help='resource folder for presentation')
parser.add_argument('infile', default='presentation.md', help='input markdown file')
parser.add_argument('outdir', default='.', help='output directory')

args = parser.parse_args()

if os.path.exists(args.res):
    shutil.copytree(args.res, args.outdir)
else:
    os.makedirs(args.outdir)

shutil.copy(args.infile, args.outdir)

with open(os.path.join(args.outdir, 'index.html'), 'w') as index:
    with open(args.template, 'r') as template:
        with open(args.infile, 'r') as presentation:
            title = presentation.readline()

        title.strip()

        if title[0] == '#':
            title = title[1:]

        title.strip()

        index.write(template.read().format(title=title, root=args.root, theme=args.theme, presentation=os.path.basename(args.infile)))
