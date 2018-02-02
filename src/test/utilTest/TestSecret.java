package utilTest;

import com.jd.orange.util.password.Secret;
import org.junit.Test;

public class TestSecret {

    @Test
    public void test1()
    {
        Secret secret=new Secret();
        String s="asdfse";
        String d="123";
        System.out.println(Secret.enPass(s)+"   "+Secret.enPass(d));
        System.out.println(Secret.dePass(Secret.enPass(s))+"   "+Secret.dePass(Secret.enPass(d)) );
    }

    @Test
    public void enpass()
    {
        String s="111111";
        System.out.println(Secret.enPass(s));
    }

    @Test
    public void depass()
    {
        String s="fovtZnZPnPI";
        System.out.println(Secret.dePass(s));
    }



}
//jwaOCl/P5PTtWKlGENiguwQ7oR4UGHfn
//aad512edal1ewd;sadds