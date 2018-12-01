package com.controller;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.po.Dept;
import com.po.Emp;
import com.po.Msg;
import com.service.DepService;
import com.service.EmpService;
/**
 * 用于处理部门的CRUD请求
 * @author 17732
 */
@Controller
public class DepController {
	@Autowired
	DepService depService;
	
	@ResponseBody
	@RequestMapping("/depts")
	public Msg getDepts() {
		List<Dept> lDepts=depService.getALlEmpInfo();
		return Msg.success().add("depts", lDepts);
	}
}
