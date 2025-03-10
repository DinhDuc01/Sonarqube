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
public class SumCalculatorTest {
    
    public SumCalculatorTest() {
    }

    @Test
    public void testMain() {
    }

    @Test
    public void testCalculateSum_1() {
        assertEquals(21, SumCalculator.calculateSum(6)); 
        assertEquals(78, SumCalculator.calculateSum(12)); 
        assertEquals(1, SumCalculator.calculateSum(1)); 
    }
    
    @Test
    public void testCalculateSum_2() {
        assertEquals(15, SumCalculator.calculateSum(5)); 
        assertEquals(55, SumCalculator.calculateSum(10)); 
        assertEquals(0, SumCalculator.calculateSum(0)); 
    }
    
    @Test
    public void testCalculateSum_3() {
        assertEquals(36, SumCalculator.calculateSum(8)); 
        assertEquals(105, SumCalculator.calculateSum(14)); 
        assertEquals(6, SumCalculator.calculateSum(3)); 
    }
    
}
