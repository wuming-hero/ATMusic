package player;

import java.util.Arrays;

public class StringUtility {
	
	/**
	 * Judge the string is null or is empty.
	 * @param value
	 * @return
	 */
	public static boolean isNull(String value) {
		if (value == null || "".equals(value)) {
			return true;
		}
		return false;
	}
	
	/**
	 * Split a string using the division.
	 * @param value
	 * @param regex
	 * @return
	 */
	public static String[] split(String value, String regex) {
		String[] ret = null;
		if (isNull(value)) {
			return ret;
		}
		if (isNull(regex)) {
			ret = new String[]{value};
			return ret;
		}
		
		ret = value.split(regex);
		if (value.endsWith(regex)) {
			ret = Arrays.copyOf(ret, ret.length + 1);
			ret[ret.length - 1] = "";
		}
		return ret;
	}
}
