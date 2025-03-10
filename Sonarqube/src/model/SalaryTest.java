import model.Salary;
import org.junit.Test;
import static org.junit.Assert.*;

public class SalaryTest {

    @Test
    public void testSetId() {
        Salary salary = new Salary(); // Tạo đối tượng Salary
        salary.setId(2); // Đặt ID là 1
        assertEquals(2, salary.getId()); // Kiểm tra xem getId() có đúng không
        
    }

    @Test
    public void testSetLevel() {
        Salary salary = new Salary(); // Tạo đối tượng Salary
        salary.setLevel("Senior"); // Đặt cấp bậc là Senior
        assertEquals("Senior", salary.getLevel()); // Kiểm tra xem getLevel() có đúng không
    }

    @Test
    public void testSetAmount() {
        Salary salary = new Salary(); // Tạo đối tượng Salary
        salary.setAmount(5000.0); // Đặt lương là 5000.0
        assertEquals(5000.0, salary.getAmount(), 0.01); // Kiểm tra getAmount() (cho phép sai số nhỏ)
    }
}