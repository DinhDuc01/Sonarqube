/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package dal;

import java.util.ArrayList;
import java.util.List;
import model.Employee;
import model.WorkAssignment;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;
import static org.mockito.Mockito.doNothing;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

/**
 *
 * @author Admin
 */
public class WorkAssignmentDBContextIT {
    
    public WorkAssignmentDBContextIT() {
    }
    private WorkAssignmentDBContext workAssignmentDB; // Mock DAO

   
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
        workAssignmentDB = mock(WorkAssignmentDBContext.class); // Giả lập WorkAssignmentDBContext
    }
    
    @After
    public void tearDown() {
    }

    /**
     * Test of deleteAssignment method, of class WorkAssignmentDBContext.
     */
     @Test
    public void testDeleteAssignment() {
        System.out.println("deleteAssignment");
        int assignmentId = 1;

        // Giả lập phương thức void
        doNothing().when(workAssignmentDB).deleteAssignment(assignmentId);

        // Gọi phương thức
        workAssignmentDB.deleteAssignment(assignmentId);

        // Kiểm tra xem phương thức có được gọi đúng không
        verify(workAssignmentDB, times(1)).deleteAssignment(assignmentId);
    }

    /**
     * Test of insert method, of class WorkAssignmentDBContext.
     */
     @Test
    public void testInsert() {
        System.out.println("insert");
        WorkAssignment assignment = new WorkAssignment();
        assignment.setDetailId(1);
        assignment.setEmployeeId(2);
        assignment.setQuantity(10);
        assignment.setNote("Test Note");

        // Giả lập phương thức void insert
        doNothing().when(workAssignmentDB).insert(assignment);

        // Gọi phương thức
        workAssignmentDB.insert(assignment);

        // Kiểm tra xem phương thức có được gọi đúng không
        verify(workAssignmentDB, times(1)).insert(assignment);
    }

    /**
     * Test of getAssignedEmployeesByDetailId method, of class WorkAssignmentDBContext.
     */
    @Test
    public void testGetAssignedEmployeesByDetailId() {
        System.out.println("getAssignedEmployeesByDetailId");
        int detailId = 1;

        // Tạo dữ liệu giả
        List<WorkAssignment> mockAssignments = new ArrayList<>();
        WorkAssignment assignment = new WorkAssignment();
        assignment.setId(1);
        assignment.setDetailId(detailId);
        assignment.setEmployeeId(2);
        assignment.setQuantity(5);
        assignment.setNote("Sample Work");

        Employee employee = new Employee();
        employee.setId(2);
        employee.setName("John Doe");
        assignment.setEmployee(employee);

        mockAssignments.add(assignment);

        // Giả lập phương thức
        when(workAssignmentDB.getAssignedEmployeesByDetailId(detailId)).thenReturn(mockAssignments);

        // Gọi phương thức
        List<WorkAssignment> result = workAssignmentDB.getAssignedEmployeesByDetailId(detailId);

        // Kiểm tra kết quả
        assertNotNull(result);
        assertEquals(1, result.size());
        assertEquals("John Doe", result.get(0).getEmployee().getName());

        // Kiểm tra phương thức có được gọi đúng không
        verify(workAssignmentDB, times(1)).getAssignedEmployeesByDetailId(detailId);
    }

    /**
     * Test of update method, of class WorkAssignmentDBContext.
     */
//    @Test
//    public void testUpdate() {
//        System.out.println("update");
//        WorkAssignment model = null;
//        WorkAssignmentDBContext instance = new WorkAssignmentDBContext();
//        instance.update(model);
//        // TODO review the generated test code and remove the default call to fail.
//        fail("The test case is a prototype.");
//    }
//
//    /**
//     * Test of delete method, of class WorkAssignmentDBContext.
//     */
//    @Test
//    public void testDelete() {
//        System.out.println("delete");
//        WorkAssignment model = null;
//        WorkAssignmentDBContext instance = new WorkAssignmentDBContext();
//        instance.delete(model);
//        // TODO review the generated test code and remove the default call to fail.
//        fail("The test case is a prototype.");
//    }
//
//    /**
//     * Test of list method, of class WorkAssignmentDBContext.
//     */
//    @Test
//    public void testList() {
//        System.out.println("list");
//        WorkAssignmentDBContext instance = new WorkAssignmentDBContext();
//        ArrayList<WorkAssignment> expResult = null;
//        ArrayList<WorkAssignment> result = instance.list();
//        assertEquals(expResult, result);
//        // TODO review the generated test code and remove the default call to fail.
//        fail("The test case is a prototype.");
//    }
//
//    /**
//     * Test of get method, of class WorkAssignmentDBContext.
//     */
//    @Test
//    public void testGet() {
//        System.out.println("get");
//        int id = 0;
//        WorkAssignmentDBContext instance = new WorkAssignmentDBContext();
//        WorkAssignment expResult = null;
//        WorkAssignment result = instance.get(id);
//        assertEquals(expResult, result);
//        // TODO review the generated test code and remove the default call to fail.
//        fail("The test case is a prototype.");
//    }
    
}
