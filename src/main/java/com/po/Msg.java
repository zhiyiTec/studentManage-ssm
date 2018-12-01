package com.po;
/**
 * 通用的返回类
 * @author 17732
 *
 */

import java.util.HashMap;
import java.util.Map;

public class Msg {
	private Integer code;//状态码（规定100：成功，200：失败）
	private String msg;//提示信息
	private Map<String, Object> extend=new HashMap<String, Object>();//用户要返回给浏览器的数据
	public Msg() {}
	public Integer getCode() {
		return code;
	}
	public void setCode(Integer code) {
		this.code = code;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public Map<String, Object> getExtend() {
		return extend;
	}
	public void setExtend(Map<String, Object> extend) {
		this.extend = extend;
	}
	
	public static Msg success() {
		Msg result=new Msg();
		result.setCode(100);
		result.setMsg("deal success");
		return result;
		
	}
	public static Msg fail() {
		Msg result=new Msg();
		result.setCode(200);
		result.setMsg("deal failure");
		return result;
		
	}
	//此方法主要是用于为了链式操作
	public Msg add(String key ,Object value) {
		//this是获取当前对象
		this.getExtend().put(key, value);
		return this;
	}

}
