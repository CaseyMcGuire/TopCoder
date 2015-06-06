import java.util.stream.*;
import java.util.Arrays;
class AdvertisingAgency {
    
    /*
      Return the number of rejected requests
      
      Constraints:
      requests will contain between 1 and 50 elements, inclusive.
      Each element of requests will be between 1 and 100, inclusive.
     */
    public int numberOfRejections(int[] requests) {
	return requests.length- (int)Arrays.stream(requests)
	                        .parallel()
	                        .distinct()
	                        .count();
    }
}
