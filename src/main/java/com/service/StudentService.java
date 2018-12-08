package com.service;

import java.util.List;

import com.po.Emp;
import com.po.GetTestTime;
import com.po.Student_getDept;

public interface StudentService {
	public List<Emp> getStudentAllInfoByName(String emp_name);
	public List<Student_getDept> getDeptInfo();
	public List<GetTestTime> getTestTime(String emp_name);
}
