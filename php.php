<?php
function check_preg($re) {
	return preg_match($re, 'foobarbaz', $m) ? $m[0] : '-';
}
function check_ereg($re) {
	return ereg($re, 'foobarbaz', $m) ? $m[0] : '-';
}
function check_mb_ereg($re) {
	mb_regex_encoding('UTF-8');
	return mb_ereg($re, 'foobarbaz', $m) ? $m[0] : '-';
}

echo check_preg('/foo|foobar/') . ' ' . check_preg('/foobar|foo/') . "\n";
echo check_mb_ereg('foo|foobar') . ' ' . check_mb_ereg('foobar|foo') . "\n";
if (function_exists('ereg')) {
    error_reporting(E_ALL ^ E_DEPRECATED);
    echo check_ereg('foo|foobar') . ' ' . check_ereg('foobar|foo') . "\n";
}
?>
