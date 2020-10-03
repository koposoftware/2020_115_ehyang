package hana.ti.message;
import org.springframework.stereotype.Service;

// Install the Java helper library from twilio.com/docs/libraries/java
import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Message;
import com.twilio.type.PhoneNumber;


@Service
public class MessageSend {

	    // Find your Account Sid and Auth Token at twilio.com/console
	    public static final String ACCOUNT_SID =
	            "AC1c8d0c90c3d0d3a33c0fbf5518ff451a";
	    public static final String AUTH_TOKEN =
	            "a2cde9d419e489c2b81fc1ccb8479659";

//	    public static void main(String[] args) {
//	        Twilio.init(ACCOUNT_SID, AUTH_TOKEN);
//
//	        Message message = Message
//	                .creator(new PhoneNumber("+821051400204"), // to
//	                        new PhoneNumber("+12057973957"), // from
//	                        "Where's Wallace?")
//	                .create();
//
//	        System.out.println(message.getSid());
//	    }
	    
	    
	    public static final String fromPhoneN = "+12057973957";
	    private Message message;
	    //생성자
	    public MessageSend() {
	    	Twilio.init(ACCOUNT_SID, AUTH_TOKEN);
	    }
	    
	    public void send(String toPhoneNo, String msg) {
	        message = Message
	                 .creator(new PhoneNumber("+82" + toPhoneNo.substring(1)), // to
	                         new PhoneNumber(fromPhoneN), // from
	                         msg)
	                 .create();
	         System.out.println(message.getSid());
	     }
	}