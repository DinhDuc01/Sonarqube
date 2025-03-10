/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package math;

import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author default
 */
public class PrimeCheckerTest {
    
    public PrimeCheckerTest() {
    }

    @Test
    public void testIsPrime() {
        assertTrue(PrimeChecker.isPrime(2));  
        assertTrue(PrimeChecker.isPrime(7));  
    }
    
    @Test
    public void testNotPrime() { 
        assertFalse(PrimeChecker.isPrime(10)); 
        assertFalse(PrimeChecker.isPrime(1));  
        assertFalse(PrimeChecker.isPrime(-5)); 
    }
    
    @Test
    public void testNegativenum() { 
        assertFalse(PrimeChecker.isPrime(-5)); 
    }
  
    
}
