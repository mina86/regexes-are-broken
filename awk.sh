#!/bin/sh

echo foobarbaz |
	awk 'match($0, /foo|foobar/) { print substr($0, RSTART, RLENGTH) }'
echo foobarbaz |
	awk 'match($0, /foobar|foo/) { print substr($0, RSTART, RLENGTH) }'
