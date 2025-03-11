package dal;

import model.Product;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import static org.junit.Assert.*;
import static org.mockito.Mockito.*;

public class ProductDBContextTest {

    private ProductDBContext productDB;

    @Mock
    private Connection mockConnection;

    @Mock
    private PreparedStatement mockStatement;

    @Mock
    private ResultSet mockResultSet;

    @Before
    public void setUp() {
        MockitoAnnotations.openMocks(this);
        productDB = new ProductDBContext();
        productDB.setConnection(mockConnection); // Sử dụng setter thay vì gán trực tiếp
    }

    @After
    public void tearDown() {
        productDB = null;
    }

    // ✅ TEST CASE 1: list() - Có dữ liệu
    @Test
    public void testList_WithData() throws SQLException {
        System.out.println("Testing list() method with data...");

        when(mockConnection.prepareStatement(anyString())).thenReturn(mockStatement);
        when(mockStatement.executeQuery()).thenReturn(mockResultSet);
        when(mockResultSet.next()).thenReturn(true, false);
        when(mockResultSet.getInt("pid")).thenReturn(1);
        when(mockResultSet.getString("pname")).thenReturn("Mock Product");
        when(mockResultSet.getString("description")).thenReturn("Mock Description");

        ArrayList<Product> products = productDB.list();

        assertNotNull(products);
        assertEquals(1, products.size());
        assertEquals("Mock Product", products.get(0).getName());
        assertEquals("Mock Description", products.get(0).getDescription());
    }

    // ✅ TEST CASE 2: list() - Không có dữ liệu
    @Test
    public void testList_Empty() throws SQLException {
        System.out.println("Testing list() method with no data...");

        when(mockConnection.prepareStatement(anyString())).thenReturn(mockStatement);
        when(mockStatement.executeQuery()).thenReturn(mockResultSet);
        when(mockResultSet.next()).thenReturn(false);

        ArrayList<Product> products = productDB.list();

        assertNotNull(products);
        assertEquals(0, products.size());
    }

    // ✅ TEST CASE 3: list() - Dữ liệu chính xác
    @Test
    public void testList_ValidData() throws SQLException {
        System.out.println("Testing list() method with correct data...");

        when(mockConnection.prepareStatement(anyString())).thenReturn(mockStatement);
        when(mockStatement.executeQuery()).thenReturn(mockResultSet);
        when(mockResultSet.next()).thenReturn(true, false);
        when(mockResultSet.getInt("pid")).thenReturn(1);
        when(mockResultSet.getString("pname")).thenReturn("Valid Product");
        when(mockResultSet.getString("description")).thenReturn("Valid Description");

        ArrayList<Product> products = productDB.list();

        assertNotNull(products);
        assertEquals(1, products.size());
        assertEquals("Valid Product", products.get(0).getName());
        assertEquals("Valid Description", products.get(0).getDescription());
    }

    // ✅ TEST CASE 4: get(int id) - ID tồn tại
    @Test
    public void testGet_ExistingProduct() throws SQLException {
        System.out.println("Testing get() method with existing product...");

        int productId = 1;
        String productName = "Mock Product";

        when(mockConnection.prepareStatement(anyString())).thenReturn(mockStatement);
        when(mockStatement.executeQuery()).thenReturn(mockResultSet);
        when(mockResultSet.next()).thenReturn(true);
        when(mockResultSet.getInt("pid")).thenReturn(productId);
        when(mockResultSet.getString("pname")).thenReturn(productName);

        Product product = productDB.get(productId);

        assertNotNull(product);
        assertEquals(productId, product.getId());
        assertEquals(productName, product.getName());
    }

    // ✅ TEST CASE 5: get(int id) - ID không tồn tại
    @Test
    public void testGet_NonExistingProduct() throws SQLException {
        System.out.println("Testing get() method with non-existing product...");

        int productId = 99;

        when(mockConnection.prepareStatement(anyString())).thenReturn(mockStatement);
        when(mockStatement.executeQuery()).thenReturn(mockResultSet);
        when(mockResultSet.next()).thenReturn(false);

        Product product = productDB.get(productId);

        assertNull(product);
    }

    // ✅ TEST CASE 6: get(int id) - Kiểm tra dữ liệu chính xác
    @Test
    public void testGet_ValidData() throws SQLException {
        System.out.println("Testing get() method with correct data...");

        int productId = 2;
        String productName = "Valid Product";

        when(mockConnection.prepareStatement(anyString())).thenReturn(mockStatement);
        when(mockStatement.executeQuery()).thenReturn(mockResultSet);
        when(mockResultSet.next()).thenReturn(true);
        when(mockResultSet.getInt("pid")).thenReturn(productId);
        when(mockResultSet.getString("pname")).thenReturn(productName);

        Product product = productDB.get(productId);

        assertNotNull(product);
        assertEquals(productId, product.getId());
        assertEquals(productName, product.getName());
    }
}
