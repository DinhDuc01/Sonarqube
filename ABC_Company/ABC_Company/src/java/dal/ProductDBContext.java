package dal;

import dal.DBContext;
import java.util.ArrayList;
import model.Product;
import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ProductDBContext extends DBContext<Product> {

    // ✅ Thêm phương thức này để test có thể truyền connection giả lập
    public void setConnection(Connection connection) {
        this.connection = connection;
    }

    @Override
    public void insert(Product model) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public void update(Product model) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public void delete(Product model) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public ArrayList<Product> list() {
        String sql = "SELECT pid, pname, description FROM Products";
        ArrayList<Product> products = new ArrayList<>();
        
        try (PreparedStatement stm = connection.prepareStatement(sql);
             ResultSet rs = stm.executeQuery()) {
            
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("pid"));
                p.setName(rs.getString("pname"));
                p.setDescription(rs.getString("description"));
                products.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }

        return products;
    }

    @Override
    public Product get(int id) {
        Product product = null;
        String sql = "SELECT pid, pname FROM Products WHERE pid = ?";
        
        try (PreparedStatement stm = connection.prepareStatement(sql)) {
            stm.setInt(1, id);
            try (ResultSet rs = stm.executeQuery()) {
                if (rs.next()) {
                    product = new Product();
                    product.setId(rs.getInt("pid"));
                    product.setName(rs.getString("pname"));
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }

        return product;
    }
}
