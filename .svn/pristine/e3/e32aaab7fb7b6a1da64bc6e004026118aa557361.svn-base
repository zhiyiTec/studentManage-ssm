<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>学生列表</title>
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
	<!-- 查询学生的模态框 -->
	<div class="modal fade" id="empSearchModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel_Search">学生信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" action="#" id="form_Search">
						<div class="form-group">
							<label for="inputName" class="col-sm-2 control-label">emp_Name</label>
							<div class="col-sm-10">
								<p class="form-control-static" id="inputName_Search"></p>

							</div>
						</div>

						<div class="form-group " id="radioUpdate">
							<label for="inputGender" class="col-sm-2 control-label">gender</label>
							<div class="col-sm-10">
								<label class="radio-inline"> <input type="radio"
									name="inlineRadioOptions" id="genderMan_Search" value="男"
									checked="checked" disabled> 男
								</label> <label class="radio-inline"> <input type="radio"
									name="inlineRadioOptions" id="genderGirl_Search" value="女"
									disabled> 女
								</label> <label class="radio-inline"> <input type="radio"
									name="inlineRadioOptions" id="genderOthers_Search" value="其他"
									disabled> 其他
								</label>
							</div>
						</div>

						<div class="form-group">
							<label for="inputEmail" class="col-sm-2 control-label">Email</label>
							<div class="col-sm-10">
								<p class="form-control-static" id="inputEmail_Search"></p>
							</div>
						</div>
						<div class="form-group">
							<label for="inputDeptName" class="col-sm-2 control-label">DeptName</label>
							<div class="col-sm-4">
								<p class="form-control-static" id="inputEmail_DeptName"></p>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal"
						id="deal_Search">点击进行操作（修改或者删除）</button>

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
								<p class="form-control-static" id="inputName_Update"></p>
								<span class="help-block" id="helpSpanToInputName_Update"></span>
							</div>
						</div>

						<div class="form-group">
							<label for="inputGender" class="col-sm-2 control-label">gender</label>
							<div class="col-sm-10">
								<label class="radio-inline"> <input type="radio"
									name="inlineRadioOptions" id="genderMan_Update" value="男"
									checked="checked"> 男
								</label> <label class="radio-inline"> <input type="radio"
									name="inlineRadioOptions" id="genderGirl_Update" value="女">
									女
								</label> <label class="radio-inline"> <input type="radio"
									name="inlineRadioOptions" id="genderOthers_Update" value="其他">
									其他
								</label>
							</div>
						</div>

						<div class="form-group">
							<label for="inputEmail" class="col-sm-2 control-label">Email</label>
							<div class="col-sm-10">
								<input type="email" class="form-control" id="inputEmail_Update"
									name="inputEmail" placeholder="Email@gmail.com"> <span
									class="help-block" id="helpSpanToinputEmail_Update"></span>
							</div>
						</div>
						<div class="form-group">
							<label for="inputDeptName" class="col-sm-2 control-label">DeptName</label>
							<div class="col-sm-4">
								<select class="form-control" id="inputDeptName_Update"
									name="inputDeptName">

								</select>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal"
						id="Close_Update">关闭</button>
					<button type="button" class="btn btn-default" data-dismiss="modal"
						id="Save_Update">更新</button>
				</div>

			</div>

		</div>
	</div>
	<!-- 学生添加的模态框 -->
	<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">新增学生信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" action="#" id="form">
						<div class="form-group">
							<label for="inputName" class="col-sm-2 control-label">emp_Name</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="inputName"
									name="inputName" data-m="success" placeholder="姓名"> <span
									class="help-block" id="helpSpanToInputName"></span>
							</div>
						</div>

						<div class="form-group">
							<label for="inputGender" class="col-sm-2 control-label">gender</label>
							<div class="col-sm-10">
								<label class="radio-inline"> <input type="radio"
									name="inlineRadioOptions" id="genderMan" value="男"
									checked="checked"> 男
								</label> <label class="radio-inline"> <input type="radio"
									name="inlineRadioOptions" id="genderGirl" value="女"> 女
								</label> <label class="radio-inline"> <input type="radio"
									name="inlineRadioOptions" id="genderOthers" value="其他">
									其他
								</label>
							</div>
						</div>

						<div class="form-group">
							<label for="inputEmail" class="col-sm-2 control-label">Email</label>
							<div class="col-sm-10">
								<input type="email" class="form-control" id="inputEmail"
									name="inputEmail" placeholder="Email@gmail.com"> <span
									class="help-block" id="helpSpanToinputEmail"></span>
							</div>
						</div>
						<div class="form-group">
							<label for="inputDeptName" class="col-sm-2 control-label">DeptName</label>
							<div class="col-sm-4">
								<select class="form-control" id="inputDeptName"
									name="inputDeptName">

								</select>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal"
						id="Close">Close</button>
					<button type="button" class="btn btn-default" data-dismiss="modal"
						id="Save">Save</button>
				</div>

			</div>

		</div>
	</div>


	<div class="container">


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
					<a class="navbar-brand" href="#">致一科技<span
						style="font-family: STXingkai">@Zhiyi Technology</span></a>
				</div>

				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">

					<form class="navbar-form navbar-left" action="#">
						<div class="form-group">
							<input type="text" id="searchInput"
								placeholder="please Enter emp_Name" />
						</div>
						<button id="myButton_Search" data-loading-text="Loading..."
							class="btn btn-default" autocomplete="off">查询</button>
					</form>
					<ul class="nav navbar-nav navbar-right">
						<li><a href="#" id="exit"> <span
								class="glyphicon glyphicon-off" aria-hidden="true"></span> 注销
						</a></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false"> <span class="glyphicon glyphicon-cog"
								aria-hidden="true"></span> 功能 <span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a id="empAddBtn" onclick="addEmp()"> <span
										class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span>
										新增
								</a></li>
								<li role="separator" class="divider"></li>
								<li><a id="empDeleBtn"> <span
										class="glyphicon glyphicon-minus-sign" aria-hidden="true"></span>
										删除
								</a></li>
							</ul></li>
					</ul>
				</div>
				<!-- /.navbar-collapse -->
			</div>
			<!-- /.container-fluid -->
		</nav>
		<!-- 用于存放表格数据 -->
		<div class="row">
			<div class="col-md-12">
				<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th><input type="checkbox" id="check_ALl" /></th>
							<th>emp_id</th>
							<th>emp_name</th>
							<th>gender</th>
							<th>eamil</th>
							<th>dept_id</th>
							<th>dept_Name</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody id="tbody_data">

					</tbody>

				</table>
			</div>
		</div>
		<!-- 用于显示分页信息 -->
		<div class="row">
			<!-- 分页文字信息 -->
			<div class="col-md-6" id="PageInfo"></div>
			<!-- 分页导航条-->
			<div class="col-md-6" id="PageNav"></div>
		</div>
	</div>
	<script type="text/javascript">
		var pageTotal;
		var pages;
		//用于存储当前页码
		var pageNumber;
		var empId;
		var AddToSerachModelData;
		//1.页面加载完成之后直接发送一个ajax请求，来获取分页数据：
		$(function() {
			//默认跳转到首页
			toPage(1);
		});
		//用于跳转页面
		function toPage(pn) {
			$("#searchInput").val("");
			$("#myButton_Search").text('点击查询');
			$.ajax({
				url : "${App_Path}/emp",
				data : "pn=" + pn,
				type : "get",
				success : function(data) {
					//获取成功之后要做的第一件事情就是：解析并显示学生数据
					showEmpMesage(data);
					//获取成功之后要做的第二件事情就是：解析并显示分页信息
					showPageInfo(data);
					//获取成功之后要做的第三件事情就是：解析并显示分页条
					showPageNav(data);
				}
			});
		}
		//解析显示学生信息
		function showEmpMesage(data) {
			//每一次构建之前先把数据清空
			$("#tbody_data").empty();
			//此处的写法应该根据浏览器显示的数据进行编写
			var emp = data.extend.pageInfo.list;
			$
					.each(
							emp,
							function(index, item) {
								$("#tbody_data").append("<tr id='tr"+index+"'></tr>");
								$("#tr" + index)
										.append(
												"<td><input type='checkbox' class='check_item' data-checkBoxName='"+item.emp_name+"' data-checkBoxId='"+item.emp_id+"'/></td>");
								$("#tr" + index).append(
										"<td>" + item.emp_id + "</td>");
								$("#tr" + index).append(
										"<td>" + item.emp_name + "</td>");
								$("#tr" + index).append(
										"<td>" + item.gender + "</td>");
								$("#tr" + index).append(
										"<td>" + item.eamil + "</td>");
								$("#tr" + index).append(
										"<td>" + item.dept_id + "</td>");
								$("#tr" + index).append(
										"<td>" + item.dept_name + "</td>");
								$("#tr" + index).append(
										"<td id='bu"+index+"'></td>");
								$("#bu" + index)
										.append(
												"<button class='btn btn-primary btn-sm edit' data-edit='"+item.emp_id+"' data-edit_Emp_Name='"+item.emp_name+"'><span class='glyphicon glyphicon-pencil ' aria-hidden='true'></span>编辑</button>");
								$("#bu" + index).append("  ");

								$("#bu" + index)
										.append(
												"<button class='btn btn-danger btn-sm delete' data-delete='"+item.emp_id+"' data-delete_Emp_Name='"+item.emp_name+"'><span class='glyphicon glyphicon-trash ' aria-hidden='true'></span>删除</button>");
								$("#bu" + index).append("  ");
								$("#bu" + index)
										.append(
												"<button class='btn btn-info btn-sm score' data-score='"+item.emp_id+"' data-score_Emp_Name='"+item.emp_name+"'><span class='glyphicon glyphicon-list-alt' aria-hidden='true'></span>查成绩</button>");
							});
		}

		//解析显示分页信息
		function showPageInfo(data) {
			//每一次构建之前先把数据清空
			$("#PageInfo").empty();
			$("#PageInfo").append(
					"当前第" + data.extend.pageInfo.pageNum + "页 ,总共"
							+ data.extend.pageInfo.pages + "页,共"
							+ data.extend.pageInfo.total + "条记录");
			pageNumber = data.extend.pageInfo.pageNum

		}
		//解析显示分页条,并且能够可以点击下一页并跳转到对应的页面
		function showPageNav(data) {
			//每一次构建之前先把数据清空
			$("#PageNav").empty();
			$("#PageNav")
					.append(
							"<nav aria-label='Page navigation'><ul class='pagination'></ul></nav>");
			if (data.extend.pageInfo.pageNum > 1) {
				$(".pagination").append(
						"<li onclick='toPage(" + 1
								+ ")'><a href='#'>首页</a></li>");
			}
			//上一页的值
			var prevoiuePage = data.extend.pageInfo.pageNum - 1;
			if (data.extend.pageInfo.hasPreviousPage) {
				$(".pagination")
						.append(
								"<li onclick='toPage("
										+ prevoiuePage
										+ ")'><a href='#' aria-label='Previous'> <span aria-hidden='true'>&laquo;</span></a></li>");
			}
			$.each(data.extend.pageInfo.navigatepageNums,
					function(index, item) {
						if (item == data.extend.pageInfo.pageNum) {
							$(".pagination").append(
									"<li class='active '><a href='#'>" + item
											+ "</a></li>");
						}
						if (item != data.extend.pageInfo.pageNum) {
							$(".pagination").append(
									"<li onclick='toPage(" + item
											+ ")'><a href='#'>" + item
											+ "</a></li>");
						}

					});
			//下一页的值
			var nextPage = data.extend.pageInfo.pageNum + 1;
			if (data.extend.pageInfo.hasNextPage) {
				$(".pagination")
						.append(
								"<li onclick='toPage("
										+ nextPage
										+ ")'><a href='#' aria-label='Next'><span aria-hidden='true'>&raquo;</span></a></li>");
				//末页的值
				var lastPage = data.extend.pageInfo.pages;
				var total = data.extend.pageInfo.total;
				pageTotal = lastPage;
				pages = lastPage;
				$(".pagination").append(
						"<li onclick='toPage(" + lastPage
								+ ")'><a href='#'>末页</a></li>");
			}

		}
		//用于弹出新增学生的模态框的点击事件
		function addEmp() {
			//在模态框弹出之前，先发送ajax请求查出部门信息，添加的下拉框中
			$("#form")[0].reset();

			$("#inputEmail").parent().removeClass(
					"has-error has-warning has-success");
			$("#inputName").parent().removeClass(
					"has-error has-warning has-success");
			$("#inputDeptName").empty();
			addDeptInfoToList("#inputDeptName");
			//此处弹出模态框
			$('#empAddModal').modal({
				backdrop : "static"
			})
		}
		//用于送ajax请求查出部门信息，添加的下拉框中
		function addDeptInfoToList(el) {
			$.ajax({
				url : "http://localhost:8080/wxservice/depts",
				type : "GET",
				success : function(data) {
					//接下来就是添加部门信息到下拉列表 
					$.each(data.extend.depts,
							function(index, item) {
								$(el).append(
										"<option>" + item.dept_name
												+ "</option>");
							});

				}
			});
		}

		function sub() {
			// jquery 表单提交   
			$("#formId").ajaxSubmit(function(message) {
				// 对于表单提交成功后处理，message为返回内容   
			});

			return false; // 必须返回false，否则表单会自己再做一次提交操作，并且页面跳转   
		}

		//给学生姓名的输入框绑定事件来检测其内容是否发生改变
		$("#inputName").change(
				function() {
					//获取当前输入框中的值
					var emp_name = this.value;
					//一旦改变就立刻发送ajax请求来判断用户名是否可用
					$.ajax({
						url : "http://localhost:8080/wxservice/checkUser",
						data : "emp_name=" + emp_name,
						type : "POST",
						success : function(data) {
							if (data.extend.result) {
								//每次添加之前先清除之前的样式和内容
								$("#inputName").parent().removeClass(
										"has-error has-warning has-success");
								$("#helpSpanToInputName").text("");
								$("#inputName").parent()
										.addClass("has-success");
								$("#helpSpanToInputName").text("用户名可用");
								$("#inputName").attr("data-m", "success");

							} else {
								//每次添加之前先清除之前的样式和内容
								$("#inputName").parent().removeClass(
										"has-error has-warning has-success");
								$("#helpSpanToInputName").text("");
								$("#inputName").parent().addClass("has-error");
								$("#helpSpanToInputName").text("用户名已经注册");
								//此处就是为了在提交时判断会否可以提交
								$("#inputName").attr("data-m", "fail");
							}
						}
					});
				})
		$("#Save")
				.click(
						function() {
							var emp_name = $("#inputName").val();
							var gender = $('#empAddModal input:radio:checked')
									.val();

							var eamil = $("#inputEmail").val();
							var dept_name = $("#inputDeptName").val();
							var strJson = '{"emp_name":"' + emp_name
									+ '","gender":"' + gender + '","eamil":"'
									+ eamil + '","dept_name":"' + dept_name
									+ '"}';
							var json_data = $.parseJSON(strJson);
							//校验name
							var regName = /(^[a-zA-Z0-9_-]{1,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
							if (!regName.test(emp_name)) {
								//添加 .has-warning、.has-error 或 .has-success 类到这些控件的父元素即可
								//每次添加之前先清除之前的样式和内容
								$("#inputName").parent().removeClass(
										"has-error has-warning has-success");
								$("#helpSpanToInputName").text("");
								$("#inputName").parent().addClass("has-error");
								$("#helpSpanToInputName").text(
										"用户名输入a-z或者A-Z或者2-5位中文");
								alert("用户名输入a-z或者A-Z或者2-5位中文");
								return false;
							} else {
								$("#inputName").parent()
										.addClass("has-success");
							}
							//此处是为了判断如果用户的数据输入有问题时，禁止其提交的设置
							var ajaxValidate = $("#inputName").attr("data-m");

							if (ajaxValidate == 'fail') {
								alert("用户名已经被注册");
								return false;
							}
							var r = confirm("确认提交【" + JSON.stringify(json_data)
									+ "】此学生信息");
							if (r == false) {
								return false
							}

							$
									.ajax({
										url : "${App_Path}/addEmp",
										type : "POST",
										data : JSON.stringify(json_data),
										contentType : "application/json; charset=utf-8",
										dataType : "json",
										success : function(data) {
											var emp_name = data.extend.emp.emp_name;
											alert("添加学生【" + emp_name + "】信息成功");
											$('#empAddModal').modal("hide");
											toPage(100000);
										}
									});
						});

		//用于给动态产生的按钮添加点击事件
		$(document).on("click", ".edit", function() {
			//1.查出学生信息加入对话框
			var emp_id = $(this).attr("data-edit");
			empId = emp_id;
			//alert(empId);
			getCurrentInfo(emp_id);
			$("#inputDeptName_Update").empty();
			addDeptInfoToList("#inputDeptName_Update");
			getCurrentInfo(emp_id);
			$('#empUpdateModal').modal({
				backdrop : "static"
			})
		})

		function getCurrentInfo(emp_id) {

			$.ajax({
				url : "${App_Path}/empOnly",
				type : "GET",
				data : "emp_id=" + emp_id,
				success : function(data) {
					$("#inputName_Update").text(data.extend.emp.emp_name);
					$("#inputEmail_Update").val(data.extend.emp.eamil);
					$("#empUpdateModal input[name=inlineRadioOptions]").val(
							[ data.extend.emp.gender ]);
					$("#inputDeptName_Update").val(
							[ data.extend.emp.dept_name ]);
				}
			});
		}

		//用于实现更新按钮的功能
		$("#Save_Update").click(
				function() {
					var emp_id = empId;
					var emp_name = $("#inputName_Update").text();
					var gender = $('#empUpdateModal input:radio:checked').val();
					
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
							//跳转到当前页面
							toPage(pageNumber);
						}
					});
				});

		//用于给动态产生的删除按钮添加点击事件
		$(document).on("click", ".delete", function() {
			var emp_id = $(this).attr("data-delete");
			var emp_Name = $(this).attr("data-delete_Emp_Name")
			var re = confirm("确认要删除【" + emp_Name + "】这条用户的信息");
			if (!re) {
				return false;
			}
			$.ajax({
				url : "${App_Path}/deleteEmp",
				type : "POST",
				data : "emp_id=" + emp_id,
				success : function(data) {

					alert("删除成功");
					//关闭模态框
					$('#empUpdateModal').modal("hide");
					//跳转到当前页面
					toPage(pageNumber);
				}
			});
		});

		//完成全选/全不选的功能
		$("#check_ALl").click(function() {
			//使用attr获取checked的值是undifined,所以定义原声的属性使用pop获取值
			//$(this).attr("checked");
			$(".check_item").prop("checked", $(this).prop("checked"));
		});
		$(document).on("click", ".check_item", function() {
			//先判断当前选中的元素是否是5个
			var checkBoxNu_Checked = $(".check_item:checked").length;//此处用于获取选中的复选框的个数
			var checkBoxNu_Item = $(".check_item").length;//此处用于获取当前页面的复选框的个数

			if (checkBoxNu_Checked >= checkBoxNu_Item) {
				$("#check_ALl").prop("checked", true);
			} else {
				$("#check_ALl").prop("checked", false);
			}
		});
		//实现删除多个学生的按钮功能
		$("#empDeleBtn").click(
				function() {
					var checkBox_Checked = $(".check_item:checked");//此处用于获取选中的复选框
					var emp_nameAsSelected = "";
					var emp_idAsSelected = "";
					var count = 0;
					$.each(checkBox_Checked, function() {
						emp_nameAsSelected += $(this).attr("data-checkBoxName")
								+ ",";//用于获取每一个按钮的name值
						emp_idAsSelected += $(this).attr("data-checkBoxId")
								+ "-";
						count += 1;
					});
					//去除emp_nameAsSelected中多余的逗号
					var emp_nameAsSelectedSub = emp_nameAsSelected.substring(0,
							emp_nameAsSelected.length - 1);
					
					var con = confirm("确认删除【" + emp_nameAsSelectedSub + "】这"
							+ count + "个学生吗");
					if (con == false) {
						return false;
					}
					$.ajax({
						url : "${App_Path}/deleteEmpMultiple",
						type : "POST",
						data : "emp_idAsSelected=" + emp_idAsSelected,
						success : function(data) {
							alert("删除成功");
							//关闭模态框
							$('#empUpdateModal').modal("hide");
							//跳转到当前页面
							toPage(pageNumber);
						}
					});
				});

		//用于实现查询用户的功能
		$('#myButton_Search').on('click', function() {

			var $btn = $(this).text('loading');
			var emp_Name = $("#searchInput").val();
			$.ajax({
				url : "${App_Path}/searchEmpByName",
				type : "POST",
				data : "emp_Name=" + emp_Name,
				success : function(data) {
					console.log(data);
					if (data.extend.map.message == "No") {
						alert("未查询到该用户");
					} else {
						addToSearchModel(data);
						//此处弹出模态框
						$('#empSearchModal').modal({
							backdrop : "static"
						})

					}

				}
			});

		});
		//用于向查询用户的模态框中添加值
		function addToSearchModel(data) {
			$("#inputName_Search").text(data.extend.Emp.emp_name);
			$("#empSearchModal input[name=inlineRadioOptions]").val(
					[ data.extend.Emp.gender ]);
			$("#inputEmail_Search").text(data.extend.Emp.eamil);
			$("#inputEmail_DeptName").text(data.extend.Emp.dept_name);
			AddToSerachModelData = data;
		}
		//用于给查询模态框中的操作按钮添加点击事件
		$("#deal_Search").click(function() {
			showSearchEmpInfo(AddToSerachModelData, 1);
			$("#searchInput").val("");
			$("#myButton_Search").text('点击查询');
		})
		//用于显示查询到的用户信息
		function showSearchEmpInfo(data, index) {
			$("#tbody_data").empty();
			$("#tbody_data").append("<tr id='tr"+index+"'></tr>");
			$("#tr" + index)
					.append(
							"<td><input type='checkbox' class='check_item' data-checkBoxName='"+data.extend.Emp.emp_name+"' data-checkBoxId='"+data.extend.Emp.emp_id+"'/></td>");
			$("#tr" + index).append("<td>" + data.extend.Emp.emp_id + "</td>");
			$("#tr" + index)
					.append("<td>" + data.extend.Emp.emp_name + "</td>");
			$("#tr" + index).append("<td>" + data.extend.Emp.gender + "</td>");
			$("#tr" + index).append("<td>" + data.extend.Emp.eamil + "</td>");
			$("#tr" + index).append("<td>" + data.extend.dept_id + "</td>");
			$("#tr" + index).append(
					"<td>" + data.extend.Emp.dept_name + "</td>");
			$("#tr" + index).append("<td id='bu"+index+"'></td>");
			$("#bu" + index)
					.append(
							"<button class='btn btn-primary btn-sm edit' data-edit='"+data.extend.Emp.emp_id+"' data-edit_Emp_Name='"+data.extend.Emp.emp_name+"'><span class='glyphicon glyphicon-pencil ' aria-hidden='true'></span>编辑</button>");
			$("#bu" + index).append("  ");

			$("#bu" + index)
					.append(
							"<button class='btn btn-danger btn-sm delete' data-delete='"+data.extend.Emp.emp_id+"' data-delete_Emp_Name='"+data.extend.Emp.emp_name+"'><span class='glyphicon glyphicon-trash ' aria-hidden='true'></span>删除</button>");
			$("#bu" + index)
					.append(
							"<button class='btn btn-info btn-sm score' data-score='"+data.extend.Emp.emp_id+"' data-score_Emp_Name='"+data.extend.Emp.emp_name+"'><span class='glyphicon glyphicon-list-alt' aria-hidden='true'></span>查成绩</button>");

		}
		//用于给注销按钮添加单击事件
		$("#exit").click(function() {
			window.location.href = 'login.jsp';
		})
		//用于给动态产生的查询成绩的按钮添加点击事件
		$(document).on("click", ".score", function() {
			var name = $(this).attr("data-score_Emp_Name");
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
						$("#tfoot_score").append("<tr><td><span style='color:red'>此学生的学习态度有极大问题，请直接开除</span></td><tr>");
					}
					else if(lowScoreNu>=allScoreNu2){
						$("#tfoot_score").append("<tr><td><span style='color:red'>此学生的成绩特别差，请通知辅导员谈话</span></td><tr>");
					}
					else if(lowScoreNu>=allScoreNu1){
						$("#tfoot_score").append("<tr><td><span style='color:red'>此学生的成绩较差</span></td><tr>");
					}else{
						$("#tfoot_score").append("<tr><td><span style='color:red'>此学生的成绩优秀</span></td><tr>");
					}
				}
			});
			//此处弹出模态框
			$('#empScoreModal').modal({
				backdrop : "static"
			})
		});
		//此处用于数组判空
		function isEmptyObject(e) {
			var t;
			for (t in e) {
				return !1;
			}
			return !0;
		}
		function getArryLength(arr){
			var t;
			var count=0;
			for (t in arr) {
				count+=1;
			}
			return count;
		}
	</script>
</body>
</html>