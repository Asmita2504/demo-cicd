package com.demo.cicd;

public class TestCheckstyle {
    public void test() {
        // Break the long string into multiple parts
        String s = "This is a very long line that should trigger the Checkstyle "
                 + "LineLength rule if it exceeds 120 characters";
    }
}
