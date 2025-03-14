package algorithm;

import org.junit.Test;
import static org.junit.Assert.*;

public class FactorialTest {

    public FactorialTest() {
    }

    // Test giai thừa của số dương
    @Test
    public void testFactorialPositive() {
        int n = 5;
        int expected = 120;
        int result = Factorial.factorial(n);

        System.out.println("Test factorial(" + n + ") = " + result);

        assertEquals(expected, result);
    }

    // Test giai thừa của 0 (0! = 1)
    @Test
    public void testFactorialZero() {
        int n = 0;
        int expected = 1;
        int result = Factorial.factorial(n);

        System.out.println("Test factorial(" + n + ") = " + result);

        assertEquals(expected, result);
    }

    // Test giai thừa của 1 (1! = 1)
    @Test
    public void testFactorialOne() {
        int n = 1;
        int expected = 1;
        int result = Factorial.factorial(n);

        System.out.println("Test factorial(" + n + ") = " + result);

        assertEquals(expected, result);
    }

    // Test giai thừa của 3 (3! = 6)
    @Test
    public void testFactorialThree() {
        int n = 3;
        int expected = 6;
        int result = Factorial.factorial(n);

        System.out.println("Test factorial(" + n + ") = " + result);

        assertEquals(expected, result);
    }

    // ✅ Test ngoại lệ khi nhập số âm
    @Test
    public void testFactorialNegativeInput() {
        int n = -1;  
      

        Exception exception = assertThrows(IllegalArgumentException.class, () -> Factorial.factorial(n));

        System.out.println("Exception message: " + exception.getMessage());

        assertEquals("Input cannot be negative", exception.getMessage()); // Kiểm tra message có đúng không
    }

    // ✅ Test ngoại lệ khi nhập null
    @Test
    public void testFactorialNullInput() {
        Integer n = null;

    

        Exception exception = assertThrows(IllegalArgumentException.class, () -> Factorial.factorial(n));

        System.out.println("Exception message: " + exception.getMessage());

        assertEquals("Input cannot be null", exception.getMessage()); // Kiểm tra message có đúng không
    }
}
