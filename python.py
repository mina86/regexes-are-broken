#!/usr/bin/python3

import re

def check(rx):
        m = re.search(rx, 'foobarbaz')
        if m:
                return m.group()
        else:
                return '-';

print(check('foo|foobar'), check('foobar|foo'))
