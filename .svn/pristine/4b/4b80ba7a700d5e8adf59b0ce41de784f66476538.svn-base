package com.controller;

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
import com.po.Login;
import com.po.Msg;
import com.service.LoginService;
import com.serviceImpl.LoginServiceImpl;

@Controller
public class LoginController {
	@Autowired
	LoginService loginService;
	
	
	@ResponseBody
	@RequestMapping(value = "/confirm", method = RequestMethod.GET)
	public Msg confirmUserInfo(@RequestParam(value = "data_login") String data_login) {
		System.out.println("data_login="+data_login);
		String result = null;
		Boolean signal=null;
		String data[]=data_login.split("-");
		String user_name=data[0];
		String password=data[1];
		Login login=loginService.getLoginUserInfoByEmpName(user_name);
		Boolean re=loginService.confirmUsrInfo(user_name, password);
		if(re) {
			signal=true;
		}else {
			signal=false;
		}
		return Msg.success().add("signal", signal).add("LoginUserInfo", login);
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/getResetProblem", method = RequestMethod.GET)
	public Msg getResetProblem(@RequestParam(value = "loginName") String loginName) {
		System.out.println("loginName="+loginName);
		String re=loginService.getResetProblem(loginName);
		return Msg.success().add("re", re);
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/confirmResetAnswer", method = RequestMethod.GET)
	public Msg confirmResetAnswer(@RequestParam(value = "dataRe") String dataRe ) {
		System.out.println("dataRe="+dataRe);
		String dataResult[]=dataRe.split("-");
		String user_name=dataResult[0];
		String password=dataResult[1];
		Boolean re=loginService.confirmResetAnswer(user_name, password);
		return Msg.success().add("re",re);
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/changePassword", method = RequestMethod.GET)
	public Msg changePassword(@RequestParam(value = "re_ChagePassword") String re_ChagePassword ) {
		System.out.println("re_ChagePassword="+re_ChagePassword);
		String dataResult[]=re_ChagePassword.split("-");
		String user_name=dataResult[0];
		String password=dataResult[1];
		ChangePassword CP=new ChangePassword(user_name, password);
		loginService.ChagPassWOrd(CP);
		return Msg.success();
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/judgeNameExits", method = RequestMethod.GET)
	public Msg judgeNameExits(@RequestParam(value = "user_name") String user_name ) {
		System.out.println("user_name="+user_name);
		Boolean re=loginService.judgeUsrAlredyExit(user_name);
		return Msg.success().add("re", re);
	}
	
	@ResponseBody
	@RequestMapping(value = "/ADDUser", method = RequestMethod.GET)
	public Msg ADDUser(@RequestParam(value = "dataRe_ADD") String dataRe_ADD) {
		System.out.println("dataRe_ADD="+dataRe_ADD);
		String strRe[]=dataRe_ADD.split("-");
		String user_name=strRe[0];
		String password=strRe[1];
		String ResetQuestion=strRe[2];
		String	ResetQuestionAnwser=strRe[3];
		Login lo=new Login( user_name,  password,0,  ResetQuestion,ResetQuestionAnwser);
		loginService.addUser(lo);
		return Msg.success().add("login", lo);
	}
	
}
