package com.test;


import com.alibaba.fastjson.JSON;
import com.po.AddEmp;

public class Test3 {
	public static void main(String[] args) {
		String a="{\"emp_name\":\"朱旭\",\"gender\":\"男\",\"eamil\":\"ffffffffff@qq\",\"dept_name\":\"技术部\"}";
		AddEmp addEmp=JSON.parseObject(a, AddEmp.class);
		System.out.println(addEmp.getDept_name());
	}
}
