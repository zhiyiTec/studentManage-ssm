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
<script src="http://code.jquery.com/jquery-latest.js"></script>
<%
	pageContext.setAttribute("App_Path", request.getContextPath());
%>
</head>
<body>
	<div class="container">
		<!-- 用于显示标题栏 -->
		<div class="row">
			<div class="col-md-12">
				<h1><font style="font-family: STXingkai">致一科技@<span style="font-family: STXingkai;color: graytext;">Zhiyi Technology</span></font></h1>
			</div>
		</div>
		<!-- 用于放按钮 -->
		<div class="row">
			<div class="col-md-4 col-md-offset-8">
				<button class="btn btn-primary">新增</button>
				<button class="btn btn-danger">删除</button>
			</div>
		</div>
		<!-- 用于存放表格数据 -->
		<div class="row">
			<div class="col-md-12">
				<table class="table table-striped table-bordered table-hover">
					<tr>
						<th>emp_id</th>
						<th>emp_name</th>
						<th>gender</th>
						<th>eamil</th>
						<th>dept_id</th>
						<th>操作</th>
					</tr>
					<c:forEach items="${pageInfo.list }" var="emp">
						<tr>
							<td>${emp.emp_id}</td>
							<td>${emp.emp_name}</td>
							<td>${emp.gender}</td>
							<td>${emp.eamil}</td>
							<td>${emp.dept_id}</td>
							<td>
								<button class="btn btn-primary btn-sm">
									<span class="glyphicon glyphicon-pencil " aria-hidden="true"></span>
									编辑
								</button>
								<button class="btn btn-danger btn-sm">
									<span class="glyphicon glyphicon-trash " aria-hidden="true"></span>
									删除
								</button>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
		<!-- 用于显示分页信息 -->
		<div class="row">
			<!-- 分页文字信息 -->
			<div class="col-md-6">当前第${pageInfo.pageNum}页
				,总共${pageInfo.pages}页,共${pageInfo.total}条记录</div>
			<!-- 分页条-->
			<div class="col-md-6">
				<nav aria-label="Page navigation">
					<ul class="pagination">
						<li><a href="${App_Path }/emp?pn=1">首页</a></li>
						<c:if test="${pageInfo.hasPreviousPage }">
						<li><a href="${App_Path }/emp?pn=${pageInfo.pageNum-1}" aria-label="Previous"> <span
								aria-hidden="true">&laquo;</span>
						</a></li>
						</c:if>
						<c:forEach items="${pageInfo.navigatepageNums }" var="num">
							<c:if test="${num==pageInfo.pageNum}">
								<li class="active"><a href="${App_Path }/emp?pn=${num}">${num}</a></li>
							</c:if>
							<c:if test="${num!=pageInfo.pageNum}">
								<li><a href="${App_Path }/emp?pn=${num}">${num}</a></li>
							</c:if>
						</c:forEach>
						<c:if test="${pageInfo.isHasNextPage() }">
							<li><a href="${App_Path }/emp?pn=${pageInfo.pageNum+1}" aria-label="Next"> <span
								aria-hidden="true">&raquo;</span>
						</a></li>
						</c:if>
						<li><a href="${App_Path }/emp?pn=${pageInfo.pages}">末页</a></li>
					</ul>
				</nav>
			</div>
		</div>
	</div>
</body>
</html>