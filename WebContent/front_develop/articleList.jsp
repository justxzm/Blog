<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="db.ConnDb"%>
<%@ page import="java.sql.ResultSet"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Try.Catch</title>
<link href="../css/bootstrap.min.css" rel="stylesheet">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
    <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
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
			<a class="navbar-brand" href="index.jsp">Try.Catch</a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<form class="navbar-form navbar-right" role="search"
				action="articleSearch.jsp">
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
			<div class="alert alert-warning alert-dismissible" role="alert">
				<button type="button" class="close" data-dismiss="alert">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>
				<strong>欢迎加入<a href="http://www.xmgc360.com/"
					class="alert-link">高博</a>!
				</strong> 好吧，我是一条广告，可以把我关了。
			</div>
			<table class="table table-hover table-striped">
				<thead>
					<tr>
						<th>文章名</th>
						<th>作者</th>
						<th>日期</th>
					</tr>
				</thead>
				<tbody>
					<%
						ConnDb con = new ConnDb();
						ResultSet rs = con.getSelect("select * from article order by newDate desc");
						while (rs.next()) {
					%>
					<tr>
						<td><a style="text-decoration: none; color: #000000"
							href="articleContent.jsp?id=<%=rs.getInt("id")%>"><%=rs.getString("title")%></a></td>
						<td><%=rs.getString("author")%></td>
						<td><%=rs.getString("newDate")%></td>
					</tr>
					<%
						}
					%>
				</tbody>

			</table>
		</div>
		<div class="col-md-3">
			<jsp:include page="rightPart.jsp"></jsp:include>
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
	<script src="../js/bootstrap.min.js"></script>
</body>
</html>