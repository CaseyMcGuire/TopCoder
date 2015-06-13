import java.util.*;

public class Substitute {

    //RUNTIME: O(k + c) where k is the length of the key and c is the length of the code.

    public int getValue(String key, String code) {
	Map<Character, Integer> mappings = getKeyMappings(key);
	StringBuilder answer = new StringBuilder();
	
	for(int i = 0; i < code.length(); i++) {
	    final Integer curIndex = mappings.get(code.charAt(i));
	    if(curIndex == null) continue;
	    else answer.append(curIndex);
	}
	return Integer.valueOf(answer.toString());
    }
    
    /*
      Returns a map containing the proper mappings between characters and their index in the code.
     */
    public Map<Character, Integer> getKeyMappings(final String key) {
	Map<Character, Integer> mappings = new HashMap<>();
	final int lastIndex = key.length() - 1;
	
	for(int i = 0; i < key.length(); i++) {
	    final Character curChar = key.charAt(i);
	    if(i == lastIndex) mappings.put(curChar, 0);
	    else mappings.put(curChar, i + 1);
	}
	return mappings;
    }
}
