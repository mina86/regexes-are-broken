#!/bin/sh

echo foobarbaz | sed -e 's/foo\|foobar/<&>/'
echo foobarbaz | sed -e 's/foobar\|foo/<&>/'
echo foobarbaz | sed -Ee 's/foo|foobar/<&>/'
echo foobarbaz | sed -Ee 's/foobar|foo/<&>/'
