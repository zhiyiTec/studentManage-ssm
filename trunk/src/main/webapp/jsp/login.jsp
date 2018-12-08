<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>登录界面</title>
<link rel="stylesheet"
	href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script
	src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="http://www.veryhuo.com/uploads/Common/js/jQuery.md5.js"></script>
<style type="text/css">
.myModal-header{
	padding:6px 10px 6px 20px;
	background-color:black;
	border:0px;
	height:30px;
}
 
.myModal-body{
	padding:30px 40px 30px 40px;
	background-color:black;
	border-left:1px solid black;
	border-right:1px solid black;
}
 
.myModal-header-font{
	font-size:12px;
	color:#FFFFFF;
}
 
.myModal-header-close{
	color:white;
}
 
.myModal-select{
	appearance:none;
	-moz-appearance:none;
	-webkit-appearance:none;
	padding-right:10px;
	background:url("../css/images/newpic/chevron-down.png") no-repeat scroll right center transparent;
	background-position-x: 185px;
}
 
.myModal-input{
	background-color:black;
	border:1px solid #007DCF
}
 
.myModal-footer{
	background-color:black;
	border:1px solid #007DCF;
	border-top:none;
	padding:0px 15px 30px 15px;
}
</style>

<%
	pageContext.setAttribute("App_Path", request.getContextPath());
%>
</head>
<body background="../images/background_login.jpg"
	style="background-size: cover">
	<!--关于我们的模态框 -->
	<div class="modal fade" id="AboutModel" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document" style="width: 300px;height:270px;margin-left:30%;margin-top: 200px;">
	<div class="modal-content" >
	    <div class="modal-header myModal-header">
		<button type="button" class="close myModal-header-close" data-dismiss="modal" aria-hidden="true">&times;</button>
		<h4 class="modal-title myModal-header-font" id="myModalLabel">致一科技<span style="font-family: STXingkai;color:gray;font-size: 18.72px">@Zhiyi Technology</span></h4>
	    </div>
	    <div class="modal-body myModal-body">
	    		<p style="color:graytext;">Zhiyi Technology for Web
					Developers. Version: Photon Release (4.8.0) Build id: 20180619-1200

					(c) Copyright Zhiyi Technology contributors and others 2000, 2018. All
					rights reserved. Zhiyi Technology and the Zhiyi Technology logo are trademarks of the
					Zhiyi Technology Foundation, Inc., https://www.Zhiyi Technology.org/. The Zhiyi Technology
					logo cannot be altered without Zhiyi Technology's permission. Zhiyi Technology logos
					are provided for use under the Zhiyi Technology logo and trademark
					guidelines, https://www.Zhiyi Technology.org/logotm/. Oracle and Java are
					trademarks or registered trademarks of Oracle and/or its
					affiliates. Other names may be trademarks of their respective
					owners. This product includes software developed by other open
					source projects including the Apache Software Foundation,
					https://www.apache.org/.</p></div>
 
	        <div class="modal-footer myModal-footer">
		    <button type="button" class="btn btn-default" data-dismiss="modal" style="width:40px;height:24px;padding:1px;float:right;margin-right:150px;color:white;background-color:#1E253F;border:0px">取消
		    </button>
		    <button type="button" id="addTask" class="btn btn-primary" style="float:left;margin-left:30px;width:40px;height:24px;padding:1px">确定
		    </button>
		</div>
	    </div>
        </div>
</div>
	<!-- 注册用户的模态框 -->
	<div class="modal fade" id="ADDModel" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel_Reset">注册用户</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" action="#" id="form_Reset">
						<div class="form-group">
							<label for="inpuName_ADD" class="col-sm-2 control-label">用户名</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="inpuName_ADD"
									name="inpuName_ADD" data-signal="T" placeholder="用户名">
								<span class="help-block" id="helpSpanToinputName"></span>
							</div>
						</div>
						<div class="form-group">
							<label for="inputPassword" class="col-sm-2 control-label">密码</label>
							<div class="col-sm-4">
								<input type="password" class="form-control" id="inputPassword"
									name="inputPassword" placeholder="密码"> <span
									class="help-block" id="helpSpanToinputPassword"></span>
							</div>
						</div>
						<div class="form-group">
							<label for="inputPasswordConfirm" class="col-sm-2 control-label">确认密码</label>
							<div class="col-sm-4">
								<input type="password" class="form-control"
									id="inputPasswordConfirm" name="inputPasswordConfirm"
									data-sig="T" placeholder="确认密码">
							</div>
						</div>
						<div class="form-group">
							<label for="ResetQuestion" class="col-sm-2 control-label">密保</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="ResetQuestion"
									name="ResetQuestion" placeholder="密保">
							</div>
						</div>
						<div class="form-group">
							<label for="ResetQuestionAnwser" class="col-sm-2 control-label">答案</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="ResetQuestionAnwser"
									name="ResetQuestionAnwser" placeholder="答案">
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal"
						id="Close_Update">关闭</button>

					<button type="button" class="btn btn-default" data-dismiss="modal"
						id="deal_ADD">提交</button>
				</div>

			</div>

		</div>
	</div>
	<nav class="navbar navbar-inverse navbar-static-top">
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
					<li><a href="#">学生信息管理系统</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false"><span
							class="glyphicon glyphicon-menu-hamburger" aria-hidden="true">功能</span>
							<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="#" id="login_a"><span
									class="glyphicon glyphicon-ok-sign" aria-hidden="true"
									style="color: green">登录</span></a></li>
							<li role="separator" class="divider"></li>
							<li><a href="#" id="forgePassword_a"><span
									class="glyphicon glyphicon-remove-circle" aria-hidden="true"
									style="color: red">忘记密码</span></a></li>
							<li role="separator" class="divider"></li>
							<li><a href="#" id="registered_a"><span
									class="glyphicon glyphicon-plus-sign" aria-hidden="true">注册用户</span></a></li>
							<li role="separator" class="divider"></li>
							<li><a href="#" id="ABOUTUS"><span
									class="glyphicon glyphicon-info-sign" aria-hidden="true" style="color: purple">关于我们</span></a></li>
						</ul></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>
	<form class="form-inline" style="padding-top: 15%;">
		<div class="row">
			<div class="col-sm-4 col-md-offset-4">
				<span class="glyphicon glyphicon-user" aria-hidden="true"
					style="color: gray"></span> <label for="inputDeptName"
					style="color: white">用户名</label> <input type="text"
					class="form-control" id="login_name" placeholder="用户名">
			</div>
		</div>
	</form>
	<form class="form-inline" style="padding-top: 20px;">
		<div class="row">
			<div class="col-sm-4 col-md-offset-4">
				<span class="glyphicon glyphicon-lock" aria-hidden="true"
					style="color: red"></span> <label for="inputDeptName"
					style="color: red">密 &nbsp; &nbsp;码</label> <input type="password"
					class="form-control" id="login_password" placeholder="密码">
			</div>
		</div>
	</form>
	<form class="form-inline" style="padding-top: 20px;">
		<div class="row">
			<div class="col-sm-4 col-md-offset-4">
			<span class="glyphicon glyphicon-barcode" aria-hidden="true"
					style="color: green;"></span>
			<label for="code"
					style="color: green">验证码</label>
				<input type="text" id="code" name="code" class="form-control" placeholder="区分大小写"/>
				<span class="help-block" id="helpSpanToCode" data-sig="T"></span>         
			</div>
		</div>
		<div class="row">
			<div class="col-sm-4 col-md-offset-5" >
			<img id="imgObj" alt="验证码"
				src="${App_Path}/validateCode" onclick="changeImg()" />
				<a href="#" onclick="changeImg()" class="btn btn-default" style="background-color: black;color: graytext;">换一张</a>           
			</div>
		</div>
	</form>
	<script type="text/javascript">
	var code;
	var u=new Array();
		$(function() {
			//用于给登录标签添加单击事件
			$("#login_a").click(function() {
				confirmUsrInDb();
			});

			//用于给重置标签添加单击事件
			$("#forgePassword_a").click(function() {
				window.location.href = 'reset.jsp';
			});
		});
		//用于确定用户在数据库中是否存在，以及密码是否匹配
		function confirmUsrInDb() {
			var loginName = $("#login_name").val();
			var passWord = $("#login_password").val();
			var v=$.md5(passWord);
			//判断输入的用户名和密码是否为空
			if (!loginName && passWord) {
				alert("用户名为空");
				return false;
			}
			if (!passWord && loginName) {
				alert("密码为空");
				return false;
			}
			if (!passWord && !loginName) {
				alert("用户名和密码为空");
				return false;
			}
			if ($.trim(loginName) == "" || $.trim(passWord) == "") {
				alert("您输入的字符无效【温馨提示:请不要输入空格等违法 】");
				return false;
			}
			var data_sig=$("#helpSpanToCode").attr("data-sig");
			if(data_sig=="F"){
				alert("验证码输入错误");
				return false;
			}
			var data_login = loginName + "-" + v;
			$.ajax({
				url : "${App_Path}/confirm",
				data : "data_login=" + data_login,
				type : "GET",
				success : function(data) {
					console.log(data)
					if (data.extend.signal) {
						if(data.extend.LoginUserInfo.type==1){
							alert("用户【" + loginName + "】登录成功,您的身份为管理员");
							window.location.href = 'index3.jsp';
						}else{
							alert("用户【" + loginName + "】登录成功,您的身份为学生");
							window.location.href = 'index_Student.jsp?name='+loginName;
						}
						
					} else {
						alert("用户名或密码错误【温馨提示：如果您还未注册，请注册之后重新登录】");
					}
				}
			});

		}
		$("#registered_a").click(function() {
			$("#form_Reset")[0].reset();
			//此处弹出模态框
			$('#ADDModel').modal({
				backdrop : "static"
			})
		})
		$("#inpuName_ADD").change(
				function() {
					var user_name = $(this).val();
					$.ajax({
						url : "${App_Path}/judgeNameExits",
						type : "GET",
						data : "user_name=" + user_name,
						success : function(data) {
							if (data.extend.re) {
								$("#inpuName_ADD").parent().removeClass(
										"has-error has-warning has-success");
								$("#helpSpanToinputName").text("");
								$("#inpuName_ADD").parent().addClass(
										"has-success");
								$("#helpSpanToinputName").text("用户名可用");
							} else {
								$("#inpuName_ADD").parent().removeClass(
										"has-error has-warning has-success");
								$("#helpSpanToinputName").text("");
								$("#inpuName_ADD").parent().addClass(
										"has-error");
								$("#helpSpanToinputName").text("用户名已注册");
							}
						}
					});
				})
		//此处用于给提交按钮添加点击事件
		$("#deal_ADD").click(
				
				function() {
					
					var user_name = $("#inpuName_ADD").val();
					var password = $("#inputPassword").val();
					var ResetQuestion = $("#ResetQuestion").val();
					var ResetQuestionAnwser = $("#ResetQuestionAnwser").val();
					var password_md=$.md5(password);
					var dataRe_ADD = user_name + "-" + password_md + "-"
							+ ResetQuestion + "-" + ResetQuestionAnwser;
					
					var r = confirm("确认注册【" + user_name + "】");
					if (r == false) {
						return false
					}
					
					$.ajax({
								url : "${App_Path}/ADDUser",
								type : "GET",
								data : "dataRe_ADD=" + dataRe_ADD,
								success : function(data) {
									alert("用户【" + data.extend.login.user_name
											+ "】注册成功")
								}
							});
				})
				//刷新图片
			function changeImg() {
				var imgSrc = $("#imgObj");
				var src = imgSrc.attr("src");
				console.log("src="+src)
				imgSrc.attr("src", changeUrl(src));
				u.push(src);
			}
			//为了使每次生成图片不一致，即不让浏览器读缓存，所以需要加上时间戳
			function changeUrl(url) {
				var timestamp = (new Date()).valueOf();
				
				
				var index = url.indexOf("?", url);
				if (index > 0) {
					url = u[0];
				}
				if ((url.indexOf("&") >= 0)) {
					url = url + "×tamp=" + timestamp;
					console.log("url2="+url)
				} else {
					url = url + "?timestamp=" + timestamp;
					console.log("url3="+url)
				} 
				return url;
			}
			//用于校验验证码是否输入成功
		$("#code").change(function(){
			
			var codeRe=$(this).val();
			
			$.ajax({
				url : "${App_Path}/confimCode",
				type : "GET",
				success : function(data) {
					if(data.extend.code==codeRe){
						$("#code").parent().removeClass(
						"has-error has-warning has-success");
						$("#helpSpanToCode").text("");
						$("#code").parent().addClass(
						"has-success");
						$("#helpSpanToCode").text("验证成功");
						$("#helpSpanToCode").attr("data-sig","T");
					}else{
						$("#code").parent().removeClass(
						"has-error has-warning has-success");
						$("#helpSpanToCode").text("");
						$("#code").parent().addClass(
						"has-error");
						$("#helpSpanToCode").text("验证失败");
						$("#helpSpanToCode").attr("data-sig","F");
					}
					
				}
			});
		});
		//此处用于给关于我们添加点击事件
		$("#ABOUTUS").click(function() {
			//此处弹出关于我们模态框
			$('#AboutModel').modal({
				backdrop : "static"
			})
			})
			
	</script> 

</body>
</html>