package algorithm;

import org.junit.Test;
import static org.junit.Assert.*;

public class FactorialTest {

    public FactorialTest() {
    }

    // Test giai thừa của một số
    @Test
    public void testFactorial() {
       
        // Test giai thừa của 5 (5! = 120)
        int n1 = 5;
        int expectedResult1 = 120;
        int result1 = Factorial.factorial(n1);
        assertEquals(expectedResult1, result1);  // Kiểm tra giai thừa của 5

        // Test giai thừa của 0 (0! = 1)
        int n2 = 0;
        int expectedResult2 = 1;
        int result2 = Factorial.factorial(n2);
        assertEquals(expectedResult2, result2);  // Kiểm tra giai thừa của 0

        // Test giai thừa của 1 (1! = 1)
        int n3 = 1;
        int expectedResult3 = 1;
        int result3 = Factorial.factorial(n3);
        assertEquals(expectedResult3, result3);  // Kiểm tra giai thừa của 1

        // Test giai thừa của 3 (3! = 6)
        int n4 = 3;
        int expectedResult4 = 6;
        int result4 = Factorial.factorial(n4);
        assertEquals(expectedResult4, result4);  // Kiểm tra giai thừa của 3

        // Test giai thừa của số âm, mong muốn lỗi (không có giai thừa cho số âm)
        int n5 = -1;
        try {
            Factorial.factorial(n5);
            fail("Expected IllegalArgumentException for negative input");
        } catch (IllegalArgumentException e) {
            // Đúng ngoại lệ được ném ra
        }

        // Test giai thừa của null input, mong muốn lỗi
        Integer n6 = null;
        try {
            Factorial.factorial(n6);
            fail("Expected IllegalArgumentException for null input");
        } catch (IllegalArgumentException e) {
            // Đúng ngoại lệ được ném ra
        }
    }

    // Test phương thức main
    @Test
    public void testMain() {
        System.out.println("main");
        String[] args = null;
        // Chạy phương thức main mà không gây lỗi
        Factorial.main(args);
    }
}
