package com.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.mapper.LoginMapper;
import com.po.ChangePassword;
import com.po.Emp;
import com.po.Login;

import com.service.LoginService;
@Service
public class LoginServiceImpl implements LoginService {
	// service依赖于Dao
	@Autowired
	LoginMapper loginMapper;

	@Override
	public Boolean confirmUsrInfo(String user_name,String password) {
		// TODO Auto-generated method stub
		Boolean re=false;
		List<Login> logins=loginMapper.confirmUser(user_name);
		if(logins.isEmpty()) {
			re=false;
		}else {
			
			
			String pas = null;
			for(Login lo:logins) {
				 pas=lo.getPassword();
			}
			if(pas.equals(password)) {
				re=true;
			}
		}
		
		return re;
	}

	@Override
	public String getResetProblem(String user_name) {
		// TODO Auto-generated method stub
		String re=null;
		List<Login> logins=loginMapper.confirmUser(user_name);
		if(logins.isEmpty()) {
			re="fal";
		}else {
			for(Login lo:logins){
				 re=lo.getResetProblem();
			}
		}
		return re;
	}

	@Override
	public Boolean confirmResetAnswer(String user_name,String password) {
		// TODO Auto-generated method stub
		Boolean re=null;
		List<Login> logins=loginMapper.confirmUser(user_name);
		if(logins.isEmpty()) {
			re=false;
		}else {
			for(Login lo:logins){
				 if(password.equals(lo.getResetQuestion())) {
					 re=true;
				 }else {
					 re=false;
				 }
			}
		}
		return re;
	}

	@Override
	public void ChagPassWOrd(ChangePassword CP) {
		// TODO Auto-generated method stub
		loginMapper.chagePassWord(CP);
	}

	@Override
	public Boolean judgeUsrAlredyExit(String user_name) {
		// TODO Auto-generated method stub
		
		List<Login>logins=loginMapper.confirmUser(user_name);
		Boolean re=null;
		if(logins.isEmpty()) {
			re=true;
		}else {
			re=false;
		}
		return re;
	}

	@Override
	public void addUser(Login lo) {
		// TODO Auto-generated method stub
		loginMapper.insertUsrByLogin(lo);
	}
	
	@Override
	public Login getLoginUserInfoByEmpName(String name) {
		// TODO Auto-generated method stub
		List<Login>logins=loginMapper.confirmUser(name);
		Login login=null;
		for(Login lo:logins) {
			login=lo;
		}
		return login;
	}

	
}
