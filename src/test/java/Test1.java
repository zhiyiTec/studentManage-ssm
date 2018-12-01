
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.mapper.EmpMapper;
//帮我们创建容器
@RunWith(SpringJUnit4ClassRunner.class)
//指定创建容器时使用哪个配置文件
@ContextConfiguration(locations= {"classPath:conf"})

public class Test1 {
	@Autowired
	EmpMapper empMapper;
	@Test
	public void testEmpMaaper() {
		System.out.println(empMapper);
	}
}
