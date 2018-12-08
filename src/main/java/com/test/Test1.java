package com.test;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.mapper.DeptMapper;
import com.mapper.EmpMapper;
import com.po.Dept;
import com.po.Emp;

//帮我们创建容器
@RunWith(SpringJUnit4ClassRunner.class)
//指定创建容器时使用哪个配置文件
@ContextConfiguration(locations = { "classpath:conf/spring.xml" })

public class Test1 {
	@Autowired
	EmpMapper empMapper;
	@Autowired
	SqlSession sqlSession;
	@Test
	public void getEmpInfo() {
		List<Emp> lEmps = empMapper.getEmpInfo();
		System.out.println(lEmps.size());
		if (lEmps.size() >= 1) {
			for (Emp em : lEmps) {
				System.out.println(em.getEmp_name() + "=" + em.getEamil());
			}
		}

	}
	//用于更新
	@Test
	public void updateEmpById() throws IOException {
		Emp m = new Emp(1,"zx", "female", "123@qq.com", 1);
		EmpMapper empMapper=sqlSession.getMapper(EmpMapper.class);
		empMapper.updateEmpById(m);
	}
	//用于批量的插入数据
	@Test
	public void insertDeptByBATCH() {
		DeptMapper OCM=sqlSession.getMapper(DeptMapper.class);
		for(int i=0;i<500;i++) {
			String dept_name=UUID.randomUUID().toString().substring(0, 5);
			OCM.insertByDept(new Dept(dept_name));
		}
	}
	//用于批量的插入数据
		@Test
		public void insertEmpByBATCH() {
			EmpMapper OCM=sqlSession.getMapper(EmpMapper.class);
			for(int i=0;i<30;i++) {
				String name=UUID.randomUUID().toString().substring(0, 5);
				String mail=UUID.randomUUID().toString().substring(0, 5)+i+"@qq.com";
				OCM.insertEmpByEmp(	new Emp(name,"女",mail,2));
			}
		}
		
	
}
