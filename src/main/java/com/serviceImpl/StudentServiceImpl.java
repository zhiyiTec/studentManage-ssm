package com.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.mapper.DeptMapper;
import com.mapper.EmpMapper;
import com.mapper.StudentMapper;
import com.po.Emp;
import com.po.GetTestTime;
import com.po.Student_getDept;
import com.service.EmpService;
import com.service.StudentService;
@Service
public class StudentServiceImpl implements StudentService {
	@Autowired
	StudentMapper studentMapper;
	@Override
	public List<Emp> getStudentAllInfoByName(String emp_name) {
		// TODO Auto-generated method stub
		List<Emp>lEmps=studentMapper.getStudentBasicInfoByName(emp_name);
		return lEmps;
	}
	@Override
	public List<Student_getDept> getDeptInfo() {
		// TODO Auto-generated method stub
		List<Student_getDept>lStrings=studentMapper.getAllDeptName();
		return lStrings;
	}
	@Override
	public List<GetTestTime> getTestTime(String emp_name) {
		// TODO Auto-generated method stub
		List<GetTestTime> lTestTimes=studentMapper.getTestTimeByName(emp_name);
		return lTestTimes;
	}
	
}
