#!/usr/bin/env python3
import subprocess
import sys
import time
import os

from http.server import SimpleHTTPRequestHandler
from http.server import HTTPServer

outdir = sys.argv[1]
reldir = os.path.relpath('.', outdir)

os.chdir(outdir)

try:
    from watchdog.events import PatternMatchingEventHandler
    from watchdog.observers import Observer

    class MakeHandler(PatternMatchingEventHandler):
        def __init__(self, interval):
            PatternMatchingEventHandler.__init__(self, patterns=[os.path.join('*.res', '*'), '*.md'], ignore_patterns=[os.path.join(reldir, outdir, '*'), os.path.join('vendor', '*'), os.path.join('*', 'LICENSE.md'), os.path.join('*', 'README.md'), os.path.join('*', '.git', '*')], ignore_directories=True, case_sensitive=False)
            self.last = time.time()
            self.interval = interval

        def on_any_event(self, event):
            cur = time.time()
            if cur < self.last + self.interval:
                return

            print('rebuilding')
            subprocess.call(['make', '-C', reldir, 'all'], stdout=open('/dev/null'), stderr=subprocess.STDOUT)
            self.last = cur

    observer = Observer()
    observer.schedule(MakeHandler(interval=1), reldir, recursive=True)
    observer.start()
except ImportError:
    print('watchdog not found: automatic rebuild disabled')

print('serving "{}" at http://localhost:8080/'.format(outdir))

httpd = HTTPServer(('localhost', 8080), SimpleHTTPRequestHandler)

try:
    httpd.serve_forever()
except KeyboardInterrupt:
    print('shutting down')
