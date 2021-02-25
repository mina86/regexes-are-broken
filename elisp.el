                                        ; -*- lexical-binding: t -*-

(message "%s" (mapconcat (lambda (re)
                           (if (string-match re "foobarbaz")
                               (match-string 0 "foobarbaz")
                             "-"))
                         '("foo\\|foobar" "foobar\\|foo")
                         " "))
