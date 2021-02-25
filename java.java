import java.util.regex.Pattern;
import java.util.regex.Matcher;

final class java {
	private static String check(String re) {
		final Matcher m = Pattern.compile(re).matcher("foobar");
		return m.find() ? m.group() : "-";
	}

	public static void main(String[] args) {
		System.out.println(
			check("foo|foobar") + " " + check("foobar|foo"));
	}
}
