package com.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.mapper.DeptMapper;
import com.mapper.EmpMapper;
import com.po.Emp;
import com.service.EmpService;
@Service
public class EmpServiceImpl implements EmpService {
	// service依赖于Dao
	@Autowired
	EmpMapper eMapper;
	@Autowired
	DeptMapper deptMapper;
	public EmpMapper geteMapper() {
		return eMapper;
	}

	public void seteMapper(EmpMapper eMapper) {
		this.eMapper = eMapper;
	}


	@Override
	public List<Emp> getALlEmpInfo() {
		// TODO Auto-generated method stub
		return eMapper.getEmpInfo();
	}

	@Override
	public void addEmpByEmp(Emp emp) {
		// TODO Auto-generated method stub
		String dept_name=emp.getDept_name();
		Integer dept_id=deptMapper.getDeptIdByDeptName(dept_name);
		emp.setDept_id(dept_id);
		eMapper.insertEmpByEmp(emp);
	}

	@Override
	public Boolean checkUser(String name) {
		// TODO Auto-generated method stub
		Boolean result=null;
		List<Emp> lemps=eMapper.checkUserAlreadyUseByUserName(name);
		if(lemps.size()>=1) {
			result=false;
		}else {
			result=true;
		}
		return result;
	}

	@Override
	public Emp getEMpOnly(Integer emp_id) {
		// TODO Auto-generated method stub
		return eMapper.gtEmpById(emp_id);
	}

	@Override
	public void uppdataEmp(Emp emp) {
		// TODO Auto-generated method stub
		String dept_name=emp.getDept_name();
		Integer dept_id=deptMapper.getDeptIdByDeptName(dept_name);
		emp.setDept_id(dept_id);
		eMapper.updateEmpById(emp);
	}

	@Override
	public void deleteEmpOnlyOne(Integer emp_id) {
		// TODO Auto-generated method stub
		eMapper.deleteEmpById(emp_id);
	}

	@Override
	public void deleteEmpMultiple(List<Integer> lID) {
		// TODO Auto-generated method stub
		eMapper.deleteEmpMultiple(lID);
	}

	@Override
	public Emp getEmpInfoByEmpName(String emp_name) {
		// TODO Auto-generated method stub
		Emp lEmps=eMapper.getEmpInfoByName(emp_name);
		return lEmps;
	}
	
	
	@Override
	public List<Emp> getScoreByName(String emp_name) {
		// TODO Auto-generated method stub
		List<Emp>lEmps=eMapper.getEmpScoreByName(emp_name);
		return lEmps;
	}

}
