#!/usr/bin/env python
import os
import os.path
import shutil

try:
    from urllib.parse import quote as urlquote
except ImportError:
    from urllib import quote as urlquote


def generate(input_file, reveal_id, theme, resource_dir, multiplex_server, template_file, root_dir, output_dir):
    # copy resources or make an empty directory
    if os.path.exists(resource_dir):
        shutil.copytree(resource_dir, output_dir)
    else:
        os.makedirs(output_dir)

    # copy file to output directory
    shutil.copy(input_file, output_dir)

    with open(os.path.join(output_dir, 'index.html'), 'w') as index:
        with open(template_file, 'r') as template:
            # get the title
            with open(input_file, 'r') as presentation:
                title = presentation.readline()

            # clean up the title
            title = title.strip()

            if title[0] == '#':
                title = title.lstrip('#')
                title = title.strip()

            title = title.strip()

            # template given file
            index.write(template.read().format(id=urlquote(reveal_id, safe=''), title=title, root=urlquote(root_dir), theme=theme, multiplex=multiplex_server, presentation=os.path.basename(input_file)))


if __name__ == '__main__':
    import argparse

    parser = argparse.ArgumentParser(description='generate HTML directory from reveal.js Markdown source')
    parser.add_argument('-i', '--id', dest='id', default='presentation', help='reveal.js id in website')
    parser.add_argument('-r', '--root', dest='root', default='/', help='reveal.js root in website')
    parser.add_argument('-o', '--theme', dest='theme', default='simple', help='reveal.js theme to use')
    parser.add_argument('-t', '--template', dest='template', default='template.html', help='template file to generate from')
    parser.add_argument('-a', '--res', dest='res', default='', help='resource directory for presentation')
    parser.add_argument('-m', '--multiplex', dest='multiplex', default='http://localhost:1948', help='reveal.js multiplex server')
    parser.add_argument('infile', nargs='?', default='presentation.md', help='input markdown file')
    parser.add_argument('outdir', nargs='?', default='.', help='output directory')

    args = parser.parse_args()

    generate(args.infile, args.id, args.theme, args.res, args.multiplex, args.template, args.root, args.outdir)
