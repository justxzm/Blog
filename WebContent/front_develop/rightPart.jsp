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
<title></title>
<link href="../css/bootstrap.min.css" rel="stylesheet">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
    <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
   <script type="text/javascript" src="tools/js/jquery.min.js"></script>
    <script type="text/javascript">
    	$(document).ready(function(){
    		$("#test").click(function(){
    			$("#test1").slideToggle("slow");
    		});
    	});
    </script>
</head>
<body>
	<div class="panel panel-warning">
		<!-- Default panel contents -->
		<div class="panel-heading">小工具</div>
		<!-- List group -->
		<ul class="list-group">
			<li class="list-group-item"><a
				style="text-decoration: none; color: #000000;"
				href="<%=basePath%>front_develop/tools/qrcode.jsp?url=null">二维码生成</a></li>
			<li class="list-group-item"><a
				style="text-decoration: none; color: #000000;"
				href="<%=basePath%>front_develop/tools/watermark.jsp?url=null&oldUrl=null&newUrl=null">图片加水印</a></li>
			<li class="list-group-item">待开发...</li>
			<li class="list-group-item">待开发...</li>
			<li class="list-group-item">待开发...</li>
		</ul>
	</div>
	<div class="panel panel-warning">
		<div class="panel-heading">所有博客</div>
		<div class="panel-body">
			<div
				style="overflow: hidden; text-overflow: ellipsis; -o-text-overflow: ellipsis; white-space: nowrap;">
				<a style="text-decoration: none; color: #000000;"
					href="<%=basePath%>front_develop/articleList.jsp">Click Me :)</a>
			</div>
		</div>
	</div>
	<div class="panel panel-warning">
		<div class="panel-heading">最新评论</div>
		<%
			ConnDb con = new ConnDb();
			ResultSet rs = con.getSelect("select * from comment order by date desc");
			if (rs.next()) {
		%>
		<div class="panel-body">
			<div
				style="overflow: hidden; text-overflow: ellipsis; -o-text-overflow: ellipsis; white-space: nowrap;">
				<a style="text-decoration: none; color: #000000;"
					href="<%=basePath%>front_develop/articleContent.jsp?id=<%=rs.getInt("articleId")%>"><%=rs.getString("content")%></a>
			</div>
		</div>
		<%
			} else {
		%>
		<div class="panel-body">
			<div
				style="overflow: hidden; text-overflow: ellipsis; -o-text-overflow: ellipsis; white-space: nowrap;">
				<a style="text-decoration: none; color: #000000;" href="">暂无评论</a>
			</div>
		</div>
		<%
			}
		%>
	</div>
	<div class="panel panel-warning">

		<div class="panel-heading" id="test">推荐排行榜</div>
		<%
			rs = con.getSelect("select * from article order by commentNumber desc,newDate desc");
			if (rs.next()) {
		%>
		<div class="panel-body" id="test1">
			<div
				style="overflow: hidden; text-overflow: ellipsis; -o-text-overflow: ellipsis; white-space: nowrap;">
				<a style="text-decoration: none; color: #000000;"
					href="<%=basePath%>front_develop/articleContent.jsp?id=<%=rs.getInt("id")%>"><%=rs.getString("title")%></a>
			</div>
		</div>
		<%
			} else {
		%>
		<div class="panel-body">
			<div
				style="overflow: hidden; text-overflow: ellipsis; -o-text-overflow: ellipsis; white-space: nowrap;">
				<a style="text-decoration: none; color: #000000;" href="">暂无博客</a>
			</div>
		</div>
		<%
			}
		%>
	</div>
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="../js/bootstrap.min.js"></script>
</body>
</html>