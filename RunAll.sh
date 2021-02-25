#!/bin/sh

run() {
	echo "==================== $2 ===================="
	if [ -z "$(which "$1" 2>/dev/null)" ]; then
		echo "$1 not found, skipping "
	else
		shift
		while shift; [ $# -gt 0 ]; do
			[ $# -eq 1 ] && echo "+ $1"
			eval $1
		done
	fi
}

CC=${CXX:-gcc}
CXX=${CXX:-g++}

run awk      AWK           'awk --version'     'sh awk.sh'
run gawk     'GNU AWK'     'awk --version'     'sh awk.sh'
run "$CC"    'C regex.h'  "$CC --version"   "$CC  -o regex regex.c   && ./regex"
run "$CXX"   'C++ stdlib' "$CXX --version"  "$CXX -o cpp cpp.cpp       && ./cpp"
run "$CXX"   'C++ RE2'    "$CXX --version"  "$CXX -o re2 re2.cpp -lre2 && ./re2"
run emacs    'Emacs Lisp' 'emacs --version'   'emacs --batch -l elisp.el'
run grep     Grep         'grep --version'    'sh grep.sh'
run javac    Java         'java --version'    'javac java.java && java java'
run sed      'SED'        'sed --version'     'sh sed.sh'

while read binary title; do
	run $binary "JavaScript ($title)" \
	    "$binary --version" "$binary ./javascript.html"
done <<EOF
google-chrome  Google Chrome
chromium       Chromium
microsoft-edge Edge
firefox        Firefox
opera          Opera
EOF

run perl     Perl         'perl --version'    'perl perl.pl'
run python2  'Python 2'   'python2 --version' 'python2 python.py'
run python3  'Python 3'   'python3 --version' 'python3 python.py'
run ruby     'Ruby'       'ruby --version'    'ruby ruby.rb'
run cargo    'Rust'       'rustc --version'   '(cd rust && cargo run)'
