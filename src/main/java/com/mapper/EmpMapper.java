package com.mapper;

import java.util.List;

import com.po.Emp;

public interface EmpMapper {
	public List<Emp> getEmpInfo();
	public void  updateEmpById(Emp emp);
	public void  insertEmpByEmp(Emp emp);
	public List<Emp> getEmpInfoWithDeptName();
	public List<Emp> checkUserAlreadyUseByUserName(String emp_name);
	public Emp gtEmpById(Integer emp_id);
	public void deleteEmpById(Integer emp_id);
	public void deleteEmpMultiple(List<Integer> listID);
	public Emp getEmpInfoByName(String emp_name);
	public List<Emp> getEmpScoreByName(String emp_name);
}
