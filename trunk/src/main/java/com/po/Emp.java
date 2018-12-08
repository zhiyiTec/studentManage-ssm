package com.po;

import javax.validation.constraints.Pattern;

public class Emp {
	
	private int emp_id;
	//这个注解是自定义校验规则
	@Pattern(regexp="(^[a-zA-Z0-9_-]{1,16}$)|(^[\\u2E80-\\u9FFF]{2,5})",message="用户名输入a-z或者A-Z或者2-5位中文")
	private String emp_name;
	private String gender;
	private String eamil;
	private int dept_id;
	private String dept_name;
	private String Cno;
	private Double Score;
	private String Cname;
	private String Ctime;
	private String testTime;
	
	public int getEmp_id() {
		return emp_id;
	}
	public Emp() {}
	public Emp(String emp_name,String Cno,String Cname,String Ctime,Double Score) {
		this.emp_name=emp_name;
		this.Cno=Cno;
		this.Cname=Cname;
		this.Ctime=Ctime;
		this.Score=Score;
	}
	
	public Emp(int id,String name,String gender,String email,int dept_id) {
		this.emp_id=id;
		this.emp_name=name;
		this.gender=gender;
		this.eamil=email;
		this.dept_id=dept_id;
	}
	public Emp(String name,String gender,String email,int dept_id) {
		this.emp_name=name;
		this.gender=gender;
		this.eamil=email;
		this.dept_id=dept_id;
	}
	public Emp(String name,String gender,String email,String dept_name) {
		this.emp_name=name;
		this.gender=gender;
		this.eamil=email;
		this.dept_name=dept_name;
	}
	public Emp(Integer emp_id,String name,String gender,String email,String dept_name) {
		this.emp_id=emp_id;
		this.emp_name=name;
		this.gender=gender;
		this.eamil=email;
		this.dept_name=dept_name;
	}
	
	public Emp(Integer emp_id,String name,String gender,String email,String dept_name,Integer deId) {
		this.emp_id=emp_id;
		this.emp_name=name;
		this.gender=gender;
		this.eamil=email;
		this.dept_name=dept_name;
		this.dept_id=deId;
	}
	public String getDept_name() {
		return dept_name;
	}
	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}
	public void setEmp_id(int emp_id) {
		this.emp_id = emp_id;
	}
	public String getEmp_name() {
		return emp_name;
	}
	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getEamil() {
		return eamil;
	}
	public void setEamil(String eamil) {
		this.eamil = eamil;
	}
	public int getDept_id() {
		return dept_id;
	}
	public void setDept_id(int dept_id) {
		this.dept_id = dept_id;
	}
	public String getCno() {
		return Cno;
	}
	public void setCno(String cno) {
		Cno = cno;
	}
	public Double getScore() {
		return Score;
	}
	public void setScore(Double score) {
		Score = score;
	}
	public String getCname() {
		return Cname;
	}
	public void setCname(String cname) {
		Cname = cname;
	}
	public String getCtime() {
		return Ctime;
	}
	public void setCtime(String ctime) {
		Ctime = ctime;
	}
	public String getTestTime() {
		return testTime;
	}
	public void setTestTime(String testTime) {
		this.testTime = testTime;
	}
	public Emp(int emp_id, String emp_name,
			String gender, String eamil, int dept_id, String dept_name, String cno, Double score, String cname,
			String ctime, String testTime) {
		super();
		this.emp_id = emp_id;
		this.emp_name = emp_name;
		this.gender = gender;
		this.eamil = eamil;
		this.dept_id = dept_id;
		this.dept_name = dept_name;
		Cno = cno;
		Score = score;
		Cname = cname;
		Ctime = ctime;
		this.testTime = testTime;
	}
	
	
	}
	

