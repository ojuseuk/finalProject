package util;

public class DateTimeUtil {

	public static String dateForm(String date){
		return date.substring(0, 4) + "-" + date.substring(4, 6) + "-" + date.substring(6, 8);
	} // end of dateForm()
	
	public static String timeForm(String time){
		return time.substring(0, 2) + ":" + time.substring(2,4);
	} // end of timeForm()
}
