package functionTest;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.ValueFilter;
import com.jd.orange.dao.CartMapper;
import com.jd.orange.dao.FormatMapper;
import com.jd.orange.dao.GoodsMapper;
import com.jd.orange.dao.OrderMapper;
import com.jd.orange.model.Format;
import com.jd.orange.model.Goods;
import com.jd.orange.model.Part;
import com.jd.orange.model.User;
import com.jd.orange.service.GoodsService;
import com.jd.orange.service.OrderService;
import com.jd.orange.service.PartService;
import com.jd.orange.service.UserService;
import com.jd.orange.util.pagehelper.PagedResult;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring-mvc.xml","classpath:spring-mybatis.xml","classpath:mybatis-config.xml"})
//@EnableAspectJAutoProxy(proxyTargetClass = true)
public class MybatisTest {

    @Autowired
    private GoodsService goodsService;

    @Autowired
    private PartService partService;

    @Autowired
    private UserService userService;

    @Autowired
    private OrderService orderService;

    @Resource
    private OrderMapper orderMapper;

    @Resource
    private GoodsMapper goodsMapper;

    @Resource
    private FormatMapper formatMapper;

    @Resource
    private CartMapper cartMapper;



    private ValueFilter filter = new ValueFilter() {
        @Override
        public Object process(Object obj, String s, Object v) {
            if(v==null)
                return "";
            return v;
        }
    };

    @Test
    public void test1(){
        List<Part> partsList=partService.getFatherPart();
    }

    @Test
    public void test2()
    {
        List<Goods> goodsList;
        PagedResult<Goods> goodsPagedResult;
        //goodsList=goodsService.getGoodsList(null,null,null);//ok
        //goodsList=goodsService.getGoodsList(null,"2017-12-01 18:34:25",null);
        //goodsList=goodsService.getGoodsList(null,null,"2017-12-01 18:34:25");//ok
        //goodsList=goodsService.getGoodsList(null,"2017-12-01 18:34:25","2017-12-12 18:34:25");//ok
        //goodsList=goodsService.getGoodsList(null,"2017-12-12 18:34:25","2017-12-01 18:34:25");//ok
        //goodsList=goodsService.getGoodsList("2","2017-12-12 18:34:25","2017-12-01 18:34:25");//ok
        goodsPagedResult=goodsService.getGoodsList(0,10,"","2017-12-2","");//ok
//        for (Goods goods:goodsList)
//        {
//            System.out.println(goods.getId() + "  " + goods.getName() + "  " + goods.getPname() );
//        }

    }

    @Test
    public void test3()
    {
        List<User> userList;
        //userList=userService.getUsers(null,null,null,null,null);//ok
        //userList=userService.getUsers(null,"2017-12-02 10:52:37",null,null,null);//ok
        //userList=userService.getUsers(null,"2017-12-02 10:52:37","2017-12-14 13:51:21",null,null);//ok
        //userList=userService.getUsers(null,"2017-12-02 10:52:37","2017-12-14 13:51:21","2017-12-14 13:51:34","2017-12-14 13:51:34");//ok
        userList=userService.getUsers("qq",null,null,null,null);//ok
        for (User user:userList)
        {
            System.out.println(user.getId() + "  " + user.getNickname() + "  " + user.getEmail() );
        }
    }

    //before is error
//    @Before
//    public void before(){
//        @SuppressWarnings("resource")
//        ApplicationContext context = new ClassPathXmlApplicationContext(new String[]{"classpath:spring-mvc.xml"
//                ,"classpath:spring-mybatis.xml","mybatis-config.xml"});
//        //userService = (UserService) context.getBean("userServiceImpl");
//        //goodsService = (GoodsService) context.getBean("GoodsServiceImpl");
//        partService=(PartService) context.getBean("PartServiceImpl");
//
//    }

    @Test
    public void test1_error(){

        List<Part> goodsList=partService.getFatherPart();
//        Goods goods= new Goods();
//        List<Goods> goodsList=goodsService.getGoodsList();
//        for (Goods goods1:goodsList)
//        {
//            System.out.println(goods1.getId());
//        }
        //User user = new User();
        //user.setNickname("你好");
        //user.setState(2);
        //System.out.println(userService.insertUser(user));
    }

    @Test
    public void test4()
    {
        Map<String,Integer> map=orderMapper.countOrderStatus(0);
        System.out.println(JSON.toJSON(map));
    }

    @Test
    public void test5()
    {
        System.out.println( JSON.toJSON( orderService.getOrderDetail("1") ) );
    }

    @Test
    public void test6()
    {
        System.out.println(JSON.toJSON( orderService.getOrderListByStatus(1,10,null,null,null,0,0,0) ));
    }

    @Test
    public void test7()
    {
        System.out.println(JSON.toJSON(goodsService.GoodsListPage(4)));
//        List<Goods> g=goodsService.GoodsListPage(4);
//        for (int i=0;i<g.size();i++)
//        {
//            for (int j=0;j<g.get(i).getFormats().size();j++)
//            {
//                System.out.println(i+" "+j+" "+g.get(i).getFormats().get(j).getFname() );
//            }
//        }

    }

    @Test
    public void test8()
    {
        System.out.println(goodsMapper.selectGoodsWithFormatById(11).getId()+goodsMapper.selectGoodsWithFormatById(11).getFormats().get(1).getFname());
    }

    @Test
    public void test9()
    {
        System.out.println( JSON.toJSON(formatMapper.formatList(10) ) );
    }

    @Test
    public void test10()
    {
        System.out.println( JSON.toJSON( goodsMapper.getRecommendGoods() ) );
    }

    @Test
    public void test11()
    {
        System.out.println( JSON.toJSON( goodsService.getNewGoods() ) );
    }

    @Test
    public void test12()
    {
        List<Integer> ints=new ArrayList<Integer>();
        ints.add(2);ints.add(3);
        //System.out.println( cartMapper.test(ints) );
    }

    @Test
    public void test13()
    {
        System.out.println(JSON.toJSONString(orderService.getUserOrderByStatus(3,1,5,0,0)));
    }

    @Test
    public void test14()
    {
        System.out.println( JSON.toJSON(goodsService.goodsSearch(null,null,new String[]{"车","BCD"} )) );
    }
}
