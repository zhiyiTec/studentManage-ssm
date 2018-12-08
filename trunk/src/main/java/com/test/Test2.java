package com.test;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.github.pagehelper.PageInfo;
import com.po.Emp;

/**
 * 使用Spring的单元测试模块测试请求功能
 * 
 * @author 17732
 *
 */
//@RunWith帮我们创建容器
//@ContextConfiguration指定创建容器时使用哪个配置文件
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:conf/spring.xml", "classpath:conf/spring-mvc.xml" })
@WebAppConfiguration
public class Test2 {
	// 传入spring-mvc的ioc;

	// 注：@Autowired只能装配IOC里面的,所以在上面添加了一个WebAppConfiguration注解，拿到web的ioc容器
	@Autowired
	WebApplicationContext context;
	// 虚拟单元测试请求，获取处理结果
	MockMvc mocMvc;

	// 每次使用之前都要初始化一次，所以添加一个before注解
	@Before
	public void initMockMvc() {
		// 只有先创建才能使用
		mocMvc = MockMvcBuilders.webAppContextSetup(context).build();// 这个mocMvc就能模拟我的mvc请求
	}

	@Test
	public void testPage() throws Exception {
		// 模拟请求拿到返回值
		MvcResult result = mocMvc.perform(MockMvcRequestBuilders.get("/emp").param("pn", "1")).andReturn();
		// 请求成功以后，请求域中会有pageInfo,那么我们就可以去取出进行验证
		MockHttpServletRequest request = result.getRequest();
		PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
		System.out.println("当前页码=" + pageInfo.getPageNum());
		System.out.println("总页码=" + pageInfo.getPages());
		System.out.println("总记录数=" + pageInfo.getTotal());
		System.out.println("在页面需要连续显示的页码=");
		int pageNu[] = pageInfo.getNavigatepageNums();
		for (int nu : pageNu) {
			System.out.print(nu + "  ");
		}
		// 获取员工数据
		List<Emp> leEmps = pageInfo.getList();
		for (Emp e : leEmps) {
			System.out.println(e.toString());
		}
	}
}
