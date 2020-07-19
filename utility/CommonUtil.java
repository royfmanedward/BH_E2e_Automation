package utility;

import java.util.Calendar;
import java.util.Date;

public class CommonUtil {

	public static Date addDays(Date date, int days) {

		Calendar c1 = Calendar.getInstance();
		c1.setTimeInMillis(date.getTime());
		c1.add(Calendar.DATE, days);
		return c1.getTime();
	}
}
