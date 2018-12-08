<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>员工列表</title>
<link rel="stylesheet"
	href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script
	src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

<%
	pageContext.setAttribute("App_Path", request.getContextPath());
%>
</head>
<body background="../images/background.jpg">
<!-- 查询学生考试时间的模态框 -->
	<div class="modal fade" id="empTestTimeModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel_TestTime">考试安排</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-md-2">
							<p class="form-control-static" id="inputName_TestTime"></p>
						</div>
					</div>
					
						<table class="table table-hover">
							<thead id="thead_Score">
							<tr>
							<th>科目</th>
							<th>考试时间</th>
							
						</tr>
							</thead>
							<tbody id="tbody_TestTime">
							
							</tbody>
							<tfoot id="tfoot_TestTime"></tfoot>
						</table>
					

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal"
						id="Close">Close</button>


				</div>

			</div>

		</div>
	</div>
<!-- 查询学生成绩的模态框 -->
	<div class="modal fade" id="empScoreModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel_Score">学生信息</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-md-2">
							<p class="form-control-static" id="inputName_Score"></p>
						</div>
					</div>
					
						<table class="table">
							<thead id="thead_Score">
							<tr>
							<th>科目</th>
							<th>成绩</th>
							<th>开课时间</th>
							<th>状态</th>
						</tr>
							</thead>
							<tbody id="tbody_Score">
							
							</tbody>
							<tfoot id="tfoot_score"></tfoot>
						</table>
					

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal"
						id="Close">Close</button>


				</div>

			</div>

		</div>
	</div>
	<!-- 学生修改的模态框 -->
	<div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel_Update">修改学生信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" action="#" id="form_Update">
						<div class="form-group">
							<label for="inputName" class="col-sm-2 control-label">emp_Name</label>
							<div class="col-sm-10">
								<p class="form-control-static" id="inputName_Update" ></p>
									<span  class="help-block" id="helpSpanToInputName_Update"></span>
							</div>
						</div>

						<div class="form-group">
							<label for="inputGender" class="col-sm-2 control-label">gender</label>
							<div class="col-sm-10">
								<label class="radio-inline"> <input type="radio"
									name="inlineRadioOptions" id="genderMan_Update" value="男" checked="checked"> 男
								</label> <label class="radio-inline"> <input type="radio"
									name="inlineRadioOptions" id="genderGirl_Update" value="女"> 女
								</label> <label class="radio-inline"> <input type="radio"
									name="inlineRadioOptions" id="genderOthers_Update" value="其他">
									其他
								</label>
							</div>
						</div>

						<div class="form-group">
							<label for="inputEmail" class="col-sm-2 control-label">Email</label>
							<div class="col-sm-10">
								<input type="email" class="form-control" id="inputEmail_Update" name="inputEmail"
									placeholder="Email@gmail.com">
									<span  class="help-block" id="helpSpanToinputEmail_Update"></span>
							</div>
						</div>
						<div class="form-group">
							<label for="inputDeptName" class="col-sm-2 control-label">DeptName</label>
							<div class="col-sm-4">
							<select class="form-control" id="inputDeptName_Update" name="inputDeptName" disabled="disabled">
								
							</select>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal" id="Close_Update">关闭</button>
					<button type="button" class="btn btn-default" data-dismiss="modal" id="Save_Update">更新</button>
				</div>
				
			</div>
			
		</div>
	</div>
	<div class="container">
	<nav class="navbar navbar-default navbar-static-top">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">${param.name}<span style="font-family:STXingkai ">@Zhiyi Technology</span></a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
     
      
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#" id="exit">
         <span class="glyphicon glyphicon-off" aria-hidden="true"></span>
        注销</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
           <span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
          功能 <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a  id="searchTestTime" >
            <span class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span>
           查询考试时间</a></li>
            <li role="separator" class="divider"></li>
            <li><a  id="empDeleBtn">
            <span class="glyphicon glyphicon-minus-sign" aria-hidden="true"></span>
            选课</a></li>
          </ul>
        </li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
		<!-- 用于存放表格数据 -->
		<div class="row">
			<div class="col-md-12">
				<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							
							<th>emp_id</th>
							<th>emp_name</th>
							<th>gender</th>
							<th>eamil</th>
							<th>dept_id</th>
							<th>dept_Name</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody id="tbody_basic">
						<tr id="tr_basic"></tr>
					</tbody>

				</table>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	var name="${param.name}";
	$(document).ready(function(){
		$.ajax({
			url : "${App_Path}/checkUser",
			data : "emp_name=" + name,
			type : "get",
			success : function(data) {
					console.log(data);
					var re=data.extend.result;
					if(re==false){
						showBasicInfo(name);
					}else{
						alert("用户还登录");
						window.location.href = 'login.jsp';
					}
			
			}
		});
	})
	
	function showBasicInfo(name){
		$.ajax({
			url : "${App_Path}/getStudentInfo",
			data : "name=" + name,
			type : "get",
			success : function(data) {
					var data_basicInfo=data.extend.emps[0];
					console.log(data_basicInfo);
					$("#tr_basic").append("<td>"+data_basicInfo.emp_id+"</td>");
					emp_id=data_basicInfo.emp_id;
					$("#tr_basic").append("<td>"+data_basicInfo.emp_name+"</td>");
					$("#tr_basic").append("<td>"+data_basicInfo.gender+"</td>");
					$("#tr_basic").append("<td>"+data_basicInfo.eamil+"</td>");
					$("#tr_basic").append("<td>"+data_basicInfo.dept_id+"</td>");
					$("#tr_basic").append("<td>"+data_basicInfo.dept_name+"</td>");
					$("#tr_basic" ).append("<button class='btn btn-primary btn-sm edit' data-edit='"+data_basicInfo.emp_name+"' data-edit_Emp_Name='"+data_basicInfo.emp_name+"'><span class='glyphicon glyphicon-pencil ' aria-hidden='true'></span>编辑</button>");
					$("#tr_basic").append("&nbsp;");
					$("#tr_basic" ).append("<button class='btn btn-info btn-sm score' data-score='"+data_basicInfo.emp_name+"'><span class='glyphicon glyphicon-list-alt' aria-hidden='true'></span>查成绩</button>");
			
			}
		});
	}
	//给动态产生的edit按钮添加点击事件
	$(document).on("click", ".edit", function() {
		//1.查出学生信息加入对话框
		var emp_name = $(this).attr("data-edit");
		//获取用户信息
		getCurrentInfo(emp_name);
		$("#inputDeptName_Update").empty();
		//向修改员工的部门列表中添加信息
		addDeptInfoToList("#inputDeptName_Update");
		
		$('#empUpdateModal').modal({
			backdrop : "static"
		})
	});
	//通过用户名获取用户信息
	function getCurrentInfo(name){
		$.ajax({
			url : "${App_Path}/getStudentInfo",
			data : "name=" + name,
			type : "get",
			success : function(data) {
				
					var data_basicInfo=data.extend.emps[0];
					$("#inputName_Update").text(data_basicInfo.emp_name);
					$("#inputEmail_Update").val(data_basicInfo.eamil);
					$("#empUpdateModal input[name=inlineRadioOptions]").val(
							[ data_basicInfo.gender ]);
					$("#inputDeptName_Update").val(
							[ data_basicInfo.dept_name ]);
			}
		});
	}
	//用于送ajax请求查出部门信息，添加的下拉框中
	function addDeptInfoToList(el) {
		$.ajax({
			url : "${App_Path}/getDeptInfo",
			type : "GET",
			success : function(data) {
				var data_basicInfo=data.extend.lStrings;
				//接下来就是添加部门信息到下拉列表 
				$.each(data_basicInfo,
						function(index, item) {
							$(el).append("<option>" + item.dept_name+"</option>");
						});

			}
		});
	}
	//用于给动态产生的查询成绩的按钮添加点击事件
	$(document).on("click", ".score", function() {
		var name = $(this).attr("data-score");
		$.ajax({
			url : "${App_Path}/getScoreInfo",
			type : "GET",
			data : "name=" + name,
			success : function(data) {
				console.log(data);
				$("#tbody_Score").empty();
				$("#tfoot_score").empty();
				var myArray = new Array();
				var count=0;
				$.each(data.extend.emps, function(index, item) {
					var score=item.score;
					var sta;
					count+=1;
					if(score<60){
						sta="不及格";
						myArray.push(score);
					}else if(score<80){
						sta="及格";
					}else if(score<90){
						sta="良好";
					}
					else {
						sta="优秀";
					}
					$("#inputName_Score").text(item.emp_name);
					$("#tbody_Score").append("<tr id='tr_Score"+index+"'></tr>");
					$("#tr_Score"+index).append("<td>"+item.cname+"</td>");
					$("#tr_Score"+index).append("<td>"+item.score+"</td>");
					$("#tr_Score"+index).append("<td>"+item.ctime+"</td>");
					$("#tr_Score"+index).append("<td>"+sta+"</td>");
				});
				var lowScoreNu=getArryLength(myArray);
				console.log("lowScoreNu="+lowScoreNu)
				var allScoreNu1=count*0.6;
				console.log("allScoreNu1="+allScoreNu1);
				var allScoreNu2=count*0.8;
				console.log("allScoreNu2="+allScoreNu2);
				var allScoreNu3=count*0.9;
				console.log("allScoreNu3="+allScoreNu3);
				if(lowScoreNu>=allScoreNu3){
					$("#tfoot_score").append("<tr><td><span style='color:red'>你的学习态度有极大问题，即将面临开除风险</span></td><tr>");
				}
				else if(lowScoreNu>=allScoreNu2){
					$("#tfoot_score").append("<tr><td><span style='color:red'>你的成绩特别差，等到辅导员通知谈话</span></td><tr>");
				}
				else if(lowScoreNu>=allScoreNu1){
					$("#tfoot_score").append("<tr><td><span style='color:red'>你的成绩较差，请多加努力</span></td><tr>");
				}else{
					$("#tfoot_score").append("<tr><td><span style='color:red'>你的成绩优秀，请再接再厉</span></td><tr>");
				}
			}
		});
		//此处弹出模态框
		$('#empScoreModal').modal({
			backdrop : "static"
		})
	});
	function getArryLength(arr){
		var t;
		var count=0;
		for (t in arr) {
			count+=1;
		}
		return count;
	}
	//用于给点击的查询成绩
	$("#Save_Update").click(function() {
					alert(emp_id);
					var emp_name = $("#inputName_Update").text();
					var gender = $('input:radio:checked').val();
					var eamil = $("#inputEmail_Update").val();
					var dept_name = $("#inputDeptName_Update").val();
					var strJson = '{"emp_id":"' + emp_id + '","emp_name":"'
							+ emp_name + '","gender":"' + gender
							+ '","eamil":"' + eamil + '","dept_name":"'
							+ dept_name + '"}';
					var re = confirm("确认修改【" + strJson + "】此学生的信息");
					if (!re) {
						return false;
					}
					var json_data = $.parseJSON(strJson);
					$.ajax({
						url : "${App_Path}/emp",
						type : "PUT",
						data : JSON.stringify(json_data),
						contentType : "application/json; charset=utf-8",
						dataType : "json",
						success : function(data) {

							alert("更新成功");
							//关闭模态框
							$('#empUpdateModal').modal("hide");
							//刷新当前页面.
							window.location.reload()
						}
					});
				});
	$("#searchTestTime").click(function(){
	
		$.ajax({
			url : "${App_Path}/getTestTime",
			type : "GET",
			data :"name="+name ,
			success : function(data) {
				$("#tbody_TestTime").empty();
				var name=data.extend.lTestTimes[0].emp_name;
				$("#inputName_TestTime").text(name);
				$.each(data.extend.lTestTimes,function(index,item){
					$("#tbody_TestTime").append("<tr id='tr_testTime"+index+"'></tr>");
					$("#tr_testTime"+index).append("<td>"+item.cname+"</td>");
					$("#tr_testTime"+index).append("<td>"+item.testTime+"</td>");
				})
				//此处弹出模态框
				$("#empTestTimeModal").modal({
					backdrop : "static"
				});
			}
			
		});
	});
	//给exit添加点击事件
	$("#exit").click(function(){
		window.location.href = 'login.jsp';
	})
	</script>
</body>
</html>