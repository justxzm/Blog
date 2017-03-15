<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="db.ConnDb"%>
<%@ page import="java.sql.ResultSet"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Try.Catch</title>
<link href="../../css/bootstrap.min.css" rel="stylesheet">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
    <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.qrcode.min.js"></script>
</head>
<body>
	<nav class="navbar navbar-default navbar-inverse navbar-fixed-top"
		role="navigation">
	<div class="container">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="<%=basePath%>front_develop/index.jsp">Try.Catch</a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<form class="navbar-form navbar-right" role="search"
				action="../articleSearch.jsp">
				<div class="form-group">
					<input type="text" class="form-control" placeholder="Search"
						name="search">
				</div>
				<button type="submit" class="btn btn-primary">Submit</button>
			</form>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid --> </nav>

	<article class="container" style="margin-top: 66px">
	<div class="row">
		<div class="col-md-9">
			<div class="alert alert-info alert-dismissible" role="alert">
				<button type="button" class="close" data-dismiss="alert">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>
				<strong>欢迎使用二维码生成工具,格式如  (http://www.justxzm.cn)</strong>
			</div>
			<div class="input-group">
				<input type="text" class="form-control" id="codeUrl"
					placeholder="输入网址   |   文字内容"> <span
					class="input-group-btn">
					<button class="btn btn-default" onclick="createCode()">生成</button>
				</span>
			</div>
				<%
				String url=new String(request.getParameter("url").getBytes("iso-8859-1"),"utf-8");
				if(url.equals("null")){
				
				}else{
					%>
					<div id="qrcode" class="well"></div>
					<%
				}
			%>
			<script type="text/javascript">
			var url;
			function createCode() {
				var urlGet = document.getElementById('codeUrl');
				var url2=urlGet.value;
				window.location.href='qrcode.jsp?url='+url2;
			}
			$('#qrcode').qrcode({
				text :"<%=url%>",
				width : 310,
				height : 310
			});
			</script>
		</div>
		<div class="col-md-3">
			<jsp:include page="../rightPart.jsp"></jsp:include>
		</div>
	</article>

	<footer class="container">
	<hr class="divider" />
	<p class="pull-right">
		<a href="#top">回到顶部</a>
	</p>

	<p class="foot">
		<a href="http://www.miitbeian.gov.cn" target="_blank">苏ICP备16050234号</a>
		Copyright © 2016-2026 All Rights Reserved
	</p>
	</footer>
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="../../js/bootstrap.min.js"></script>
</body>
</html>