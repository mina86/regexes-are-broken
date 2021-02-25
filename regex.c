#include <regex.h>
#include <stdio.h>

void check(const char *re, int cflags) {
	static const char str[] = "foobarbaz";

	regex_t preg;
	regmatch_t pmatch[1];
	int ret = regcomp(&preg, re, cflags);
	regexec(&preg, str, 1, pmatch, 0);
	regfree(&preg);

	if (ret) {
		putchar('-');
	} else {
		for (regoff_t i = pmatch[0].rm_so; i < pmatch[0].rm_eo; ++i) {
			putchar(str[i]);
		}
	}
}

int main(void) {
	check("foo\\|foobar", 0); putchar(' ');
	check("foobar\\|foo", 0); putchar('\n');
	check("foo|foobar", REG_EXTENDED); putchar(' ');
	check("foobar|foo", REG_EXTENDED); putchar('\n');
}
