/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.ArrayList;
import model.Employee;
import java.sql.*;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Golden Lightning
 */
public class EmployeeDBContext extends DBContext<Employee> {

    public List<Employee> getAvailableEmployees(Date date, int sid, int departmentId) {
        List<Employee> employees = new ArrayList<>();
        String sql = "WITH c AS ( \n"
                + "    SELECT e.eid, e.ename, COALESCE(COUNT(s.sid), 0) AS shift_count \n"
                + "    FROM Employees e \n"
                + "    LEFT JOIN WorkAssignments w ON e.eid = w.eid \n"
                + "    LEFT JOIN PlanDetails pd ON w.pdid = pd.pdid AND pd.date = ? \n"
                + "    LEFT JOIN Shifts s ON s.sid = pd.sid \n"
                + "    WHERE e.did = ? \n"
                + "    GROUP BY e.eid, e.ename \n"
                + "    HAVING COUNT(s.sid) < 2 \n"
                + "), t AS ( \n"
                + "    SELECT wa.eid \n"
                + "    FROM WorkAssignments wa \n"
                + "    JOIN PlanDetails pd ON wa.pdid = pd.pdid \n"
                + "    WHERE pd.date = ? \n"
                + "      AND pd.sid = ? \n"
                + ") \n"
                + "SELECT e.eid, e.ename, e.phonenumber, e.address, e.dob, e.sid \n"
                + "FROM Employees e \n"
                + "WHERE e.did = ? \n"
                + "  AND e.eid NOT IN (SELECT eid FROM t) \n"
                + "  AND e.eid IN (SELECT eid FROM c);";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setDate(1, date);              // For CTE c
            ps.setInt(2, departmentId);       // For CTE c
            ps.setDate(3, date);              // For CTE t
            ps.setInt(4, sid);                // For CTE t
            ps.setInt(5, departmentId);       // For final selection

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Employee employee = new Employee();
                employee.setId(rs.getInt("eid"));
                employee.setName(rs.getString("ename"));
                employee.setPhoneNumber(rs.getString("phonenumber"));
                employee.setAddress(rs.getString("address"));
                employee.setDob(rs.getDate("dob"));
                employee.setSalaryId(rs.getInt("sid"));
                employees.add(employee);
            }
        } catch (SQLException e) {
            Logger.getLogger(EmployeeDBContext.class.getName()).log(Level.SEVERE, null, e);
        }
        return employees;
    }

    @Override
    public ArrayList<Employee> list() {
        ArrayList<Employee> employees = new ArrayList<>();
        String sql = "SELECT eid, ename, did, phonenumber, address, dob, sid FROM Employees";
        PreparedStatement stm = null;
        try {
            stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Employee employee = new Employee();
                employee.setId(rs.getInt("eid"));
                employee.setName(rs.getString("ename"));
                employee.setDepartmentId(rs.getInt("did"));
                employee.setPhoneNumber(rs.getString("phonenumber"));
                employee.setAddress(rs.getString("address"));
                employee.setDob(rs.getDate("dob"));
                employee.setSalaryId(rs.getInt("sid"));
                employees.add(employee);
            }
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (stm != null) {
                    stm.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(EmployeeDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return employees;
    }

   public List<Employee> listByDepartment(int departmentId) {
        // Sử dụng List thay vì ArrayList
        List<Employee> employees = new ArrayList<>();
        String sql = "SELECT eid, ename, did, phonenumber, address, dob, sid FROM Employees WHERE did = ?";
        
        // Sử dụng try-with-resources để tự động đóng các tài nguyên
        try (PreparedStatement stm = connection.prepareStatement(sql)) {
            stm.setInt(1, departmentId);
            try (ResultSet rs = stm.executeQuery()) {
                while (rs.next()) {
                    Employee employee = new Employee();
                    employee.setId(rs.getInt("eid"));
                    employee.setName(rs.getString("ename"));
                    employee.setDepartmentId(rs.getInt("did"));
                    employee.setPhoneNumber(rs.getString("phonenumber"));
                    employee.setAddress(rs.getString("address"));
                    employee.setDob(rs.getDate("dob"));
                    employee.setSalaryId(rs.getInt("sid"));
                    employees.add(employee);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } 
        // Không cần đóng connection trong finally nữa vì try-with-resources sẽ tự động đóng tất cả tài nguyên khi kết thúc
        return employees;
    }


    @Override
    public Employee get(int id) {
        Employee employee = null;
        String sql = "SELECT eid, ename, did, phonenumber, address, dob, sid FROM Employees WHERE eid = ?";
        PreparedStatement stm = null;
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                employee = new Employee();
                employee.setId(rs.getInt("eid"));
                employee.setName(rs.getString("ename"));
                employee.setDepartmentId(rs.getInt("did"));
                employee.setPhoneNumber(rs.getString("phonenumber"));
                employee.setAddress(rs.getString("address"));
                employee.setDob(rs.getDate("dob"));
                employee.setSalaryId(rs.getInt("sid"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (stm != null) {
                    stm.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(EmployeeDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return employee;
    }

    @Override
    public void insert(Employee model) {
        String sql = "INSERT INTO Employees (ename, did, phonenumber, address, dob, sid) VALUES (?, ?, ?, ?, ?, ?)";
        PreparedStatement stm = null;
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, model.getName());
            stm.setInt(2, model.getDepartmentId());
            stm.setString(3, model.getPhoneNumber());
            stm.setString(4, model.getAddress());
            stm.setDate(5, model.getDob());
            stm.setInt(6, model.getSalaryId());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (stm != null) {
                    stm.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(EmployeeDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    @Override
    public void update(Employee model) {
        String sql = "UPDATE Employees SET ename = ?, did = ?, phonenumber = ?, address = ?, dob = ?, sid = ? WHERE eid = ?";
        PreparedStatement stm = null;
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, model.getName());
            stm.setInt(2, model.getDepartmentId());
            stm.setString(3, model.getPhoneNumber());
            stm.setString(4, model.getAddress());
            stm.setDate(5, model.getDob());
            stm.setInt(6, model.getSalaryId());
            stm.setInt(7, model.getId());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (stm != null) {
                    stm.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(EmployeeDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    @Override
    public void delete(Employee model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
