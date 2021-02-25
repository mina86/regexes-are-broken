extern crate regex;

use regex::Regex;

const INPUT: &str = "foobarbaz";

fn check(re: &str) -> &str {
    Regex::new(re).unwrap().find(INPUT).map_or("-", |m| m.as_str())
}

fn check_shortest(re: &str) -> &str {
    Regex::new(re).unwrap().shortest_match(INPUT).map_or("-", |sz| &INPUT[..sz])
}

fn main() {
    println!("{} {}", check("foo|foobar"), check("foobar|foo"));
    println!("{} {}", check_shortest("foo|foobar"), check_shortest("foobar|foo"));
}
