package api.runner;

import com.intuit.karate.junit5.Karate;

public class TestRunner {
	
	//this class run karate with j unit 5.
	//we need here a method that can run test which unit 5 and we'll learn how to pass tags in here to run in. 
	// the method that we have is public karate, it is coming from karate. Initialized Karate j unit 5 run test.
	
	@Karate.Test
	public Karate runTest() {
		//address for our feature files.
		//And tags
		return Karate.run("classpath:features")
				.tags("@Regression");
		
	}

}
