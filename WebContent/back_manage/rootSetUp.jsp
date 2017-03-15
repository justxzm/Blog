<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="db.ConnDb"%>
<%@ page import="java.sql.ResultSet"%>
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
</head>
<body style="margin-top: 10px">
	<div class="container" style="width:66%">
		<div class="alert alert-warning alert-dismissible" role="alert">
			<button type="button" class="close" data-dismiss="alert">
				<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
			</button>
			<strong>最高权限设置</strong>
		</div>
		<%
			ConnDb con = new ConnDb();
			ResultSet rs = con.getSelect("select * from admin");
			if (rs.next()) {
		%>
		<form class="form-horizontal" role="form" action="../updateRoot?oldUserName=<%=rs.getString("userName") %>" method="post">
			<div class="form-group">
			
				<label for="inputEmail3" class="col-md-1 control-label">UserName</label>
				<div class="col-md-11">
					<input type="text" class="form-control" id="inputEmail3" name="userName"
						value="<%=rs.getString("userName")%>" placeholder="UserName">
				</div>
			</div>
			<div class="form-group">
				<label for="inputEmail3" class="col-md-1 control-label">Password</label>
				<div class="col-md-11">
					<input type="password" class="form-control" id="inputEmail3" name="password"
						value="<%=rs.getString("password")%>" placeholder="Password">
				</div>
			</div>
			<div class="form-group">
				<label for="inputPassword3" class="col-md-1 control-label">Email</label>
				<div class="col-md-11">
					<input type="email" class="form-control" id="inputPassword3" name="email"
						value="<%=rs.getString("email")%>" placeholder="Email">
				</div>
			</div>
			<div class="form-group">
				<div class="col-md-offset-1 col-md-11">
					<div class="checkbox">
						<label> <input type="checkbox"> Remember me
						</label>
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="col-md-offset-1 col-md-11">
					<button type="submit" class="btn btn-primary">Save</button>
					</a>
				</div>
			</div>
		</form>
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