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
<script type="text/javascript">
	function showContact() {
		document.getElementById("contact").setAttribute('class',
				'btn btn-info btn-lg disabled');
		document.getElementById("contact").innerHTML = "justxzm@163.com";
	}
	function changeText() {
		document.getElementById("sendEmail").setAttribute('class',
				'btn btn-info disabled');
		document.getElementById("signInBtn").setAttribute('class',
				'btn btn-default disabled');
		document.getElementById("sendEmail").innerHTML = "邮件正在发送...";
		setTimeout(sendEmail, 1500);
	}
	function sendEmail() {
		document.getElementById("sendEmail").setAttribute('class',
				'btn btn-success disabled');
		document.getElementById("sendEmail").innerHTML = "邮件已发送!";
		window.location.href = '../sendEmail';
	}
</script>

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
			<a class="navbar-brand" href="#" data-toggle="modal"
				data-target="#myModal">Try.Catch</a>
		</div>


		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="false">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">后台登录</h4>
					</div>
					<div class="modal-body">

						<form class="form-horizontal" role="form" id="signIn"
							action="../loginServlet" method="post">
							<div class="form-group">
								<label for="inputEmail3" class="col-sm-2 control-label">UserName</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="inputEmail3"
										name="username" placeholder="UserName">
								</div>
							</div>
							<div class="form-group">
								<label for="inputPassword3" class="col-sm-2 control-label">Password</label>
								<div class="col-sm-10">
									<input type="password" class="form-control" id="inputPassword3"
										name="password" placeholder="Password">
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-10">
									<div class="checkbox">
										<label> <input type="checkbox"> Remember me
										</label>
									</div>
								</div>
							</div>
						</form>


					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-default" form="signIn"
							id="signInBtn">Sign in</button>
						<button type="button" class="btn btn-primary" id="sendEmail"
							onclick="changeText()">Forget?</button>
					</div>
				</div>
			</div>
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
			<div class="jumbotron">
				<h1>No,Throw!</h1>
				<p>我很懒，网站很烂，没有前台，没有美工，全bootstrap堆叠，无技巧，不动脑，我是Try.Catch,我为码农带盐。</p>
				<p>
					<a class="btn btn-primary btn-lg" href="#" role="button"
						id="contact" onclick="showContact()">联系我~</a>
				</p>
			</div>
			<%
				ConnDb con = new ConnDb();
				ResultSet rs = con.getSelect("select * from article order by newDate desc");
				int count = 0;
				while (rs.next()) {
			%>
			<div class="panel panel-info">
				<div class="input-group" >
					<div class="panel-heading" style="width:333px;overflow: hidden; text-overflow: ellipsis; -o-text-overflow: ellipsis; white-space: nowrap;">
						<a style="text-decoration: none; color: #000000"
							href="articleContent.jsp?id=<%=rs.getInt("id")%>">
								<%=rs.getString("title")%>
						</a>
					</div>

					<span class="input-group-btn">
						<button class="btn btn-default" type="button"
							style="border: none;"
							onclick="javascript:window.location.href='articleContent.jsp?id=<%=rs.getInt("id")%>';">Go!</button>
					</span>
				</div>
				<!-- /input-group -->

			</div>
			<%
				++count;
					if (count == 8) {
						break;
					}
				}
			%>
		</div>
		<div class="col-md-3">
			<jsp:include page="rightPart.jsp"></jsp:include>
		</div>
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