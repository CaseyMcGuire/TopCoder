import java.nio.file.*;
import java.util.stream.*;
import java.util.*;
import java.io.IOException;
class Test {

    public static void main(String[] args) {
	int[][] inputs = getInputs("../test/input.txt");
	int[] outputs = getAnswers("../test/solution.txt");
	AdvertisingAgency solution = new AdvertisingAgency();
	for(int i = 0; i < inputs.length ; i++) {
	    int answer = solution.numberOfRejections(inputs[i]);
	    if(outputs[i] != answer){
		System.out.println("FAIL");
		System.out.println("Expected: " + outputs[i]);
		System.out.println("Answer: " + answer);
		return;
	    }
	}
	System.out.println("Passed");
    }

    public static int[][] getInputs(String file) {
	final List<String> acc = new ArrayList<String>();
	Stream<String> lines = null;
	try {
	    lines = Files.lines(Paths.get(file));
	    lines.forEach(line -> acc.add(line));
	}
	catch(IOException e) {
	    System.err.println("The file was not found");
	}
	finally {
	    if(lines != null) lines.close();
	}
	
	int[][] inputs = new int[acc.size()][];
	for(int i = 0 ; i < acc.size(); i++) {
	    String[] curLine = acc.get(i).split(" ");
	    inputs[i] = convertLineOfNumToIntArray(curLine);
	}
	return inputs;
    }

    private static int[] convertLineOfNumToIntArray(String[] line) {
	int[] toReturn = new int[line.length];
	for(int i = 0; i < line.length; i++) {
	    toReturn[i] = Integer.parseInt(line[i]);
	}
	return toReturn;
    }

    public static int[] getAnswers(String file) {
	final List<String> acc = new ArrayList<String>();
	Stream<String> lines = null;
	
	try {
	    lines = Files.lines(Paths.get(file));
	    lines.forEach(line -> acc.add(line));
	}
	catch(IOException e) {
	    System.err.println("File was not found");
	}
	int[] answers = new int[acc.size()];
	for(int i = 0; i < acc.size(); i++) {
	    answers[i] = Integer.parseInt(acc.get(i));
	}
	return answers;
    }
}
