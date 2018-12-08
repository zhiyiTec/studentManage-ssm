package com.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.mapper.DeptMapper;
import com.mapper.EmpMapper;
import com.po.Dept;
import com.po.Emp;
import com.service.DepService;
import com.service.EmpService;
@Service
public class DeptServiceImpl implements DepService {
	// service依赖于Dao
	@Autowired
	DeptMapper deptMapper;
	
	public DeptMapper getDeptMapper() {
		return deptMapper;
	}



	public void setDeptMapper(DeptMapper deptMapper) {
		this.deptMapper = deptMapper;
	}



	@Override
	public List<Dept> getALlEmpInfo() {
		// TODO Auto-generated method stub
		return deptMapper.getDeptInfo();
	}







	

}
