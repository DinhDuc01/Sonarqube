
package dal;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;


public abstract class DBContext<T> {
    protected Connection connection;
    protected DBContext()
    {
        try {
            String user = "trwmnhhoang";
            String pass = "hoana192";
            String url = "jdbc:sqlserver://localhost\\SQLEXPRESS:1433;databaseName=ProductionSchedulingSystem_DB;trustServerCertificate=true;";
            
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(url, user, pass);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public abstract void insert(T model);
    public abstract void update(T model);
    public abstract void delete(T model);
    public abstract List<T> list();
    public abstract T get(int id);
}
