package com.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.po.AddEmp;
import com.po.Emp;
import com.po.Msg;
import com.po.UppdataEmp;
import com.service.EmpService;

/**
 * 用于处理员工的CRUD请求
 * 
 * @author 17732
 */
@Controller
public class EmpController {
	@Autowired
	EmpService empService;

	@ResponseBody
	@RequestMapping("/emp")
	public Msg getEmps(@RequestParam(value = "pn", defaultValue = "1") Integer pn,HttpServletResponse response) {
		// 为了方便快速查询，所以引入PageHelper分页查询
		// 表示从第pn查，每一页显示5条数据
		response.setHeader("Access-Control-Allow-Origin", "*");
		PageHelper.startPage(pn, 5);// 后面紧跟的这个查询就是分页查询
		List<Emp> lemp = empService.getALlEmpInfo();
		// 将查询的分页结果进行包装,其中PageInfo中包含了这个页面的所有信息，所以只需要将pageInfo交给页面接受就行了
		PageInfo page = new PageInfo(lemp, 5);// 5:表示每次只显示5页的导航菜单
		return Msg.success().add("pageInfo", page);// 返回的不仅有状态消息，其中由于add方法，也将
	}

	// 用于检验用户名是否可用
	@ResponseBody
	@RequestMapping("/checkUser")
	public Msg checkUse(@RequestParam(value = "emp_name") String emp_name) {
		Boolean result = empService.checkUser(emp_name);
		return Msg.success().add("result", result);

	}

	@ResponseBody
	@RequestMapping(value = "/addEmp", method = RequestMethod.POST)
	public Msg test(@RequestBody String buAuth) {
		System.out.println(buAuth);
		AddEmp addEmp = JSON.parseObject(buAuth, AddEmp.class);
		String emp_name = addEmp.getEmp_name();
		String gender = addEmp.getGender();
		String eamil = addEmp.getEamil();
		String dept_name = addEmp.getDept_name();
		Emp emp = new Emp(emp_name, gender, eamil, dept_name);
		empService.addEmpByEmp(emp);
		return Msg.success().add("emp", emp);
	}

	// 获取一个员工的信息
	@ResponseBody
	@RequestMapping(value = "/empOnly", method = RequestMethod.GET)
	public Msg getEmpById(@RequestParam(value = "emp_id") String emp_id) {
		Integer id = Integer.valueOf(emp_id);
		Emp emp = empService.getEMpOnly(id);
		return Msg.success().add("emp", emp);

	}

	// 用于保存员工信息
	@ResponseBody
	@RequestMapping(value = "/emp", method = RequestMethod.PUT)
	public Msg SaveEmp(@RequestBody String Buth) {
		System.out.println(Buth);
		UppdataEmp uppdataEmp = JSON.parseObject(Buth, UppdataEmp.class);
		Integer emp_id = uppdataEmp.getEmp_id();
		String emp_name = uppdataEmp.getEmp_name();
		String gender = uppdataEmp.getGender();
		String eamil = uppdataEmp.getEamil();
		String dept_name = uppdataEmp.getDept_name();
		Emp emp = new Emp(emp_id, emp_name, gender, eamil, dept_name);
		empService.uppdataEmp(emp);
		return Msg.success().add("emp", emp);

	}

	// 用于删除单一员工
	@ResponseBody
	@RequestMapping(value = "/deleteEmp", method = RequestMethod.POST)
	public Msg deleteEmp(@RequestParam(value = "emp_id") String emp_id) {
		Integer id = Integer.valueOf(emp_id);
		System.out.println("deleteEmp_emp_id=" + id);

		empService.deleteEmpOnlyOne(id);
		return Msg.success();
	}

	// 用于删除单一员工
	@ResponseBody
	@RequestMapping(value = "/deleteEmpMultiple", method = RequestMethod.POST)
	public Msg deleteEmpMultiple(@RequestParam(value = "emp_idAsSelected") String emp_idAsSelected) {
		String strId[]=emp_idAsSelected.split("-");
		List<Integer> listId=new ArrayList<Integer>();
		for(String a:strId) {
			listId.add(Integer.valueOf(a));
		}
		System.out.println(listId);
		empService.deleteEmpMultiple(listId);
		return Msg.success();
	}
	
	
	//用于通过姓名查询员工信息
	@ResponseBody
	@RequestMapping(value = "/searchEmpByName", method = RequestMethod.POST)
	public Msg searchEmpByName(@RequestParam(value = "emp_Name") String emp_Name) {
		System.out.println("searchEmpByName_emp_Name="+emp_Name);
		Emp lEmps=empService.getEmpInfoByEmpName(emp_Name);
		
		Map<String, Object>map=new HashMap<String,Object>();
		
		if(lEmps==null) {
			map.put("message", "No");
		}else {
			map.put("message", "Yes");
			System.out.println("searchEmpByName_Emp"+lEmps.toString());
		}
		return Msg.success().add("map", map).add("Emp", lEmps);
	}
	
	
	
	//通过姓名查询学生的成绩信息
	@ResponseBody
	@RequestMapping(value = "/getScoreInfo", method = RequestMethod.GET)
	public Msg getScoreInfo(@RequestParam(value = "name") String name) {
		System.out.println("getScoreInfo_name="+name);
		List<Emp>emps=empService.getScoreByName(name);
		
		return Msg.success().add("emps", emps);
	}
}
