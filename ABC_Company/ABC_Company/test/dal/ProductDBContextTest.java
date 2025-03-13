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
        productDB.setConnection(mockConnection);
    }

    @After
    public void tearDown() {
        productDB = null;
    }

    @Test
    public void testList_WithData() throws SQLException {
        System.out.println("[TEST] Running testList_WithData...");

        when(mockConnection.prepareStatement(anyString())).thenReturn(mockStatement);
        when(mockStatement.executeQuery()).thenReturn(mockResultSet);
        when(mockResultSet.next()).thenReturn(true, false);
        when(mockResultSet.getInt("pid")).thenReturn(1);
        when(mockResultSet.getString("pname")).thenReturn("Mock Product");
        when(mockResultSet.getString("description")).thenReturn("Mock Description");

        ArrayList<Product> products = productDB.list();

        System.out.println("Output: " + products);
        assertNotNull(products);
        assertEquals(1, products.size());
        assertEquals("Mock Product", products.get(0).getName());
        assertEquals("Mock Description", products.get(0).getDescription());
    }

    @Test
    public void testList_Empty() throws SQLException {
        System.out.println("[TEST] Running testList_Empty...");

        when(mockConnection.prepareStatement(anyString())).thenReturn(mockStatement);
        when(mockStatement.executeQuery()).thenReturn(mockResultSet);
        when(mockResultSet.next()).thenReturn(false);

        ArrayList<Product> products = productDB.list();

        System.out.println("Output: " + products);
        assertNotNull(products);
        assertEquals(0, products.size());
    }

    @Test
    public void testList_ValidData() throws SQLException {
        System.out.println("[TEST] Running testList_ValidData...");

        when(mockConnection.prepareStatement(anyString())).thenReturn(mockStatement);
        when(mockStatement.executeQuery()).thenReturn(mockResultSet);
        when(mockResultSet.next()).thenReturn(true, false);
        when(mockResultSet.getInt("pid")).thenReturn(1);
        when(mockResultSet.getString("pname")).thenReturn("Valid Product");
        when(mockResultSet.getString("description")).thenReturn("Valid Description");

        ArrayList<Product> products = productDB.list();

        System.out.println("Output: " + products);
        assertNotNull(products);
        assertEquals(1, products.size());
        assertEquals("Valid Product", products.get(0).getName());
        assertEquals("Valid Description", products.get(0).getDescription());
    }

    @Test
    public void testGet_ExistingProduct() throws SQLException {
        System.out.println("[TEST] Running testGet_ExistingProduct...");

        int productId = 1;
        String productName = "Mock Product";

        when(mockConnection.prepareStatement(anyString())).thenReturn(mockStatement);
        when(mockStatement.executeQuery()).thenReturn(mockResultSet);
        when(mockResultSet.next()).thenReturn(true);
        when(mockResultSet.getInt("pid")).thenReturn(productId);
        when(mockResultSet.getString("pname")).thenReturn(productName);

        Product product = productDB.get(productId);

        System.out.println("Output: " + product);
        assertNotNull(product);
        assertEquals(productId, product.getId());
        assertEquals(productName, product.getName());
    }

    @Test
    public void testGet_NonExistingProduct() throws SQLException {
        System.out.println("[TEST] Running testGet_NonExistingProduct...");

        int productId = 99;

        when(mockConnection.prepareStatement(anyString())).thenReturn(mockStatement);
        when(mockStatement.executeQuery()).thenReturn(mockResultSet);
        when(mockResultSet.next()).thenReturn(false);

        Product product = productDB.get(productId);

        System.out.println("Output: " + product);
        assertNull(product);
    }

    @Test
    public void testGet_ValidData() throws SQLException {
        System.out.println("[TEST] Running testGet_ValidData...");

        int productId = 2;
        String productName = "Valid Product";

        when(mockConnection.prepareStatement(anyString())).thenReturn(mockStatement);
        when(mockStatement.executeQuery()).thenReturn(mockResultSet);
        when(mockResultSet.next()).thenReturn(true);
        when(mockResultSet.getInt("pid")).thenReturn(productId);
        when(mockResultSet.getString("pname")).thenReturn(productName);

        Product product = productDB.get(productId);

        System.out.println("Output: " + product);
        assertNotNull(product);
        assertEquals(productId, product.getId());
        assertEquals(productName, product.getName());
    }
}
