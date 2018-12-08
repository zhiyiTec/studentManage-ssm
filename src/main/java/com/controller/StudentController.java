package com.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.po.AddUser;
import com.po.ChangePassword;
import com.po.Emp;
import com.po.GetTestTime;
import com.po.Login;
import com.po.Msg;
import com.po.Student_getDept;
import com.service.LoginService;
import com.service.StudentService;
import com.serviceImpl.LoginServiceImpl;

@Controller
public class StudentController {
	@Autowired
	StudentService studentService;
	
	@ResponseBody
	@RequestMapping(value = "/getStudentInfo", method = RequestMethod.GET)
	public Msg getStudentInfo(@RequestParam(value = "name") String name) {
	System.out.println("getStudentInfo_name"+name);
	List<Emp>emps=studentService.getStudentAllInfoByName(name);
		return Msg.success().add("emps", emps);
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/getDeptInfo", method = RequestMethod.GET)
	public Msg getDeptInfo() {
		List<Student_getDept>lStrings=studentService.getDeptInfo();
		return Msg.success().add("lStrings",lStrings);
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/getTestTime", method = RequestMethod.GET)
	public Msg getTestTime(@RequestParam(value = "name") String name) {
		System.out.println("getTestTime_name="+name);
		List<GetTestTime>lTestTimes=studentService.getTestTime(name);
		return Msg.success().add("lTestTimes", lTestTimes);
	}
}
