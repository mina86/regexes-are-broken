#include <string>
#include <iostream>

#include "re2/re2.h"

std::string check(const char *re) {
	std::string ret;
	return RE2::PartialMatch("foobarbaz", RE2(re), &ret) ? ret : "-";
}

int main(void) {
	std::cout << check("(foo|foobar)") << ' '
	          << check("(foobar|foo)") << '\n';
	return 0;
}
