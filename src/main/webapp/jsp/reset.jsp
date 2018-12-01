<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>重置密码</title>
<link rel="stylesheet"
	href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script
	src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="http://www.veryhuo.com/uploads/Common/js/jQuery.md5.js"></script>

<%
	pageContext.setAttribute("App_Path", request.getContextPath());
%>
</head>
<body>
<body background="../images/background.jpg">
	<!-- 查询员工的模态框 -->
	<div class="modal fade" id="resetModel" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel_Reset">修改密码</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" action="#" id="form_Reset">
						<div class="form-group">
							<label for="inputName" class="col-sm-2 control-label">用户名</label>							
							<div class="col-sm-10">
								<p class="form-control-static" id="inputName_Reset"></p>
							</div>
						</div>
						<div class="form-group">
							<label for="inputPassword_Reset" class="col-sm-2 control-label">新密码</label>
							<div class="col-sm-4">
								<input type="password" class="form-control" id="inputPassword" name="inputPassword"
									placeholder="新密码">
									<span  class="help-block" id="helpSpanToinputPassword"></span>
							</div>
						</div>
						<div class="form-group">
							<label for="inputPassword_confirm" class="col-sm-2 control-label">确认密码</label>
							<div class="col-sm-4">
								<input type="password" class="form-control" id="inputPasswordConfirm" name="inputPasswordConfirm" data-sig="T"
									placeholder="确认密码">
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal" id="deal_Reset">确认修改</button>
					
				</div>
				
			</div>
			
		</div>
	</div>
	<nav class="navbar navbar-default navbar-static-top">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					aria-expanded="false">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#"><font
					style="font-family: STXingkai"><span
						class="glyphicon glyphicon-fire" aria-hidden="true">致一科技</span></font></a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-center">
					<li><a href="#">学生信息管理系统——重置密码</a></li>

				</ul>
				<ul class="nav navbar-nav navbar-right">
				<li  id="submitBtn_li"></li>
				<li><a href="login.jsp">返回登录界面</a></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>
	<form class="form-inline" style="padding-top: 10%;">
		<div class="row">
			<div class="col-sm-4 col-md-offset-4">
				<span class="glyphicon glyphicon-user" aria-hidden="true"
					style="color: gray"></span> <label for="inputDeptName"
					style="color: green">用户名</label> <input type="text"
					class="form-control" id="login_name" placeholder="用户名">
					<span class="help-block" id="helpSpanToInputName"></span>
			</div>
		</div>
	</form>
	<form class="form-inline" style="padding-top: 20px;">
		<div class="row">
			<div class="col-sm-4 col-md-offset-4">
				<span class="glyphicon glyphicon-lock" aria-hidden="true"
					style="color: red"></span> <label for="inputDeptName"
					style="color: red">密 &nbsp; &nbsp;保</label> <input type="text"
					class="form-control" id="resetProblem" placeholder="密保"
					disabled="disabled">
			</div>
		</div>
	</form>
	<form class="form-inline" style="padding-top: 20px;">
		<div class="row">
			<div class="col-sm-4 col-md-offset-4">
				<span class="glyphicon glyphicon-lock" aria-hidden="true"
					style="color: red"></span> <label for="inputDeptName"
					style="color: red">答 &nbsp; &nbsp;案</label> <input type="text"
					class="form-control" id="resetAnswer" placeholder="答案">
			</div>
		</div>
		
	</form>
	
	<script type="text/javascript">
	
		$(function() {
			$("#login_name")
					.change(
							function() {
								var loginName = this.value;
								$("#resetProblem").val("");
								$("#resetAnswer").val("");
								$.ajax({
											url : "${App_Path}/getResetProblem",
											data : "loginName=" + loginName,
											type : "GET",
											success : function(data) {
												if (data.extend.re != 'fal') {
													//每次添加之前先清除之前的样式和内容
													$("#login_name")
															.parent()
															.removeClass(
																	"has-error has-warning has-success");
													$("#helpSpanToInputName")
															.text("");
													$("#resetProblem").val("");
													$("#submitBtn_li").empty()
													$("#login_name")
															.parent()
															.addClass(
																	"has-success");
													$("#helpSpanToInputName")
															.text("用户名可用");
													$("#resetProblem").val(data.extend.re);
													$("#submitBtn_li").append("<button type='button' class='btn btn-default navbar-btn' id='submit_btn'>提交</button>");
												} else {
													//每次添加之前先清除之前的样式和内容
													$("#resetProblem").val("");
													$("#login_name")
															.parent()
															.removeClass(
																	"has-error has-warning has-success");
													$("#helpSpanToInputName")
															.text("");
													$("#login_name")
															.parent()
															.addClass(
																	"has-error");
													$("#helpSpanToInputName")
															.text("未查询到该用户");
													$("#submitBtn_li").empty();
												}
											}
										});
							})
		});
		//用于给动态产生的按钮添加监听事件
		$(document).on("click","#submit_btn",function(){
			var resetAnswer=$("#resetAnswer").val();
			var user_name=$("#login_name").val();
			var dataRe=user_name+"-"+resetAnswer;
			$.ajax({
			      url: "${App_Path}/confirmResetAnswer",
			      type: "GET",
			      data:"dataRe="+dataRe,
			      success: function (data) {
			    		if (data.extend.re){
			    			alert("答案正确");
			    			
			    			var login_name=$("#login_name").val();
			    			$("#inputName_Reset").text(login_name);
			    			
			    			//此处弹出模态框
				  			$('#resetModel').modal({
				  				backdrop : "static"
				  			})
				  			
			    		}else{
			    			alert("答案错误");
			    		}
			      }
			});
		});
		//用于给确认修改按钮添加单击事件
		$("#deal_Reset").click(function(){
			var  Password=$("#inputPassword").val();
			var data_sig=$("#inputPasswordConfirm").attr("data-sig");
			var user_name=$("#inputName_Reset").text();
			var v=$.md5(Password);
			var re_ChagePassword=user_name+"-"+v;
			if(!Password){
				alert("密码不能为空"+Password);
				return false;
			}
			if(data_sig=='F'){
				alert("两次密码不一致");
				return false;
			}
			$.ajax({
			      url: "${App_Path}/changePassword",
			      type: "GET",
			      data:"re_ChagePassword="+re_ChagePassword,
			      success: function (data) {
			    		alert("修改成功");
			      }
			});
		})
		$("#inputPasswordConfirm").change(function(){
			var PasswordConfirm=$(this).val();
			var  Password=$("#inputPassword").val();
			if(Password==PasswordConfirm){
				//每次添加之前先清除之前的样式和内容
				$("#inputPassword")
						.parent()
						.removeClass(
								"has-error has-warning has-success");
				$("#inputPasswordConfirm")
				.parent()
				.removeClass(
						"has-error has-warning has-success");
				$("#helpSpanToinputPassword")
						.text("");
				$("#inputPassword")
						.parent()
						.addClass(
								"has-success");
				$("#inputPasswordConfirm")
				.parent()
				.addClass(
						"has-success");
				$("#helpSpanToinputPassword").text("密码一致");
				$("#inputPasswordConfirm").attr("data-sig","T");
			}
			if(Password!=PasswordConfirm){
				//每次添加之前先清除之前的样式和内容
				$("#inputPassword")
						.parent()
						.removeClass(
								"has-error has-warning has-success");
				$("#inputPasswordConfirm")
				.parent()
				.removeClass(
						"has-error has-warning has-success");
				$("#helpSpanToinputPassword")
						.text("");
				$("#inputPassword")
						.parent()
						.addClass(
								"has-error");
				$("#inputPasswordConfirm")
				.parent()
				.addClass(
						"has-error");
				$("#helpSpanToinputPassword").text("密码不一致");
				$("#inputPasswordConfirm").attr("data-sig","F");
			}
		})
	</script>
</body>


</html>