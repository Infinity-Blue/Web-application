package cs336.pkg;
import java.sql.Timestamp;
import java.text.*;
import java.util.*; 
public class Timefunction {
		
	public boolean compareTime(String enddate) throws ParseException
	
	{
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 

        Timestamp current = new Timestamp(System.currentTimeMillis());	
        
        
	    
	    Date parsedDate = dateFormat.parse(enddate);
	    Timestamp deadline = new java.sql.Timestamp(parsedDate.getTime());
	    
	    System.out.println("The Current Date is: " + current); 
        System.out.println("The End Date is: " + deadline); 

        
        if (deadline.after(current))
        {
        	return true;
        }
        
        else
        {
        	return false;
        }
       
	}
	
	public static void main(String[] args) throws ParseException
	{
	    Timefunction k = new Timefunction();
	    
	  String test = "2019-04-21 20:14:38";
	  test = test.substring(0, 19);
       System.out.println(k.compareTime(test));

	}
	
}
