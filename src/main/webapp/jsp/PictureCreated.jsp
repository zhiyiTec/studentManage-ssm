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

<%
	pageContext.setAttribute("App_Path", request.getContextPath());
%>
</head>
<body>
<body background="../images/background.jpg">
	<div class="form-group  col-lg-6">
		    <label for="id" class="col-sm-4 control-label">        
			验证码:     </label>    
		<div class="col-sm-8">
			        <input type="text" id="code" name="code" class="form-control"
				style="width: 250px;" />  
				<img id="imgObj" alt="验证码"
				src="${App_Path}/validateCode" onclick="changeImg()" />
				<a href="#" onclick="changeImg()" class="btn btn-default" style="background-color: black;color: graytext;">换一张</a>           
			         
		</div>
	</div>

	<script type="text/javascript">
		// 刷新图片
			function changeImg() {
				var imgSrc = $("#imgObj");
				var src = imgSrc.attr("src");
				console.log("src="+src)
				imgSrc.attr("src", changeUrl(src));
			}
			//为了使每次生成图片不一致，即不让浏览器读缓存，所以需要加上时间戳
			function changeUrl(url) {
				var timestamp = (new Date()).valueOf();
				var index = url.indexOf("?", url);
				if (index > 0) {
					url = url.substring(0, url.indexOf(url, "?"));
				}
				if ((url.indexOf("&") >= 0)) {
					url = url + "×tamp=" + timestamp;
				} else {
					url = url + "?timestamp=" + timestamp;
				}
				return url;
			}
		
	</script>
</body>


</html>