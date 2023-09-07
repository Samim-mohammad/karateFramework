package api.utility.data;

public class GenerateData {
	
	public static String getEmail() {
		String prefix = "student_email";
		String provider = "@tekschool.us";
		
		//"Auto_email12345@tekschool.us"
		
		int random = (int) (Math.random() * 2000);
		String email = prefix + random + provider;
		return email;
		
		}
	//generate Random phone number 10 digit
	//@return String random phone number
	public static String getPhoneNumber() {
		String phoneNumber = "1";
		for (int i = 0; i <8; i++) {
			phoneNumber += (int) (Math.random() * 10);
			
		}
		return phoneNumber;
	
	}

	public static String getLicensePlate() {
		String prefix = "xyz";
		String suffix = "abc";
		int random = (int) (Math.random()* 10000);
		String licensePlate = prefix + random + suffix;
		return licensePlate;
	}
}

