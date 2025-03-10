
import model.Product;

import org.junit.Test;
import static org.junit.Assert.*;

public class ProductTest {

  @Test // Bắt buộc phải có
    public void testSetName() {
        Product product = new Product();
        product.setName("Laptop");
        assertEquals("Laptop", product.getName());
    }

    @Test
    public void testSetId() {
        Product product = new Product();
        product.setId(101);
        assertEquals(101, product.getId());
    }
}