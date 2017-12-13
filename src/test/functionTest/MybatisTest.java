package functionTest;

import com.jd.orange.model.Goods;
import com.jd.orange.model.Part;
import com.jd.orange.service.GoodsService;
import com.jd.orange.service.PartService;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring-mvc.xml","classpath:spring-mybatis.xml","classpath:mybatis-config.xml"})
public class MybatisTest {

    @Autowired
    private GoodsService goodsService;

    @Autowired
    private PartService partService;



    @Test
    public void test1(){
        List<Part> partsList=partService.getFatherPart();
    }

    @Test
    public void test2()
    {
        List<Goods> goodsList;
        //goodsList=goodsService.getGoodsList(null,null,null);//ok
        //goodsList=goodsService.getGoodsList(null,"2017-12-01 18:34:25",null);
        //goodsList=goodsService.getGoodsList(null,null,"2017-12-01 18:34:25");//ok
        //goodsList=goodsService.getGoodsList(null,"2017-12-01 18:34:25","2017-12-12 18:34:25");//ok
        //goodsList=goodsService.getGoodsList(null,"2017-12-12 18:34:25","2017-12-01 18:34:25");//ok
        goodsList=goodsService.getGoodsList("2","2017-12-12 18:34:25","2017-12-01 18:34:25");//ok
        for (Goods goods:goodsList)
        {
            System.out.println(goods.getId() + "  " + goods.getName() + "  " + goods.getPname() );
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

}
