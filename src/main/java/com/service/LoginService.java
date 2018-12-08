package com.service;

import java.util.List;

import com.po.ChangePassword;
import com.po.Emp;
import com.po.Login;


public interface LoginService {
	public Boolean confirmUsrInfo(String user_name,String password);
	public String getResetProblem(String user_name);
	public Boolean confirmResetAnswer(String user_name,String password);
	public void ChagPassWOrd(ChangePassword CP);
	public Boolean judgeUsrAlredyExit(String user_name);
	public void addUser(Login lo);
	//用于通过用户名获取用户所有信息
	public Login getLoginUserInfoByEmpName(String name);
}
