#!/usr/bin/ruby

puts 'foobarbaz'.match(/foo|foobar/)[0]
puts 'foobarbaz'.match(/foobar|foo/)[0]
