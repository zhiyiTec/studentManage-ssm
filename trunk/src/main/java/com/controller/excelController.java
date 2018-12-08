package com.controller;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.alibaba.fastjson.JSONObject;
import com.po.Emp;
import com.po.Msg;
@Controller
public class excelController {
	
	@ResponseBody
	@RequestMapping(value = "/excel/{result}", method = RequestMethod.POST)
	public Msg excel(@RequestBody String param,@PathVariable String result) throws Exception {
		System.out.println("param="+param);
		System.out.println("表名="+result);
		JSONObject jo=new JSONObject();
		List<Emp>lEmps = new ArrayList();
		
		List<Map> parseArray = jo.parseArray(param, Map.class);
		System.out.println("parseArray="+parseArray);
		for (Map map:parseArray) {
			Emp emp=new Emp();
			emp.setEmp_name((String)map.get("emp_name"));
			emp.setGender((String)map.get("gender"));
			emp.setDept_name((String)map.get("dept_name"));
			emp.setEamil((String)map.get("eamil"));
			emp.setDept_id((Integer)map.get("dept_id"));
			emp.setEmp_id((Integer)map.get("emp_id"));
			lEmps.add(emp);
		}
		createExcel(lEmps,result);
		 // 读取Excel表格
        List<Emp> list = readExcel();
        System.out.println(list.toString());
		return Msg.success().add("list", list);
		
	}
	   /**
     * 创建Excel
     * 
     * @param list
     *            数据
     */
    private static void createExcel(List<Emp> list,String excelName) {
        // 创建一个Excel文件
        HSSFWorkbook workbook = new HSSFWorkbook();
        // 创建一个工作表
        HSSFSheet sheet = workbook.createSheet("学生表一");
        // 添加表头行
        HSSFRow hssfRow = sheet.createRow(0);
        // 设置单元格格式居中
        HSSFCellStyle cellStyle = workbook.createCellStyle();
        cellStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);

        // 添加表头内容
        HSSFCell headCell = hssfRow.createCell(0);
        headCell.setCellValue("部门id");
        headCell.setCellStyle(cellStyle);

        headCell = hssfRow.createCell(1);
        headCell.setCellValue("姓名");
        headCell.setCellStyle(cellStyle);

        headCell = hssfRow.createCell(2);
        headCell.setCellValue("性别");
        headCell.setCellStyle(cellStyle);
        
        headCell = hssfRow.createCell(3);
        headCell.setCellValue("email");
        headCell.setCellStyle(cellStyle);
        
        headCell = hssfRow.createCell(4);
        headCell.setCellValue("部门名");
        headCell.setCellStyle(cellStyle);
        
        headCell = hssfRow.createCell(5);
        headCell.setCellValue("部门id");
        headCell.setCellStyle(cellStyle);

        // 添加数据内容
        for (int i = 0; i < list.size(); i++) {
            hssfRow = sheet.createRow((int) i + 1);
            Emp StudentPo = list.get(i);

            // 创建单元格，并设置值
            HSSFCell cell = hssfRow.createCell(0);
            cell.setCellValue(StudentPo.getEmp_id());
            cell.setCellStyle(cellStyle);
            
            cell = hssfRow.createCell(1);
            cell.setCellValue(StudentPo.getEmp_name());
            cell.setCellStyle(cellStyle);

            cell = hssfRow.createCell(2);
            cell.setCellValue(StudentPo.getGender());
            cell.setCellStyle(cellStyle);
            
            cell = hssfRow.createCell(3);
            cell.setCellValue(StudentPo.getEamil());
            cell.setCellStyle(cellStyle);
            
            cell = hssfRow.createCell(4);
            cell.setCellValue(StudentPo.getDept_name());
            cell.setCellStyle(cellStyle);
            
            cell = hssfRow.createCell(5);
            cell.setCellValue(StudentPo.getDept_id());
            cell.setCellStyle(cellStyle);
        }

        // 保存Excel文件
        try {
            OutputStream outputStream = new FileOutputStream("D:/"+excelName+".xls");
            workbook.write(outputStream);
            outputStream.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 读取Excel
     * 
     * @return 数据集合
     */
    private static List<Emp> readExcel() {
        List<Emp> list = new ArrayList<Emp>();
        HSSFWorkbook workbook = null;

        try {
            // 读取Excel文件
            InputStream inputStream = new FileInputStream("D:/StudentPos.xls");
            workbook = new HSSFWorkbook(inputStream);
            inputStream.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        // 循环工作表
        for (int numSheet = 0; numSheet < workbook.getNumberOfSheets(); numSheet++) {
            HSSFSheet hssfSheet = workbook.getSheetAt(numSheet);
            if (hssfSheet == null) {
                continue;
            }
            // 循环行
            for (int rowNum = 1; rowNum <= hssfSheet.getLastRowNum(); rowNum++) {
                HSSFRow hssfRow = hssfSheet.getRow(rowNum);
                if (hssfRow == null) {
                    continue;
                }

                // 将单元格中的内容存入集合
                Emp StudentPo = new Emp();

                HSSFCell cell = hssfRow.getCell(0);
                if (cell == null) {
                    continue;
                }
                StudentPo.setEmp_id((int)cell.getNumericCellValue());

                cell = hssfRow.getCell(1);
                if (cell == null) {
                    continue;
                }
                StudentPo.setEmp_name(cell.getStringCellValue());

                cell = hssfRow.getCell(2);
                if (cell == null) {
                    continue;
                }
                StudentPo.setGender(cell.getStringCellValue());
                
                cell = hssfRow.getCell(3);
                if (cell == null) {
                    continue;
                }
                StudentPo.setEamil(cell.getStringCellValue());
                
                cell = hssfRow.getCell(4);
                if (cell == null) {
                    continue;
                }
                StudentPo.setDept_name(cell.getStringCellValue());
                
                cell = hssfRow.getCell(5);
                if (cell == null) {
                    continue;
                }
                StudentPo.setDept_id((int)cell.getNumericCellValue());
                list.add(StudentPo);
            }
        }
        return list;
    }

}
