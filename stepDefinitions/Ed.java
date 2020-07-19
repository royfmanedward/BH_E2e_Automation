package stepDefinitions;
import java.util.HashMap;
import java.util.Map;

public class Ed {

    public static void main(String... argvs) {
        load();
        System.out.println(convert("3,2,3,4"));
       // System.out.println(convert("1,0,0"));
        //System.out.println(convert("1,0"));
       // System.out.println(convert("1"));
       // System.out.println(convert("1,0,1,2"));
        //System.out.println(convert("1,2,3,4,5"));
    }

    private static String convert(String a) {
        String[] ar = a.split(",");
        String result = "";
        for(int i=0; i<ar.length; i++){
            int unit = ar.length-1-i;
            Map<String, String> c = converter.get(unit);
            String value = ar[i];
            if((unit==1 || unit==4) && value.equals("1")){
                c=digits;
                i++;
                value=value+ar[i];
            }
            String sValue = c.get(value);
            result = result.trim() + " " + sValue + " " + (sValue.isBlank() ? "" : units.get(unit));
        }
        return result.trim();
    }

    private static Map<String, String> digits = new HashMap<>();
    private static Map<String, String> tens = new HashMap<>();
    private static Map<String, String> teens = new HashMap<>();
    private static Map<Integer, String> units = new HashMap<>();
    private static Map<Integer, Map<String, String>> converter = new HashMap<>();

    private static void load(){
        digits.put ("0", "");
        digits.put("1", "one");
        digits.put("2", "two");
        digits.put("3", "three");
        digits.put("4", "four");
        digits.put("5", "five");
        digits.put("6", "six");
        digits.put("7", "seven");
        digits.put("8", "eight");
        digits.put("9", "nine");

        digits.put("10", "ten");
        digits.put("11", "eleven");
        digits.put("12", "twelve");
        digits.put("13", "thirteen");
        digits.put("14", "fourteen");
        digits.put("15", "fifteen");
        digits.put("16", "sixteen");
        digits.put("17", "seventeen");
        digits.put("18", "eighteen");
        digits.put("19", "nineteen");

        tens.put("0", "");
        // tens.put("1", "ten");
        tens.put("2", "twenty");
        tens.put("3", "thirty");
        tens.put("4", "fourty");
        tens.put("5", "fifty");
        tens.put("6", "sixty");
        tens.put("7", "seventy");
        tens.put("8", "eighty");
        tens.put("9", "ninety");

        units.put(0, "");
        units.put(1, "");
        units.put(2, "hundred");
        units.put(3, "thousand");
        units.put(4, "thousand");

        converter.put(0, digits);
        converter.put(1, tens);
        converter.put(2, digits);
        converter.put(3, digits);
        converter.put(4, digits);

    }

}
