package stepDefinitions;


public class ReverseString {

    public static void main(String[] args) {




        //Write a Java Program to find whether a String is palindrome or not:
        String original="hellhe";
        String reversed="";
        for (int i =original.length()-1; i>=0; i--) {
            reversed=reversed+original.charAt(i); }
        if (original.equals(reversed)) {
            System.out.println("Given String is Palindrome");
        }else {
            System.out.println("Given String is NOT Palindrome"); }
    }}









