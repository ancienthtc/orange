package functionTest;

import com.alibaba.fastjson.JSON;
import com.jd.orange.dao.GoodsMapper;
import com.jd.orange.dao.OrderMapper;
import com.jd.orange.service.OrderService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring-mvc.xml","classpath:spring-mybatis.xml","classpath:mybatis-config.xml"})
public class InterfaceTest {

    @Autowired
    private OrderService orderService;

    @Resource
    private OrderMapper orderMapper;

    @Resource
    private GoodsMapper goodsMapper;

    @Test
    public void test()
    {
        //orderService.accept("15159973375926ivt5nw");
    }

    @Test
    public void test2()
    {
        System.out.println(JSON.toJSONString( orderService.getUserOrderByStatus(3,1,5,0,0) ));
    }

    @Test
    public void test3()
    {
        System.out.println(JSON.toJSONString( orderService.getUserOrderByStatus( 3,1,5,0,1) ) );
    }

    @Test
    public void test4()
    {
        System.out.println( JSON.toJSON( orderMapper.getUserOrderByStatus(3,0,0) ) );
    }

    @Test
    public void test5()
    {
        System.out.println( JSON.toJSON( orderMapper.test(3,0,0)  ) );
    }

    @Test
    public void test6()
    {
        orderService.pay("1516955620328ZFKH0Z2","1",0);
    }

    @Test
    public void test7()
    {
        System.out.println(JSON.toJSONString( orderService.getUserOrderByStatus(3,1,5,1,1)));
    }

    @Test
    public void test8()
    {
        System.out.println( JSON.toJSON( goodsMapper.goodsSearch(new String[]{"A"}) ) );
    }

}
