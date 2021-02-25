#!/bin/sh

echo 'foobarbaz' | grep -o 'foo\|foobar' || echo ' - '
echo 'foobarbaz' | grep -o 'foobar\|foo' || echo ' - '

echo 'foobarbaz' | grep -oE 'foo|foobar' || echo ' - '
echo 'foobarbaz' | grep -oE 'foobar|foo' || echo ' - '

echo 'foobarbaz' | grep -oP 'foo|foobar' || echo ' - '
echo 'foobarbaz' | grep -oP 'foobar|foo' || echo ' - '
