package cs336.pkg;
import java.text.*;
import java.util.*; 
public class Timefunction {
	public Timefunction(){}
	
	public String compareTime(String enddate) throws ParseException
	{
		SimpleDateFormat DateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	    Calendar t = Calendar.getInstance(); 
	    String formattedDate=DateFormat.format(t.getTime());
	    String result="";
		Date dateEnd=DateFormat.parse(enddate);
		Date currentDate=DateFormat.parse(formattedDate);
		
        System.out.println("date1 : " + DateFormat.format(dateEnd));
        System.out.println("date2 : " + DateFormat.format(currentDate));
        if (dateEnd.before(currentDate)) 
        {
        	result="auction is alreay closed";
        }
        if (dateEnd.after(currentDate)) 
        {
        	result="auction is still opened";
        }
        if (dateEnd.equals(currentDate)) {
            result="auction is closed";
        }
        return result;
	}
	public static void main(String[] args)
	{
	    Calendar t = Calendar.getInstance(); 
        System.out.println("The Current Date is:" + t.getTime()); 
      
	}
	
}
