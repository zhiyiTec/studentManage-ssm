package com.po;

public class Login {
	String user_name;
	String password;
	Integer user_id;
	Integer type;
	String resetProblem;
	String resetQuestion;
	 
	public Login() {
		
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Integer getUser_id() {
		return user_id;
	}
	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	public String getResetProblem() {
		return resetProblem;
	}
	public void setResetProblem(String resetProblem) {
		this.resetProblem = resetProblem;
	}
	public String getResetQuestion() {
		return resetQuestion;
	}
	public void setResetQuestion(String resetQuestion) {
		this.resetQuestion = resetQuestion;
	}
	public Login(String user_name, String password,  Integer type, String resetProblem,
			String resetQuestion) {
		super();
		this.user_name = user_name;
		this.password = password;
	
		this.type = type;
		this.resetProblem = resetProblem;
		this.resetQuestion = resetQuestion;
	}
	
	
	
}
