#include <cstring>
#include <regex>
#include <string>
#include <iostream>

static void check(std::string re,
		  std::regex_constants::syntax_option_type flags) {
	static const char str[] = "foobarbaz";
	std::cmatch m;
	if (std::regex_search(str, m, std::regex(re, flags))) {
		std::cout << std::string(m[0].first, m[0].second);
	} else {
		std::cout << '-';
	}
}

static void checkAll(const char *sep,
		     std::regex_constants::syntax_option_type flags) {
	check(std::string("foo") + sep + "foobar", flags);
	std::cout << ' ';
	check(std::string("foobar") + sep + "foo", flags);
	std::cout << '\n';
}

int main(void) {
	checkAll("|", std::regex::ECMAScript);
	checkAll("|", std::regex::extended);
	checkAll("|", std::regex::awk);
	checkAll("\n", std::regex::grep);
	checkAll("|", std::regex::egrep);
	return 0;
}
