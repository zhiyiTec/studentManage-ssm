package com.po;

public class AddEmp {
	String dept_name;
	String eamil;
	String emp_name;
	String	gender;
	
	public AddEmp() {
		
	}
	public String getDept_name() {
		return dept_name;
	}
	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}
	public String getEamil() {
		return eamil;
	}
	public void setEamil(String eamil) {
		this.eamil = eamil;
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
	public AddEmp(String dept_name, String eamil, String emp_name, String gender) {
		
		this.dept_name = dept_name;
		this.eamil = eamil;
		this.emp_name = emp_name;
		this.gender = gender;
	}
	
}
