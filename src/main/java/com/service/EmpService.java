package com.service;

import java.util.List;

import com.po.Emp;

public interface EmpService {
	public List<Emp> getALlEmpInfo();
	public void addEmpByEmp(Emp emp);
	public Boolean checkUser(String name);
	public Emp getEMpOnly(Integer emp_id);
	public void uppdataEmp(Emp emp);
	public void deleteEmpOnlyOne(Integer emp_id);
	public void deleteEmpMultiple(List<Integer> lID);
	public Emp getEmpInfoByEmpName(String emp_name);
	public List<Emp>  getScoreByName(String emp_name);
}
