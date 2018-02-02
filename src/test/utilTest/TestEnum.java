package utilTest;

import com.jd.orange.common.AdminCheck;
import com.jd.orange.common.Alevel;
import com.jd.orange.util.Folder;
import org.junit.Test;

public class TestEnum {

    @Test
    public void test1()
    {
        System.out.println(Folder.Default+" -- "+Folder.Default.getVal());
    }

    @Test
    @AdminCheck(Alevel.L1)
    public void test2()
    {
        System.out.println(Alevel.L1.value());
    }
}
