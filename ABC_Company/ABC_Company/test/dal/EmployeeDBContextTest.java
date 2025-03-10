/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package dal;

import static org.mockito.Mockito.*;
import static org.junit.Assert.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import model.Employee;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.MockitoJUnitRunner;

@RunWith(MockitoJUnitRunner.class)
public class EmployeeDBContextTest {

    @Mock
    private Connection mockConnection;

    @Mock
    private PreparedStatement mockStatement;

    @Mock
    private ResultSet mockResultSet;

    @InjectMocks
    private EmployeeDBContext employeeDBContext;

    @Before
    public void setUp() throws Exception {
        // Thiết lập mock cho Connection
        when(mockConnection.prepareStatement(anyString())).thenReturn(mockStatement);
    }

    @Test
    public void testGetAvailableEmployees() throws SQLException {
        // Kiểm tra phương thức lấy danh sách nhân viên sẵn có
        Date date = Date.valueOf("2025-03-10");
        int sid = 2;
        int departmentId = 1;
        
        when(mockStatement.executeQuery()).thenReturn(mockResultSet);
        when(mockResultSet.next()).thenReturn(true, false);
        when(mockResultSet.getInt("eid")).thenReturn(101);
        when(mockResultSet.getString("ename")).thenReturn("John Doe");
        when(mockResultSet.getString("phonenumber")).thenReturn("123456789");
        when(mockResultSet.getString("address")).thenReturn("123 Street");
        when(mockResultSet.getDate("dob")).thenReturn(Date.valueOf("1990-01-01"));
        when(mockResultSet.getInt("sid")).thenReturn(5);
        
        List<Employee> employees = employeeDBContext.getAvailableEmployees(date, sid, departmentId);
        
        assertEquals(1, employees.size());
        assertEquals(101, employees.get(0).getId());
        assertEquals("John Doe", employees.get(0).getName());
    }

    @Test
    public void testInsert() throws SQLException {
        // Kiểm tra phương thức thêm nhân viên
        Employee employee = new Employee();
        employee.setName("Jane Doe");
        employee.setDepartmentId(1);
        employee.setPhoneNumber("987654321");
        employee.setAddress("456 Avenue");
        employee.setDob(Date.valueOf("1995-05-05"));
        employee.setSalaryId(3);
        
        employeeDBContext.insert(employee);
        
        verify(mockStatement, times(1)).setString(1, "Jane Doe");
        verify(mockStatement, times(1)).setInt(2, 1);
        verify(mockStatement, times(1)).setString(3, "987654321");
        verify(mockStatement, times(1)).setString(4, "456 Avenue");
        verify(mockStatement, times(1)).setDate(5, Date.valueOf("1995-05-05"));
        verify(mockStatement, times(1)).setInt(6, 3);
        verify(mockStatement, times(1)).executeUpdate();
    }

    @Test
    public void testList() throws SQLException {
        // Kiểm tra phương thức lấy danh sách nhân viên
        when(mockStatement.executeQuery()).thenReturn(mockResultSet);
        when(mockResultSet.next()).thenReturn(true, false);
        when(mockResultSet.getInt("eid")).thenReturn(201);
        when(mockResultSet.getString("ename")).thenReturn("Alice Smith");
        
        ArrayList<Employee> employees = employeeDBContext.list();
        
        assertEquals(1, employees.size());
        assertEquals(201, employees.get(0).getId());
        assertEquals("Alice Smith", employees.get(0).getName());
    }
}

