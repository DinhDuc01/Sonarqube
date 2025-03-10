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
public class MultiplicationTableTest {
    
    public MultiplicationTableTest() {
    }

    @Test
    public void testMain() {
    }
    
    @Test
    public void testGenerateTable() {
        String expectedTableFor2 = "2 x 1 = 2\n" +
                                   "2 x 2 = 4\n" +
                                   "2 x 3 = 6\n" +
                                   "2 x 4 = 8\n" +
                                   "2 x 5 = 10\n" +
                                   "2 x 6 = 12\n" +
                                   "2 x 7 = 14\n" +
                                   "2 x 8 = 16\n" +
                                   "2 x 9 = 18\n" +
                                   "2 x 10 = 20";
        
        assertEquals(expectedTableFor2, MultiplicationTable.generateTable(2));
        assertEquals("Invalid input", MultiplicationTable.generateTable(10)); // Kiểm tra input sai
    }
    
}
