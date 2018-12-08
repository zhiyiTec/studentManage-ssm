package com.po;

public class AddUser {
	String user_name;
	String password;
	String ResetQuestion;
	String	ResetQuestionAnwser;
	
	public AddUser() {
		
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

	public String getResetQuestion() {
		return ResetQuestion;
	}

	public void setResetQuestion(String resetQuestion) {
		ResetQuestion = resetQuestion;
	}

	public String getResetQuestionAnwser() {
		return ResetQuestionAnwser;
	}

	public void setResetQuestionAnwser(String resetQuestionAnwser) {
		ResetQuestionAnwser = resetQuestionAnwser;
	}

	public AddUser(String user_name, String password, String resetQuestion, String resetQuestionAnwser) {
		super();
		this.user_name = user_name;
		this.password = password;
		ResetQuestion = resetQuestion;
		ResetQuestionAnwser = resetQuestionAnwser;
	}
	
	
}
